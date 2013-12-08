#!perl -T

use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
SKIP: {
    eval { require Moose };
    skip 'Moose required to test Moose usage', 2 if $@;
    use_ok('Test::MyAny::Moose');
    my $cmd = new_ok('Test::MyAny::Moose');
}
