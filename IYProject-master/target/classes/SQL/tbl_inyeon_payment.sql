-- tbl_inyeon_payment

create table tbl_inyeon_payment(
  pay_code varchar2(100) primary key --결제 코드
  ,pay_way varchar2(10) not null --결제 방식
  ,pay_date date --결제 날짜
  ,total_cost int not null -- 총 결제 금액
  ,dc_cost int default 0 -- 총 할인 금액
  ,res_cost int not null -- 최종 결제 금액

)



-- tbl_inyeon_pay_cancel
create table tbl_inyeon_pay_cancel(
  cancel_code varchar2(100) primary key --취소 코드
  ,res_cost int not null --총 결제 금액
  ,pay_date date --결제 날짜
  ,cancel_date date --취소 날짜
  ,email varchar2(100)--user테이블 email 외래키
)