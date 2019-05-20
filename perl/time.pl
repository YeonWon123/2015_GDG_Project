#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

use DateTime;

my $dt = DateTime->now;
$dt->set_time_zone( 'Asia/Seoul' );
my $hour = $dt->hour;
say $hour;