#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

binmode "STDOUT", ":encoding(cp949)";
binmode "STDIN", ":encoding(cp949)";

my $input = <STDIN>;# 표준 입력 방식, <>는 파일 핸들을 가져온다.
chomp($input);
print_hello($input);

sub print_hello {
    #c언어랑 달리 인자번호를 쓰지 않는다.
    my $name = $_[0];	
    printf "%s씨, 안녕하세요!\n", $name;

}