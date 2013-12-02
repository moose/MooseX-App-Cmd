#!perl -T

use strict;
use warnings;
use Test::More;

eval "use Moose";
plan skip_all => 'Moose required to test Moose usage' if $@;
plan tests => 1;

use lib 't/lib';
use Test::MyAny::Moose;
my $cmd = new_ok('Test::MyAny::Moose');
