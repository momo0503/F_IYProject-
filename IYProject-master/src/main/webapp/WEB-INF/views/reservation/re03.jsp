<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기2</title>
<link rel="stylesheet" type="text/css" href="./resources/css/res03-css.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
		<jsp:include page="../../include/header.jsp" />
<script>
function payready(){
	alert('결제를 시작합니다!');
}
</script>
	<div class="body-wrap">

		<div class=body-wrap-block1>
			<p id = 'theaterdetail1'>공연 상세 정보</p>
			 <span id="mes"></span><br><br><br>
			 <div class = 'td_ticketinginfo01' id ='td_ticketinginfo01' >${td_tinfo}</div>
			 
			 <hr>
			 
			<span id="mes3">결제수단</span><br><br><br>
			 
<!-- 			<input type="radio" value="신용/체크카드 "> &nbsp; 카드사 선택   &nbsp;:  &nbsp; <select>
			<option class="mes04" selected>국민은행</option>
			<option class="mes03">신한은행</option>
			<option class="mes03">기업은행</option>
			<option class="mes03">농협은행</option>
			<option class="mes03">산업은행</option>
			<option class="mes03">전북은행</option>
			<option class="mes03">부산은행</option>
			<option class="mes03">국민은행</option>
			</select> -->
			 
			 
			 <br><br><br>  
			 
			<input type="radio" value="카카오페이 " checked="checked"> &nbsp; 카카오페이
			 
			 
			

		</div>


		<%--body-wrap-block3 --%>
		<div class=body-wrap-block3>
		<div class= body-wrap-block3-a1>연극 제목 : <span id="title1">${td_title}</span><br><br>
		<p>연극 지역 : <span id= 'location1'>${td_location}</span></p><br><br>
		<p>관람시간 : <span id = 'runtime1'>${td_runtime}</p></p><br><br>
	

		1매가격 : <span id='cost2'>${td_stprice}</span><br><br>
		매수 :  <span id= 'rescnt'>${value1}</span><br><br><br>
		최종 결제 금액 : <span id='totalcost'>${totalCost}</span><br><br>
		<br><Br>
		</div><%-- 이미지는 이미지 경로 넣어주기  --%>
		<img src="${td_mainposter}" width="350px" height="230px"/>
		<button id="btn03" value="이전" onclick="location='IY_res-conts';">이전</button>
		<%--<button id="btn03" value="이전" onclick="location='/controller/IY_re03?td_locationI='+${td_location}+'&td_runtimeI='+${td_runtime}+'&theater_nameI='+${td_title}';">다음</button> --%>
			<form method="post" action="kakaoPay" style="display: inline-block;">
				<button id="btn04" value="결제" onclick="goPay()">결제</button>
				
				<input type="hidden" name="td_title" value="${td_title}" />
				<input type="hidden" name="totalCost" value="${totalCost}" />
				<input type="hidden" name="td_runtime" value="${mbttvo.td_runtime}" />
				<input type="hidden" name="email" value="${login.email}" />
				<input type="hidden" name="value1" value="${value1}" />
				<input type="hidden" name="td_location" value="${mbttvo.td_location}" />
				<input type="hidden" name="td_stprice" value="${mbttvo.td_stprice}" />
				
			</form>
	
		</div>
<%--body-wrap-block3 --%>

	</div>

	<jsp:include page="../../include/footer.jsp" />
</body>

<script>
var cost2 = ${td_stprice}
//var totalCost; //토탈가격
var value1; //매수


function goPay(){
	
	var td_title = $('#title1').text();
	var totalCost =$('#totalcost').text();
	var td_location = $('#location1').text();
	var td_runtime = $('#runtime1').text();
	var td_stprice =$('#cost2').text();     //1매가격     
	value1=$('#rescnt').text();


	//totalCost 전역변수로 선언함
	//매수 개수도 전역으로 선언
	
	 //location.href = '/controller/IY_re04?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost;
	//location.href = '/controller/IY_re03?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost;
	//return '/controller/IY_re03?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost;
}//geRes03()

</script>
</html>