#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Object::Nano' ) || print "Bail out!\n";
}

diag( "Testing Object::Nano $Object::Nano::VERSION, Perl $], $^X" );
