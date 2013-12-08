#!perl -T

use strict;
use warnings;
use Test::More tests => 2;

use lib 't/lib';
SKIP: {
    eval { require Mouse };
    skip 'Mouse required to test Mouse usage', 2 if $@;
    use_ok('Test::MyAny::Mouse');
    my $cmd = new_ok('Test::MyAny::Mouse');
}
