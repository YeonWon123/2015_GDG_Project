#/usr/bin/perl
@words = qw(camel llama alpaca);
print "What is your name?";
$name = <STDIN>;
chomp($name);
if($name eq "Randal") {
	print "Hello, $name!\n"; #일반적인 인사
	print "What is the secret word?";
	$guess = <STDIN>;
	chomp($guess);
	$i = 0; #이 단어를 먼저 시도
	$correct = "maybe"; #추측이 맞는가, 틀리는가?
	while($correct eq $guess){ #맞출 때까지 점검을 계속
		if ($words[$i] eq $guess) { #맞는가?
			$correct = "yes"; #그렇다
		} elsif ($i < 2) {    #살펴볼 단어가 더 있는가?
			$i = $i + 1;	  #다음 번에 다음 단어를 봄
		} else {  # 더 이상 단어 없음, 잘못된 것임
			print "Wrong, try again. What is the secret word?";
			$guess = <STDIN>;
			chomp ($guess);
			$i = 0; # 첫 단어부터 다시 점검을 시작
		}
	} # while의 끝
} # "not Randal"의 끝