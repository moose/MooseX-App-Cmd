#!perl -T

use strict;
use warnings;
use Test::More;

eval "use Mouse";
plan skip_all => 'Mouse required to test Mouse usage' if $@;
plan tests => 1;

use lib 't/lib';
use Test::MyAny::Mouse;
my $cmd = new_ok('Test::MyAny::Mouse');
