<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내용</title>

<link rel="stylesheet" type="text/css" href="./resources/css/res11.css" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/res-conts.css" />
<link rel="stylesheet" type="text/css"
	href="./resources/calendar-css.css" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
<jsp:include page="../../include/header.jsp"/>

	<div class="quick-reservation-title">
		<h1>빈칸빈칸</h1>
	</div>
	<%-- iframe에서 보여질 영역--%>
	<div class="quick-reservation">

		<%-- location-choice--%>
		<div class=location-choice>
			<p>지역</p>
			<%--list-area --%>
			<div class=list-area id=lc-list-area>


				<%--all-list --%>
				<div class=all-list id="lc-all-list">

				
						<%--sidolist --%>
						<div class=sidolist>
							<ul>
									<li><button class="resbtn" id="1">
										<span class="text">선호지역</span>
									</button></li>
								<li><button class="resbtn" id="11" >
										<span class="text">서울특별시</span>
									</button></li>
								<li><button class="resbtn" id="26" >
										<span class="text">부산광역시</span>
									</button></li>
								<li><button class="resbtn" id="27" >
										<span class="text">대구광역시</span>
									</button></li>
								<li><button class="resbtn" id="28" >
										<span class="text">인천광역시</span>
									</button></li>
								<li><button class="resbtn" id="29" >
										<span class="text">광주광역시 </span>
									</button></li>
								<li><button class="resbtn" id="30" >
										<span class="text">대전광역시</span>
									</button></li>
								<li><button class="resbtn" id="31" >
										<span class="text">울산광역시</span>
									</button></li>
								<li><button class="resbtn" id="36" >
										<span class="text">세종특별자치시</span>
									</button></li>
								<li><button class="resbtn" id="41" >
										<span class="text">경기도</span>
									</button></li>
								<li><button class="resbtn" id="42" >
										<span class="text">강원도</span>
									</button></li>
								<li><button class="resbtn" id="43" >
										<span class="text">충청북도</span>
									</button></li>
								<li><button class="resbtn" id="44" ><%--.resbtn val id = this.getid() data{id:id}  --%>
										<span class="text">충청남도</span>
									</button></li>
								<li><button class="resbtn" id="45" >
										<span class="text">전라북도</span>
									</button></li>
								<li><button class="resbtn" id="46" >
										<span class="text">전라남도</span>
									</button></li>
								<li><button class="resbtn" id="47" >
										<span class="text">경상북도</span>
									</button></li>
								<li><button class="resbtn" id="48" >
										<span class="text">경상남도</span>
									</button></li>
								<li><button class="resbtn" id="50" >
										<span class="text">제주특별자치도</span>
									</button></li>
							</ul>
						</div>
						<%--/sidolist --%>
		
				</div>
				<%--all-list --%>

			</div>
			<%--list-area --%>
		</div>
		<%--location-choice --%>

		<div class="theater-choice">
			<p>연극</p>
			<div class=list-area id=tc-list-area>

				<div class=all-list id="tc-all-list">

				<div class=theaterlist id="theaterlist1" ></div>


				</div>
			</div>
		</div>

		<div class="day-choice">
			<p>날짜</p>
			<div class=list-area id=dc-list-area>

				<div class=all-list id="dc-all-list">

				
				</div>
			</div>
		</div>
		
	</div>
	<!-- quick-reservation -->
	
	<jsp:include page="../../include/footer.jsp"/>
</body>




<script>



	<%-- sido 버튼 클릭시 해당 값 출력하기 onclick="sido_codebtn();"--%> 
