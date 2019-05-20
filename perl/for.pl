#for문

use 5.010;
use strict;
use warnings;


say '*' x $_ for (1..5);
say '*' x $_ for (reverse 1..5);



my @list = (1, 2, 3, 1.5, "치즈", "사과");
say $_ for @list;



# 전통적인 C-Style의 for문
#for (my $i = 0; $i < 5; $i++) {
#	for (my $j =0; $j <= $i; $j++) {
#		print "*";
#	}
#	say '';
#} 

#print "다시는 그러지 않겠습니다.\n" x 100; # 알파벳 x는 반복

#for my $i (1..5) {
#	for (1..$i) {
#		print;  # print 뒤에 $_를 넣으면 숫자로, '*'을 넣으면 별로 나온다
#	}
#	say '';
#}