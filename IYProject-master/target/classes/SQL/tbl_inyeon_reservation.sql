-- tbl_inyeon_reservation

create table tbl_inyeon_reservation(
  res_code varchar2(20) primary key,-- 예약 테이블
  td_location varchar2(100) not null, -- 장소 코드
  td_title varchar2(100),
  td_runtime varchar2(100),
  td_stprice varchar2(100),
  value1 varchar2(10),
  totalCost varchar2(20),
  email varchar2(100),--user테이블 email외래키
  pur_date date
 )
 
create sequence res_seq	
start with 1
increment by 1
nocache;
 
drop table tbl_inyeon_reservation;
select * from tbl_inyeon_reservation;









