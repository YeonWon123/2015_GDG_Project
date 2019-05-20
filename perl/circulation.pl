#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

my $input = <STDIN>;

if ($input =~ /!calc (\d+)\s*([+\-*\/])\s*(\d+)/){
	print "$1 $2 $3 = ";	
	my $result =0;

	$result = eval("$1 $2 $3");

	#eval("say $1 $2 $3");

	#$result = $1 + $3 if $2 eq "+";
	#$result = $1 - $3 if $2 eq "-";
	#$result = $1 * $3 if $2 eq "*";
	#$result = $1 / $3 if $2 eq "/";
	say "$result";


}