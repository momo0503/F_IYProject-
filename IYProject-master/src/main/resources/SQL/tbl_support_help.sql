
-- 2020.10.08
-- tbl_support_help

create table tbl_support_help(
  hno int primary key,--구분 번호
  quest varchar2(1000) not null,-- 질문
  answer varchar2(4000) not null,-- 응답
  field varchar2(100) not null,-- 영역
  email varchar2(100) not null, --작성자
  edit_date date --등록/수정 날짜
)

create sequence seq_help_num
start with 1
increment by 1
nocache;

 select * from tbl_support_help;
drop table tbl_support_help;
insert into tbl_support_help values(seq_help_num.nextval,'연극 예매는 언제까지 가능하나요?','연극 상영 1시간 전까지 예매 가능합니다.','연극예매','administrator',sysdate);
insert into tbl_support_help values(seq_help_num.nextval,'온라인 예매할 때 좌석선택도 가능한가요??','좌석 선택은 제공 하지 않습니다.','연극예매','administrator',sysdate);
insert into tbl_support_help values(seq_help_num.nextval,'예매를 했는데 날짜(시간) 변경이 가능할까요?','예매하신 티켓 취소 후 재예매를 하셔야 합니다.','연극예매','administrator',sysdate);
insert into tbl_support_help values(seq_help_num.nextval,'포인트가 적립이 되지않았을때 어떻게 해야하나요?','마이페이지 1:1 문의하기로 상세내역을 남겨주세요','포인트','administrator',sysdate);
insert into tbl_support_help values(seq_help_num.nextval,'카카오 페이 이용 방법과 실제결제 방법을 알려주세요.','1. 카카오톡 앱 내의 카카오페이 서비스를 클릭 하여 카카오페이 가입하기를 진행합니다.  

카카오페이 가입 -> 카카오페이 명의자 정보 등록 및 인증 -> 비밀번호 등록 -> 카드관리에서 신규카드 정보 등록  위와 같이 진행하시면 어디서나 카카오페이를 이용 가능합니다. 

2.PC 카카오페이 결제 요청창 생성 -> 카카오페이 가입시 등록한 휴대폰 번호, 생년월일을 입력 -> 결제 메시지를 요청

3.결제메시지가 요청되면 내 휴대폰 카카오페이에서 결제 요청 메세지 보냄 -> 카카오페이 메세지안의 [결제하기] 버튼을 클릭

4.휴대폰 내의 결제정보 확인 및 동의 -> 결제 비밀번호 입력 -> [확인] 버튼 >PC로 돌아와 [결제완료] 버튼 입력 

※카카오페이에서 결제요청을 했어도 PC에서 최종적으로 결제완료 버튼을 누르지 않으면 결제가 되지 않습니다.  

 ','결제수단','administrator',sysdate);
insert into tbl_support_help values(seq_help_num.nextval,'결제취소는 어떻게 하나요?','결제취소는 마이페이지> 예매내역 메뉴에서 확인가능합니다.

예매 주문한 내역을 확인하고 취소하기를 클릭합니다.','결제수단','administrator',sysdate);
