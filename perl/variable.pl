use 5.010;
use strict;
use warnings;

#주석은 #으로 적을 수 있습니다.

my $number = 1; 					#Scala형 : 하나의 값만 존재. 하나의 값만 있을 경우 스칼라형
my @lists  = (1,2,3, "치즈", "사과"); #vector형(list) : 배열의 크기를 늘릴 수 있다.
my %person =(  						#Hash형 : 객체
	name => "치즈",
	height => 173,);

print "number: \$ $number\n"; 			# ""와는 달리 ''는 그대로 출력해준다. \는 특수문자 출력시 사용한다. \n은 줄바꾸기

say "이 사람의 이름은 ". $person{name} . "이며, 키는 ". $person{height} . "입니다."; # say는 자동으로 줄이 나눠짐

print "\@lists의 첫번째 요소는 ".$lists[0]."입니다.\n";
print "@lists\n";
printf "현재 숫자는 %2d입니다. \n", $number; # f는 format을 의미
printf "이 사람의 이름은 %s 이며, 키는 %d 입니다. \n", $person{name}, $person{height};
