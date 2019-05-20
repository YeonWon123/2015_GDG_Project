#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use utf8;

use Encode qw/encode decode/;

my $message = decode "utf8", $ARGV[0];
my $count   = 0;
srand(time);

if ($message =~ /!랜덤\s+(.+)/) 
{
	my @words = split " ", $1;
	my $num   = int(rand(scalar @words));
	say $words[$num];
}