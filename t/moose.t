#!perl -T

use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
SKIP: {
    skip 'Moose and MooseX::Getopt required to test Moose usage', 2
        if not eval { require Moose; require MooseX::Getopt; 1 }
        or $@;
    use_ok('Test::MyAny::Moose');
    my $cmd = new_ok('Test::MyAny::Moose');
}
