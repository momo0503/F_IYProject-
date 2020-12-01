
create table tbl_inyeon_point(--포인트 테이블
	point_code varchar2(30) primary key,--포인트 코드
	point_cont varchar2(300) not null,--포인트 획득 내역
	point_date date, --획득 날짜
	point int default 0,--획득 포인트
	email varchar2(100)--user테이블 email외래키
)

alter table tbl_inyeon_point add constraint email foreign key (email) references tbl_inyeon_user(email);
