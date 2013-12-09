#!perl -T

use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
SKIP: {
    skip 'Mouse and MouseX::Getopt required to test Mouse usage', 2
        if not eval { require Mouse; require MouseX::Getopt; 1 }
        or $@;
    use_ok('Test::MyAny::Mouse');
    my $cmd = new_ok('Test::MyAny::Mouse');
}
