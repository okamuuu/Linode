#!/usr/bin/perl
use strict;
use warnings;
use Test::Differences;
use Test::Declare;
use DancePod::Api::WebService::Youtube;

plan tests => blocks;

describe 'test' => run {

    my $yt;
    init { $yt = DancePod::Api::WebService::Youtube->new };

    test 'isa ok' => run {
        isa_ok $yt, 'DancePod::Api::WebService::Youtube';
    };

    test 'can ok' => run {
        can_ok( $yt, 'user2row' );
    };

    test 'user2row' => run {
        is_deeply $yt->user2row('okamuuuuu'),
          {
            display_fg  => 1,
            gender      => 'm',
            location    => 'JP',
            music       => undef,
            thum_height => 67,
            thum_width  => 88,
            thumbnail   => 'http://s.ytimg.com/yt/img/no_videos_140-vfl121214.png',
            title       => 'okamuuuuu Channel',
            username    => 'okamuuuuu',
          };

    };

    cleanup { $yt = undef };
};


