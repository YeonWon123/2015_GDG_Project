# if문 시작
use 5.010;
use strict;
use warnings;
my $value = 1; #0, '0', "0" 따위는 거짓, 나머지는 다 참으로 인식

say '$value는 참입니다.' if $value ==1;
say '$value는 참입니다.' if ($value ==1);



$value = "치즈";

if ($value eq "치즈") {
	say '이것도 참이네요.';
}

$value = 0;

if ($value) {
	say "이게 참이라니, 그럴 리 없어요!";
} else {
		say "당연히 이건 거짓이죠!";
}
