<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link rel="stylesheet" type="text/css" href="./resources/css/res01-css.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />
<style type="text/css">
        td{
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 20px;
            font-family: 굴림;
            border:2px border-color:#3333FF;
            border-radius: 8px;/*모서리 둥글게*/
        }
    </style>
<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); //달력 cell 만들어 출력 
        }
 
        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();//달력 cell 만들어 출력
        }
        function buildCalendar(){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = "<font color=#F79DC2>" + i
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = "<font color=skyblue>" + i
                  //7번째의 cell에만 색칠
                   row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               }
             }
        }
    </script>
</head>
<body>
	<jsp:include page="../../include/header.jsp" />


	<!-- body-wrap -->
	<form action="#" method="post">
	<div class="body-wrap">
		<div class="body-wrap-header">빠른예매</div>

		<div class="body-wrap-block1-wrap">
			<div class="body-wrap-block1">
				<div class="body-wrap-block1-a1">지역 선택</div>

				<div class="body-wrap-block1-a2">
				
				
				<input type="submit" class="loca_btn01" value="서울"/> 
				<input type="submit" class= "loca_btn01" value="경기"/>
				<input type="submit" class= "loca_btn01" value="제주"/>
				<input type="submit" class= "loca_btn01" value="경남"/>
				<input type="submit" class= "loca_btn01" value="경북"/>
				<input type="submit" class= "loca_btn01" value="광주"/>
				<input type="submit" class= "loca_btn01" value="부산"/>
				<input type="submit" class= "loca_btn01" value="충북"/>
				<input type="submit" class= "loca_btn01" value="충남"/>
				<input type="submit" class= "loca_btn01" value="전북"/>
				<input type="submit" class= "loca_btn01" value="전남"/>
				<input type="submit" class= "loca_btn01" value="대구"/>
				<input type="submit" class= "loca_btn01" value="울산"/>
				<input type="submit" class= "loca_btn01" value="인천"/>
				</div>

				<div class="body-wrap-block1-a3">
				<input type="submit" class= "loca_btn02" value="종로구"/>
				<input type="submit" class= "loca_btn02" value="동대문구"/>
				<input type="submit" class= "loca_btn02" value="중랑구"/>
				<input type="submit" class= "loca_btn02" value="성동구"/>
				<input type="submit" class= "loca_btn02" value="용산구"/>
				<input type="submit" class= "loca_btn02" value="강동구"/>
				<input type="submit" class= "loca_btn02" value="강서구"/>
				<input type="submit" class= "loca_btn02" value="양천구"/>
				<input type="submit" class= "loca_btn02" value="강남구"/>
				<input type="submit" class= "loca_btn02" value="은평구"/>
				<input type="submit" class= "loca_btn02" value="동작구"/>
				<input type="submit" class= "loca_btn02" value="관악구"/>
				<input type="submit" class= "loca_btn02" value="금천구"/>
				<input type="submit" class= "loca_btn02" value="서초구"/>
				<input type="submit" class= "loca_btn02" value="송파구"/>
				<input type="submit" class= "loca_btn02" value="기타"/>
				<input type="submit" class= "loca_btn02" value="등등"/>
				<input type="submit" class= "loca_btn02" value="등등"/>
				</div>

			</div>
		</div>
		<!-- body-wrap-block1 -->

		<div class="body-wrap-block2-wrap">
			<div class="body-wrap-block2">
			
				<div class="body-wrap-block2-a4">연극 선택</div>
				<div class="body-wrap-block2-a5">
				
				<input type="submit" class= "loca_btn03" value="SUPER SHOW 6: SUPER JUNIOR WORLD TOUR"/>
				<input type="submit" class= "loca_btn03" value="EXO-Love CONCERT in DOME"/>
				<input type="submit" class= "loca_btn03" value="난타(NANTA) [방콕]"/>
				<input type="submit" class= "loca_btn03" value="시크릿"/>
				<input type="submit" class= "loca_btn03" value="요리하는 마술사 [파주]"/>
				<input type="submit" class= "loca_btn03" value="쿵 시즌3 드리머"/>
				<input type="submit" class= "loca_btn03" value="당신이주인공 1탄"/>
				<input type="submit" class= "loca_btn03" value="그녀를 믿지마세요"/>
				<input type="submit" class= "loca_btn03" value="텐: 열흘간의 비밀"/>
				<input type="submit" class= "loca_btn03" value="김광석을 노래하다"/>
				<input type="submit" class= "loca_btn03" value="작업의 정석 1탄"/>
				<input type="submit" class= "loca_btn03" value="피노키오"/>
				<input type="submit" class= "loca_btn03" value="사랑은 비를 타고"/>
				<input type="submit" class= "loca_btn03" value="임혁필의 펀타지쇼"/>
				<input type="submit" class= "loca_btn03" value="성춘향"/>
				<input type="submit" class= "loca_btn03" value="만만파파 용피리"/>
				<input type="submit" class= "loca_btn03" value="오페라 마티네, 운명의 힘"/>
				<input type="submit" class= "loca_btn03" value="넌센스Ⅱ"/>
				<input type="submit" class= "loca_btn03" value="새봄맞이 가족오페라 마술피리"/>
				<input type="submit" class= "loca_btn03" value="이승연 바이올린 독주회"/>
				<input type="submit" class= "loca_btn03" value="정선호 피아노 독주회"/>
				<input type="submit" class= "loca_btn03" value="음악으로 떠나는 겨울여행"/>
				<input type="submit" class= "loca_btn03" value="아리"/>
				<input type="submit" class= "loca_btn03" value="한번더"/>
				<input type="submit" class= "loca_btn03" value="아나옜다. 배갈라라"/>
				</div>
			</div>
		</div>
		<!-- body-wrap-block2 -->

		<div class="body-wrap-block3-wrap">
			<div class="body-wrap-block3">
				<div class="body-wrap-block3-a6">날짜 선택</div>
				
				<div class="body-wrap-block3-a7">

<table id="calendar" border="3" align="center" style="border-color:#3333FF ">
    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
        <td><label onclick="prevCalendar()"><</label></td>
        <td align="center" id="tbCalendarYM" colspan="5">
        yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
            
        </label></td>
    </tr>
    <tr>
        <td align="center"><font color ="#F79DC2">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center"><font color ="skyblue">토</td>
    </tr> 
</table>
<script language="javascript" type="text/javascript">
    buildCalendar();//
</script>
				</div>

			</div>
		</div>
		<!-- body-wrap-block3 -->
	</div>
	</form>
	<button id="btn00" value="다음" onclick="location='IY_re02';">다음</button>
	<!-- /body-wrap -->


		<jsp:include page="../../include/footer.jsp" />
</body>
</html>
















