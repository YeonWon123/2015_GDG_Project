#!/usr/bin/env perl
use utf8;
use 5.010;
use strict;
use warnings;

# 현재 시간을 나타냅니다.
use DateTime;

my $dt = DateTime->now;
$dt->set_time_zone( 'Asia/Seoul' );
my $day_abbr = $dt->day_abbr;
#say $day_abbr;
my $hour = $dt->hour;
my $minute = $dt->minute;
# say $hour;


# 토요일일 때 
if($day_abbr eq "Sat") {

		# HTTP 클라이언트 모듈을 사용합니다.
		use LWP::UserAgent; 
		use JSON;
		# 새 LWP::UserAgent 인스턴스를 만듭니다.
		my $ua = LWP::UserAgent->new(); # 괄호 기입은 자유
		# 접속할 사이트를 입력받습니다.
		# print "Insert URL:";
		my $website = "http://openapi.seoul.go.kr:8088/434d4d665532313937387173466e59/json/SearchSTNTimeTableByFRCodeService/1/1000/738/2/1/";

		my $response = $ua->get($website);

		# 요청이 성공했을 때
		if ($response->is_success) {
			my $result = $response->decoded_content;
			my $data   = from_json($result, {utf8 => 1});
			my @rows   = @{$data->{SearchSTNTimeTableByFRCodeService}->{row}};
			my $count  = 0;

			print "숭실대입구역에 곧 도착할 상행선 열차 목록은 다음과 같습니다.\\n";

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
			
				say "이상으로 숭실대입구역에 곧 도착할 상행선 열차 목록 안내를 마칩니다.";

		} else {
			# 그렇지 않을 때
			die "요청에 실패했습니다! X(";
		}

} 

# 일요일일 때
		elsif ($day_abbr eq "Sun") { 
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
				my $count  = 0;

				print "숭실대입구역에 곧 도착할 상행선 열차 목록은 다음과 같습니다.\\n";

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
				
					say "이상으로 숭실대입구역에 곧 도착할 상행선 열차 목록 안내를 마칩니다.";

			} else {
				# 그렇지 않을 때
				die "요청에 실패했습니다! X(";
			}
} 



 # 평일일 때
		else
			{
				# HTTP 클라이언트 모듈을 사용합니다.
			use LWP::UserAgent; 
			use JSON;
			# 새 LWP::UserAgent 인스턴스를 만듭니다.
			my $ua = LWP::UserAgent->new(); # 괄호 기입은 자유
			# 접속할 사이트를 입력받습니다.
			# print "Insert URL:";
			my $website = "http://openapi.seoul.go.kr:8088/434d4d665532313937387173466e59/json/SearchSTNTimeTableByFRCodeService/1/1000/738/1/1/";

			my $response = $ua->get($website);

			# 요청이 성공했을 때
			if ($response->is_success) {
				my $result = $response->decoded_content;
				my $data   = from_json($result, {utf8 => 1});
				my @rows   = @{$data->{SearchSTNTimeTableByFRCodeService}->{row}};
				my $count  = 0;

				print "숭실대입구역에 곧 도착할 상행선 열차 목록은 다음과 같습니다.\\n";

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
				
					say "이상으로 숭실대입구역에 곧 도착할 상행선 열차 목록 안내를 마칩니다.";

			} else {
				# 그렇지 않을 때
				die "요청에 실패했습니다! X(";
			}
}