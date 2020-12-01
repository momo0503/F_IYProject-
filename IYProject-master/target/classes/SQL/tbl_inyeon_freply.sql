
create table tbl_inyeon_freply( --자유 게시판 댓글 테이블
	freply_num int primary key,--자유 게시판 댓글 번호
	fboard_num int,--자유 게시판 번호
	fb_reply_cont varchar2(2000) not null,--자유 게시판 댓글 내용
	fb_reply_date date,--자유 게시판 댓글 등록일
	fb_reply_reply_name varchar2(400),--자유 게시판 대댓글이 참조하는 작성자 이름
	fb_reply_reply_cont varchar2(400),--자유 게시판 대댓글이 참조하는 댓글 내용
	email varchar2(100),
	del_ck char not null --삭제인지 아닌지 확인하는 컬럼 / 1일경우 일반댓글 ,0 일경우 삭제된 댓글
)
--삭제시 del_ck를 0으로바꾸고 뷰페이지쪽에서 c:if를활용하여 del_ck가 0일경우 '삭제된 댓글 입니다' 로변경
--게시판은삭제될떄 댓글까지 삭제
drop table tbl_inyeon_freply;

alter table tbl_inyeon_freply add constraint frep_fk_email foreign key (email) references tbl_inyeon_user(email);
alter table tbl_inyeon_freply add constraint frep_fk_bn foreign key (fboard_num) references tbl_inyeon_fboard(fb_num) on delete cascade;

alter table tbl_inyeon_freply drop constraint frep_fk_bn
create sequence fre_seq
start with 1
increment by 1
nocache


 		insert into tbl_inyeon_freply(freply_num,fboard_num,fb_reply_cont,fb_reply_date,email) 
 		values(fre_seq.nextval,4,'댓글',sysdate,'wlghksl12@daum.net');
 		
 		 		insert into tbl_inyeon_freply(freply_num,fboard_num,fb_reply_cont,fb_reply_date,) 
 		values(fre_seq.nextval,4,'댓글2',sysdate,(select name from tbl_inyeon_user where email='wlghksl12@daum.net'));
 		
 select * from TBL_INYEON_FREPLY;
 
 select tbl_inyeon_freply.fb_reply_cont,tbl_inyeon_freply.fb_reply_date,tbl_inyeon_user.email,tbl_inyeon_user.name 
 	from tbl_inyeon_freply,tbl_inyeon_user where tbl_inyeon_freply.fboard_num=21 and tbl_inyeon_user.email=(select email from tbl_inyeon_freply where fboard_num=20)
 
 	
 	
 	
 	
 	tbl_inyeon_user.email=(select email from TBL_INYEON_FBOARD where fb_num=1);
 
 select * from tbl_inyeon_freply where fboard_num=4
 
 
  select tbl_inyeon_freply.freply_num,tbl_inyeon_freply.fb_reply_cont,tbl_inyeon_freply.fb_reply_date,tbl_inyeon_user.email,tbl_inyeon_user.name 
 	from tbl_inyeon_freply,tbl_inyeon_user where tbl_inyeon_freply.fboard_num=23
 
 	
 	insert into tbl_inyeon_freply(freply_num,fboard_num,fb_reply_cont,fb_reply_date,email,del_ck) 
 		values(fre_seq.nextval,2,'댓글 내용',sysdate,'wlghksl12@daum.net',1)
 		
 		
 	insert into tbl_inyeon_freply(freply_num,fboard_num,fb_reply_cont,fb_reply_date,email,del_ck) 
 		values(fre_seq.nextval,23,'내용',sysdate,'wlghksl12@daum.net',1) 
 		 where email = 'wlghksl12@daum.net';
 		 
 		 delete from tbl_inyeon_freply where freply_num=35;
 	
 		 
 		 
 		 
 		 select tbl_inyeon_freply.freply_num,tbl_inyeon_freply.fb_reply_cont,tbl_inyeon_freply.fb_reply_date,tbl_inyeon_user.email,tbl_inyeon_user.name 
 		 from tbl_inyeon_freply inner join tbl_inyeon_user on tbl_inyeon_freply.email=tbl_inyeon_user.email where
 		 tbl_inyeon_freply.fboard_num=21
 		 
 		  select tbl_inyeon_freply.freply_num,tbl_inyeon_freply.fb_reply_cont,tbl_inyeon_freply.fb_reply_date,tbl_inyeon_user.email,tbl_inyeon_user.name 
 		 from tbl_inyeon_freply inner join tbl_inyeon_user on tbl_inyeon_freply.email=tbl_inyeon_user.email where
 		 tbl_inyeon_freply.fboard_num=21 order by tbl_inyeon_freply.freply_num desc
 		 
 		 
 		 
 		 
 		 
 		 
 		 SELECT COUNT(*) FROM tbl_inyeon_freply WHERE fboard_num = 21;
 		 SELECT COUNT(*)
FROM tbl_inyeon_freply
WHERE TABLE_NAME = '테이블명'


  tbl_inyeon_freply.fb_reply_reply_name,tbl_inyeon_freply.fb_reply_reply_name
 select tbl_inyeon_freply.freply_num,tbl_inyeon_freply.fb_reply_cont,tbl_inyeon_freply.fb_reply_date,tbl_inyeon_user.email,tbl_inyeon_user.name,tbl_inyeon_freply.fb_reply_reply_name,tbl_inyeon_freply.fb_reply_reply_cont 
  from tbl_inyeon_freply inner join tbl_inyeon_user on tbl_inyeon_freply.email=tbl_inyeon_user.email where
 		 tbl_inyeon_freply.fboard_num=2 order by tbl_inyeon_freply.freply_num desc


 	
