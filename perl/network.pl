#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

# 현재 시간을 나타냅니다.
use DateTime;

my $dt = DateTime->now;
$dt->set_time_zone( 'Asia/Seoul' );
my $hour = $dt->hour;
# say $hour;

# HTTP 클라이언트 모듈을 사용합니다.
use LWP::UserAgent; 
use JSON;
# 새 LWP::UserAgent 인스턴스를 만듭니다.
my $ua = LWP::UserAgent->new(); # 괄호 기입은 자유
# 접속할 사이트를 입력받습니다.
# print "Insert URL:";
my $website = "http://openapi.seoul.go.kr:8088/434d4d665532313937387173466e59/json/SearchSTNTimeTableByFRCodeService/1/1000/738/3/1/";

my $response = $ua->get($website);

# 요청이 성공했을 때
if ($response->is_success) {
	my $result = $response->decoded_content;
	my $data   = from_json($result, {utf8 => 1});
	my @rows   = @{$data->{SearchSTNTimeTableByFRCodeService}->{row}};

		for my $timedata (@rows) {

		my $ARRIVETIMES = $timedata->{ARRIVETIME};

		if ($ARRIVETIMES =~ /(\d*):(\d*):(\d*)/) {
			my $value = $1;
			if ($value == $hour) {
				say $timedata->{ARRIVETIME} . " ~ " . $timedata->{LEFTTIME} . " : " . $timedata->{SUBWAYENAME} . "행"; 
			}
		}

#		say $timedata->{ARRIVETIME} . " ~ " . $timedata->{LEFTTIME} . " : " . $timedata->{SUBWAYENAME} . "행"; 
	}
} else {
	# 그렇지 않을 때
	die "요청에 실패했습니다! X(";
}