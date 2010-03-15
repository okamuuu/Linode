#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Perl6::Say;
use Data::Dumper;
use Data::Dump qw(dump);
use Devel::Size qw(size total_size);
use FindBin qw($Bin);
use Path::Class qw/dir file/;
use File::Slurp;
use lib dir($Bin, '..', 'lib')->stringify;
use Shaq::Unit::MT;
use Shaq::Unit::FTP;
use Shaq::Unit::Config;
use Shaq::Model::Tab;
use Shaq::Model::Bread;
use Shaq::CMS::Manager;

my %argv;
use App::Options(
    values => \%argv,
    option => {
        write  => "type=boolean",
        upload => "type=boolean",
    },
);

my $config  = Shaq::Unit::Config->instance( app_name => 'linode' );
my $mt      = Shaq::Unit::MT->new;
my $tab     = Shaq::Model::Tab->new( $config->{model}->{tab} );
my $manager = Shaq::CMS::Manager->new( $config->{cms} );

if ( $argv{write} ) {

    my $site = $manager->doc2site;

    for my $category ( $site->categories ) {
  
        ### Shaq::Model::Tab 
        $tab->current( $category->dirname );

        for my $archive ( $category->archives ) {

            my $bread = Shaq::Model::Bread->new;
            
            if ( $category->dirname ne 'home' ) {
                $bread->add( { dir => $category->dirname , name => $category->dirname  } );
            }
            
            $bread->add( { dir => 'dummy' , name => $archive->title  } );

            my $xhtml = $mt->render_file(
                'archive.mt',
                {
                    is_home => $category->dirname eq 'home',
                    site_name => 'How to Linode',
                    tab     => $tab,
                    bread   => $bread,
                    menus   => $category->menus,
                    archive => $archive,
                }
            );

            my $filename = $archive->basename . ".html";

            my $target =
              $category->dirname eq 'home'
              ? file( $manager->root_dir, $filename )->stringify
              : file( $manager->root_dir, $category->dirname, $filename )->stringify;

            File::Slurp::write_file( $target, $xhtml );
        }
    }

    $manager->backup;
    print "write and backup!!\n";
}

if ( $argv{upload} ) {

    my $ftp = Shaq::Unit::FTP->new($config->{unit}->{ftp});

    my $remote_root_dir   = dir( '/',  'linode_jp', 'root' );
    my $remote_backup_dir = dir( '/',  'linode_jp', 'backup' );

    $ftp->upload($manager->root_dir,$remote_root_dir);
    for my $dir ( $manager->root_dir->children ) {
        next unless $dir->is_dir;
        $ftp->upload( $dir, dir( $remote_root_dir, $dir->dir_list(-1) ) );
    }

    $ftp->upload($manager->backup_dir,$remote_backup_dir);
    print "upload!!\n";
}


