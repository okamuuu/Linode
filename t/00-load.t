#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'DancePod::Web' );
}

diag( "Testing DancePod::Web $DancePod::Web::VERSION, Perl $], $^X" );