<%--
	function sido_codebtn() {
		var sido_code;
		const sido_codeInfo ={
			sido_code : document.getElementById(this) //시도코드 id값을 sido_code에 넣음
		} 
			console.log(sido_code);
	
	$.ajax({
		url : "IY_getGugun",
		type : "POST",
		data : JSON.stringify(sido_codeInfo),
		headers:{"Content-Type ":"application/json"},
		success : function() {
			alert('success');
		
			//$('#id').text(data);
		},
		error : function(request, status, error) {
			var msg = "ERROR : " + request.status + "<br>"
			msg += +"내용 : " + request.responseText + "<br>" + error;
			console.log(msg);
		}
	});
	};	--%>
	 
	
	$('.resbtn').click(function(){
		//$.trim($('#boardasdf').val())
		//var sido_code = $(this).attr("id");
		var td_location = $(this).text();
		td_location= $.trim(td_location)
		console.log(td_location)
		
		
		const td_locationInfo ={
			td_locationI:td_location
		} 
		
		console.log(td_locationInfo);
		
		$('#theaterlist1').html('');
	 	$.ajax({
			url: "IY_getTheater",
			type : "POST",
			data : JSON.stringify(td_locationInfo), //json을 String 타입으로 전송시킨다. 서버로 보낼때는 String으로 보내야하잖아
			
			 headers : { // Http header
			      "Content-Type" : "application/json",
			    },
			//data를 못읽거나  못가져온다.   data.
			success : function(data) {		
 				$.each(data, function(index, item){
 					$('#theaterlist1').append("<li><button id= 'resbtn02' class='resbtn02' onclick='\getTheaterTime(this)\'>"+item.td_title+"</button><span class='span02' id='span02'>"+item.td_location+"</span></li>");
 					
				});
 			
			    }, //success 
			    
		});// $.ajax
	    
	}); //$('.resbtn').click(function()

			
			
			
function getTheaterTime(a){
		
		
		var theater_name = $(a).text();
		var td_location = $('#span02').text();
		
		console.log(theater_name);
		
		console.log(td_location)
		
		
		const theater_nameInfo ={
			theater_nameI:theater_name,
			td_locationI:td_location
	} 
	

	console.log(theater_nameInfo);
	
		
	$('#dc-all-list').html('');
	$.ajax({
		url: "IY_getTheaterTime",
		type : "POST",
		data : JSON.stringify(theater_nameInfo), //json을 String 타입으로 전송시킨다. 서버로 보낼때는 String으로 보내야하잖아
		
		 headers : { // Http header
		      "Content-Type" : "application/json",
		    },
		//data를 못읽거나  못가져온다.   data.
		success : function(data) {		
				$.each(data, function(index, item){
					$('#dc-all-list').append("<li><button id = 'resbtn03' class='resbtn03' onclick='\checkRes(this)\'>"+item.td_runtime+"</button><span class='span03' id='span03'>"+item.td_location+"</span><span class='span04' id='span04'>"+item.td_title+"</span></li>");	
						
			});
		    }, //success    
	});// $.ajax  
}	

function checkRes(a){
	var answer = confirm("예매 하시겠 습 니 까?")
	var td_location = $('#span03').text();
	var td_title = $('#span04').text();
	var td_runtime = $(a).text()
	if(answer){
	    location.href = '/controller/IY_re02?td_locationI='+td_location+'&td_runtimeI='+td_runtime+'&theater_nameI='+td_title;

}//if

else{
	return false;
}

}//checkRes()

/*
function checkRes(a){
	var answer = confirm("예매 하시겠 습 니 까?")
	var td_location = $('#span03').text();
	var td_title = $('#span04').text();
	var td_runtime = $(a).text()
	
	//alert(td_runtime)
	//console.log(td_runtime)
	//alert("td_location :"+td_location)
	//console.log(td_location)
	//alert("td_title :"+td_title)
	//console.log(td_title)
	
	if(answer){
		
		const td_runtimeInfo={
			td_runtimeI: td_runtime,
			theater_nameI:td_title,
			td_locationI:td_location
		}
		
		alert(td_runtimeInfo)
		console.log(td_runtimeInfo)

		$.ajax({
		url: "../controller/IY_re02",
		type : "GET",
		data : JSON.stringify(td_runtimeInfo), //json을 String 타입으로 전송시킨다. 서버로 보낼때는 String으로 보내야하잖아
		
		 headers : { // Http header
		      "Content-Type" : "application/json",
		   },
		//data를 못읽거나  못가져온다.   data.
		//success : function(data) {	
			
			//	alert("data : "+data.td_location)
				//  window.location.href = "subPage.html?index=" + index;
               //window.location.href="../controller/IY_re02?td_locationI="+data.td_location
		   // }, //success    
	});// $.ajax  
	}//if
	
	else{
		return false;
	}
}//checkRes()
*/

</script> 
</html>