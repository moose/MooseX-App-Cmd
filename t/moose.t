#!perl -T

use strict;
use warnings;
use Test::More tests => 1;
use lib 't/lib';
use Test::MyAny::Moose;
my $cmd = new_ok('Test::MyAny::Moose');
