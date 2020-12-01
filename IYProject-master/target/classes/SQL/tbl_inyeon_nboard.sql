
create table tbl_inyeon_nboard( --공지 게시판 테이블
	nb_num int primary key,--공지 게시판 번호
	nb_title varchar2(300) not null,--공지 게시판 제목
	nb_cont varchar2(4000) not null,--공지 게시판 내용
	nb_hit int default 0,--공지 게시판 조회수
	nb_date date,--공지 게시판 등록일
	nb_img_url varchar2(2000) null, --공지 게시판 이미지 경로
	email varchar2(100) -- user이메일 외래키
);

create sequence nb_seq
start with 1
increment by 1
nocache

drop table tbl_inyeon_nboard;

alter table tbl_inyeon_nboard add constraint nb_fk_email foreign key (email) references tbl_inyeon_user(email); 


