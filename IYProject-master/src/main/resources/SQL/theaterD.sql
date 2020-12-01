
alter table theaterD add constraint td_fk_email foreign key (email) references tbl_inyeon_user(email);
drop table theaterD;
insert into theaterD(td_no,email,td_title,td_viewdays,td_agegrade, td_runtime,td_actor,td_stgrade1,td_stprice1,td_tinfo,td_mainposter,td_detailposter,td_tiketingdate,td_check,td_signUp_date) 
values(td_seq.nextval,'wlghksl12@daum.net','테스트 연극5','2020.10.06~2020.10.14','전체 이상 관람가','2시간','윤혜진,신효창,신지환,이건희,김영모','전석','10000','그냥 말','C://~~','게시판 내용',1,'1',sysdate);

select * from	(select email,td_title,td_viewdays,td_agegrade,td_check,td_signUp_date from (select * from theaterD	order by td_signUp_date asc))


create table basictheater(
 td_no int primary key, -- 기본정보테이블을 구분하는 시퀀스 값
 email varchar2(100) not null, --이메일 
 td_title varchar2(500) not null, --제목
 td_viewdays varchar2(100) not null, --상영기간
 td_agegrade varchar2(100) not null, --등급(~세 이상 관람가)
 td_actor varchar2(1000) not null, --출연진
 td_tinfo varchar2(2000) not null, --공연시간안내 --설명
 td_mainposter varchar2(4000) not null, --메인포스터
 td_detailposter varchar2(4000) not null, --게시판내용(상세이미지 등)
 td_ticketinginfo varchar2(200), --1회시간 (해당 날짜 제목)
 td_check char not null, --게시글 승인 확인 // 등급 0 // 취소 1 // 대기 2 확인
 td_signUp_date date,  -- 승인 요청 날짜
 td_location varchar2(200) not null--시,도
)
--번호(td_no) 이메일(email) 제목(td_title) 상영기간(td_viewdays) 등급(td_agegrade), 출연진(td_actor),
--공연시간 안내(td_tinfo),메인포스터(td_mainposter),게시판 내용(td_detailposter),1회 시간(td_ticketinginfo),
--게시글 승인 확인(td_check), 승인요청 날짜(td_signUp_date), 시도(td_location)

create table ticketingInfo(
 td_no int, -- 기본정보테이블을 참조하는 값(외래키)
 ticketing_no int primary key,
 td_runtime varchar2(100) not null, --관람시간   > 2020.08.13 14.00~16.00
 td_stgrade varchar2(100) not null, --좌석 등급  > 자유석
 td_stprice varchar2(100) not null --좌석가격     > 13000
)
drop table ticketingInfo;
drop table basictheater;

alter table ticketingInfo add constraint fk_td_no foreign key(td_no) references basictheater(td_no);
alter table basictheater add constraint fk_td_email foreign key(email) references tbl_inyeon_user(email);
--외래키 제약조건 추가
create sequence seq_td_no--기본정보 연극 정보 테이블 시퀀스
start with 1
increment by 1
nocache

create sequence seq_ticketing_no --연극 테이블의 예매 정보 테이블 시퀀스
start with 1
increment by 1
nocache
--번호 이메일 제목 상영기간 등급 출연진,공연시간 안내,메인포스터,게시판 내용,1회 시간,게시글 승인 확인, 승인요청 날짜, 시도
insert into basictheater values 
update BASICTHEATER set td_location='서울특별시' where td_location='서울';
--번호(td_no) 이메일(email) 제목(td_title) 상영기간(td_viewdays) 등급(td_agegrade), 출연진(td_actor),
--공연시간 안내(td_tinfo),메인포스터(td_mainposter),게시판 내용(td_detailposter),1회 시간(td_ticketinginfo),
--게시글 승인 확인(td_check), 승인요청 날짜(td_signUp_date), 시도(td_location)


select * from ticketingInfo;










