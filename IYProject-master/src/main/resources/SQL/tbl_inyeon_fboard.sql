
create table tbl_inyeon_fboard( --자유 게시판 테이블
	fb_num int primary key,--자유 게시판 번호
	fb_title varchar2(300) not null,--자유 게시판 제목
	fb_cont varchar2(4000) not null,--자유 게시판 내용
	fb_hit int default 0,--자유 게시판 조회수
	fb_date date,--자유 게시판 등록일
	fb_img_url varchar2(2000) null, --자유 게시판 이미지 파일 경로
	email varchar2(100) -- user이메일 외래키
);

create sequence fb_seq
start with 1
increment by 1
nocache

alter table tbl_inyeon_fboard add constraint fb_fk_email foreign key (email) references tbl_inyeon_user(email);
alter table tbl_inyeon_fboard foreign key (email) references tbl_inyeon_user(email);



insert into tbl_inyeon_fboard values(fb_seq.nextval,'ㅁ','내용',0,sysdate,null,'wlghks4111@naver.com')

select * from tbl_inyeon_fboard order by fb_num desc;

select * from TBL_INYEON_FBOARD where email='NULL' order by fb_num desc;

delete from tbl_inyeon_fboard where fb_num=31;



select tbl_inyeon_fboard.fb_title,tbl_inyeon_fboard.fb_cont,tbl_inyeon_fboard.fb_date,tbl_inyeon_fboard.fb_hit,
		tbl_inyeon_user.name
from tbl_inyeon_fboard,tbl_inyeon_user where tbl_inyeon_fboard.fb_num=1 and tbl_inyeon_user.email=(select email from TBL_INYEON_FBOARD where fb_num=1);

select * from tbl_inyeon_fboard;

create table abcd(
a int primary key
컬럼명 데이터타입 제약조건
)
create table abcde(
a int,
primary key(a),
컬럼명 데이터타입,
제약조건(컬럼명)
)
컬럼명 데이터타입,
제약조건(컬럼명)
drop table abcde;


select * from (select rowNum rNum,fb_title,fb_cont,fb_hit,fb_date,fb_img_url,email from (
select * from tbl_inyeon_fboard where email='wlghksl12@daum.net' order by fb_num desc))
where rNum>=1 and rNum<=3


