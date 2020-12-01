
create table tbl_inyeon_pboard( --홍보 게시판 테이블
	pb_num int primary key,--홍보 게시판 번호
	pb_title varchar2(300) not null,--홍보 게시판 제목
	pb_cont varchar2(4000) not null,--홍보 게시판 내용
	pb_hit int default 0,--홍보 게시판 조회수
	pb_date date,--홍보 게시판 등록일
	pb_img_url varchar2(2000) null, --홍보 게시판 이미지 파일 경로
	email varchar2(100) -- user테이블 email외래키
);


create sequence pb_seq
start with 1
increment by 1
nocache

alter table tbl_inyeon_pboard add constraint pb_fk_email foreign key (email) references tbl_inyeon_user(email); 

