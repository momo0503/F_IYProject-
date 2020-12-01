<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기2</title>
<link rel="stylesheet" type="text/css" href="./resources/css/res02-css.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
		<jsp:include page="../../include/header.jsp" />

<%--body-wrap --%>
	<div class="body-wrap">

<%--body-wrap-block1 --%>
		<div class=body-wrap-block1>
		<span class = 'stgrade'>좌석 등급 : ${td_stgrade}</span><br><br><br><br>
		예매 매수 선택        <select id='select01' onchange='getSelectNum()' >
			<option class="mes03" id='rescount1' value=1 >1매</option>
			<option class="mes03" id='rescount2' value=2>2매</option>
			<option class="mes03" id='rescount3' value=3>3매</option>
			<option class="mes03" id='rescount4' value=4 selected>4매</option>
		</select>
		
		<%-- 	잔여좌석/총좌석 매수 : <span id="mes">152/323 ${td_detailposter} ${td_location}${td_actor}</span>
			<br>
			<br>
			<br> 예매 매수 선택 : <span id="mes2"><select>
			<option class="mes03" selected>1매</option>
			<option class="mes03">2매</option>
			<option class="mes03">3매</option>
			<option class="mes03">4매</option>
			</select></span> --%>
			
		</div>
<%--/body-wrap-block1 --%>


<%--body-wrap-block2 --%>
		<div class=body-wrap-block2>
			 <img class="mySlides" src="./resources/img/reservation/event_20.jpg" width=400px;
				height=300px; />
		</div>
<%--/body-wrap-block2 --%>

<%--body-wrap-block3 --%>
		<div class=body-wrap-block3>
		<div class= body-wrap-block3-a1>연극제목 : <span id="title">${td_title}</span><br><br>
		<p>연극 지역 : <span id= 'location1'>${td_location}</span></p><br><br>
		<p>관람시간 : <span id = 'runtime1'>${td_runtime}</p></p><br><br>
	

		1매가격 : <span id='cost2'>${td_stprice}</span><br><br>
		매수 :  <span id= 'rescnt'></span><br><br><br>
		최종 결제 금액 : <span id='totalcost'></span><br><br>
		<br><Br>
		</div><%-- 이미지는 이미지 경로 넣어주기  --%>
		<img src="${td_mainposter}" width="350px" height="230px"/>
		<button id="btn01" value="이전" onclick="location='IY_res-conts';">이전</button>
		<%--<button id="btn02" value="이전" onclick="location='/controller/IY_re03?td_locationI='+${td_location}+'&td_runtimeI='+${td_runtime}+'&theater_nameI='+${td_title}';">다음</button> --%>
		<button id="btn02" value="다음" onclick="goRes03()">다음</button>
	
		</div>
<%--body-wrap-block3 --%>

	</div>
<%--/body-wrap --%>
	<jsp:include page="../../include/footer.jsp" />
</body>

<script>

var cost2 = "${td_stprice}"
console.log(cost2);
cost2 = parseInt(cost2);
console.log(cost2);
var totalCost; //토탈가격
var value1; //매수

function getSelectNum(){
var selectId = document.getElementById('select01')

var text1 = selectId.options[document.getElementById("select01").selectedIndex].text;
// 선택된 index의 value를 찾고 
value1 = selectId.options[document.getElementById("select01").selectedIndex].value;
// 원하는 동작을 수행한다. 여기서는 그냥 alert해주는 식으로만 처리함. 
value1=parseInt(value1);

document.getElementById("rescnt").innerHTML = value1+" 매";

var cost1 = document.getElementById("cost2").text
console.log(cost2);
console.log(value1);
totalCost = (cost2*value1); //  cost2 = td_stprice, value=매수 숫자만있음.
console.log(totalCost);
document.getElementById("totalcost").innerHTML = totalCost+" 원";

}//getSelectNum


	function goRes03(){
		
		var td_title = $('#title').text();
		var td_location = $('#location1').text();
		var td_runtime = $('#runtime1').text();
		var td_stprice =$('#cost2').text();     //1매가격     
		value1=$('#rescnt').text();
		var td_mainposter = "${td_mainposter}"
		//totalCost 전역변수로 선언함
		//매수 개수도 전역으로 선언
		
		 location.href = '/controller/IY_re03?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost+'&td_mainposterI='+td_mainposter;
		//location.href = '/controller/IY_re03?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost;
		//return '/controller/IY_re03?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title+'&td_stpriceI='+td_stprice+'&value1I='+value1+'&cost2I='+cost2+'&totalCostI='+totalCost;
	}//geRes03()


</script>
</html>













