#!perl -T

use strict;
use warnings;
use Test::More tests => 1;
use lib 't/lib';
use Test::MyAny::Mouse;
my $cmd = new_ok('Test::MyAny::Mouse');
