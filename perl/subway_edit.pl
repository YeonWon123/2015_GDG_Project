#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

# 현재 시간을 나타냅니다.
use Encode qw/encode decode/;
use DateTime;
# HTTP 클라이언트 모듈을 사용합니다.
use LWP::UserAgent; 
use JSON;

# Perl에서의 상수는 함수처럼 만들어요!
# 함수 끝에서 return 키워드가 없이 값만 적어도 return 됩니다! 
sub DAY_NORMAL { 1 }
sub DAY_SAT    { 2 }
sub DAY_SUN    { 3 }

sub DIR_UP   { 1 }
sub DIR_DOWN { 2 }

my $dt = DateTime->now;
$dt->set_time_zone( 'Asia/Seoul' );
my $day_abbr = $dt->day_abbr;
#say $day_abbr;
my $hour = $dt->hour;
my $minute = $dt->minute;
# say $hour;
my $message = "!전철하행";
my $direction;
if ($message =~ /!전철([상하])행/) {
	$direction = ($1 eq "상") ? DIR_UP : DIR_DOWN;
}

my $website;
if ($day_abbr eq "Sat") {
	# 토요일!
	$website = generate_url($direction, DAY_SAT);
} elsif ($day_abbr eq "Sun") {
	# 일요일!
	$website = generate_url($direction, DAY_SUN);
} else {
	# 평일!
	$website = generate_url($direction, DAY_NORMAL);
}


# 새 LWP::UserAgent 인스턴스를 만듭니다.
my $ua = LWP::UserAgent->new(); # 괄호 기입은 자유
# 접속할 사이트를 입력받습니다.
# print "Insert URL:";

my $response = $ua->get($website);

# 요청이 성공했을 때
if ($response->is_success) {
	my $result = $response->decoded_content;
	my $data   = from_json($result, {utf8 => 1});
	my @rows   = @{$data->{SearchSTNTimeTableByFRCodeService}->{row}};
	my $count  = 0;

	print "숭실대입구역에 곧 도착할 ".(($direction == DIR_UP) ? "상행" : "하행")." 열차 목록은 다음과 같습니다.\\n";

	for my $timedata (@rows) {

		my $ARRIVETIMES = $timedata->{ARRIVETIME};

		if ($ARRIVETIMES =~ /(\d*):(\d*):(\d*)/) {
			my $value1 = $1;
			my $value2 = $2;
			if ($value1 == $hour) {
				if ($value2 >= $minute) {
					print $timedata->{ARRIVETIME} . " ~ " . $timedata->{LEFTTIME} . " : " . $timedata->{SUBWAYENAME} . "행\\n"; 
					++$count;	
#					if (++$count >= 5) {
#					last;
#					}
				}
			}			
		}
	}

	for my $timedata (@rows) {

		my $ARRIVETIMES = $timedata->{ARRIVETIME};

		if ($ARRIVETIMES =~ /(\d*):(\d*):(\d*)/) {
			my $value1 = $1;
			my $value2 = $2;
			if ($count < 5){
				if ($value1 > $hour) {
					print $timedata->{ARRIVETIME} . " ~ " . $timedata->{LEFTTIME} . " : " . $timedata->{SUBWAYENAME} . "행\\n"; 
					if (++$count >= 5) {
						last;
						}
					}
				}
			}			
		}
	
		say "이상으로 숭실대입구역에 곧 도착할 ".(($direction == DIR_UP) ? "상행" : "하행")." 열차 목록 안내를 마칩니다.";

} else {
	# 그렇지 않을 때
	die "요청에 실패했습니다! X(";
}

sub generate_url {
	my $direction = $_[0];
	my $day = $_[1]; 

	my $url_base = "http://openapi.seoul.go.kr:8088/434d4d665532313937387173466e59/json/SearchSTNTimeTableByFRCodeService/1/1000/738/%d/%d/";
	return sprintf($url_base, $day, $direction);
}