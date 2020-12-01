--user테이블
create table tbl_inyeon_user(--회원 정보 테이블
	email varchar2(300) primary key,--이메일
	pw varchar2(200) not null, -- 비밀번호
	name varchar2(100) not null, -- 회원 이름
	phone varchar2(150) not null,-- 회원 폰번호
	user_key varchar2(100) not null,-- 이메일인증 우뮤 키
	reg_date date,--회원 가입 날짜
	membertype char,--회원 분류 키
	point int default 0,--회원 총 포인트
	pref_theater01 varchar2(100) null,-- 선호극장1
	pref_theater02 varchar2(100) null,-- 선호극장2
	pref_theater03 varchar2(100) null,-- 선호극장3
	login_way char not null, --로그인 방식
	belong varchar2(10) null --소속
);

alter table tbl_inyeon_user add belong varchar2(10) null;
update TBL_INYEON_USER set membertype='3' where email='administrator';
insert into TBL_INYEON_USER(email,pw,name,phone,user_key,reg_date,membertype,point,login_way) 
values ('administrator','4194d1706ed1f408d5e02d672777019f4d5385c766a8c6ca8acba3167d36a7b9','관리자',010-9999-9876,'hye_ah',sysdate,3,9999999,1)

select * from tbl_inyeon_user;
delete from TBL_INYEON_USER where name='a';
delete from TBL_INYEON_FBOARD where email='wlghks4111@naver.com'
delete from BASICTHEATER where email='wlghks4111@naver.com'
delete from TICKETINGINFO;

drop table tbl_inyeon_user;

select * from tbl_inyun_user where sub_date < (select sysdate - 1 from dual) and user_key != 'hye_ah';
select sysdate, sysdate + 1/(24*60) from dual;
select sysdate, sysdate + 100 from dual;


create sequence fb_seq
start with 1
increment by 1
nocache;

select * from TBL_INYEON_FBOARD;

select fb_seq.nextval from dual;

insert into tbl_inyeon_fboard(fb_num,fb_title,fb_cont,fb_date,email) values(fb_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'wlghks4111@naver.com');

insert into tbl_inyeon_fboard(fb_num,fb_title,fb_cont,fb_date,email) values(fb_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'wlghks4111@naver.com');


select tbl_inyeon_user.username, tbl_inyeon_fboard.fb_title, tbl_inyeon_fboard.fb_cont, tbl_inyeon_fboard.fb_hit, tbl_inyeon_fboard.fb_date from tbl_inyeon_user, tbl_inyeon_fboard where tbl_inyeon_user.email = tbl_inyeon_fboard.email;



insert admin 만들꺼에여 여기서바로
admin(db)
admin(db) 만약에 이상태로 db넣으면
로그인할때 
비번 admin(로그인)은 암호화가되어 비교가되요
그럼 admin(db) 이랑 난수(로그인 admdin)랑 비교가가되어 로그인이 안되요





select * from TBL_INYEON_USER order by 















