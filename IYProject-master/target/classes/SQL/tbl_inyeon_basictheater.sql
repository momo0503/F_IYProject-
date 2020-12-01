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
 td_check char not null, --게시글 승인 확인 // 등급 0 취소  1대기 2 확인
 td_signUp_date date,  -- 승인 요청 날짜
 td_location varchar2(200) not null--시,도
)

create table ticketingInfo(
 td_no int, -- 기본정보테이블을 참조하는 값(외래키)
 ticketing_no int primary key,
 td_runtime varchar2(100) not null, --관람시간   > 2020.08.13 14.00~16.00
 td_stgrade varchar2(100) not null, --좌석 등급  > 자유석
 td_stprice varchar2(100) not null --좌석가격     > 13000
)
update basictheater set td_check='1'

delete basictheater;

insert into ticketingInfo values(10,seq_ticketing_no.nextval,'2020.08.13 14.00~16.00','자유석','10000')
drop table ticketingInfo;
drop table basictheater;

alter table ticketingInfo add constraint fk_td_no foreign key(td_no) references basictheater(td_no);
--외래키 제약조건 추가
alter table basictheater add constraint fk_td_email foreign key(email) references tbl_inyeon_user(email);
--inyeon tbl_email 외래키 제약조건 추가

create sequence seq_td_no--기본정보 연극 정보 테이블 시퀀스
start with 1
increment by 1
nocache

create sequence seq_ticketing_no --연극 테이블의 예매 정보 테이블 시퀀스
start with 1
increment by 1
nocache


select * from basictheater;
select * from TICKETINGINFO;
insert into basictheater values
(seq_td_no.nextval,'wlghks4111@naver.com','제목','ㅅ','ㅅ','ㅅ','ㅅ','ㅅ','ㅅ','ㅅ',0,sysdate,'ㅅ')