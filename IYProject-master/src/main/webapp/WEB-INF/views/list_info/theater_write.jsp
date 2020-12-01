<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/basictheaterwrite.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js">
	
</script>

</head>
<body>
	<jsp:include page="../../include/header.jsp" />
	<div class="info_wrap" id="info_submit">
		<!--큰 제목-->
		<div class="detail_title_box">
			<p>
				<span>제목</span> <input type="text" id="detail_title">
			</p>
			<br>
		</div>
		<p class="running_time">
			<span>상영기간 </span><br>
			<input type="text" id="detail_dayto"> <br> <span>YYYY.MM.DD~YYYY.MM.DD로
				입력해주세요</span>
		</p>

		<br>
	</div>


	<div class="detail_wrap_box">
		<div class="detail_wrap_content">
			<div class="detail_top_view">
				<!--상단-->
				<!-- poster upload -->
				<br> <input id="file_upload_dp_poster" type="file" multiple />
				<br> <br>



				<div class="detail_top_right">
					<!--상품정보-->
					<div class="detail_top_right_product">
						<!--등급, 관람시간, 출연, 가격, 혜택-->
						<div class="theaterD_agegradeBox">
							등급 <select id="theaterD_age" name="agegrade">
								<option value="theater_age_f" selected="selected">전체 이용 관람가</option>
								<option value="theater_age_12">12세 이용 관람가</option>
								<option value="theater_age_15">15세 이용 관람가</option>
								<option value="theater_age_19">19세 이용 관람가</option>
							</select>
						</div>
						<br>
						<div class="basictheater_locationBox"
							id="basictheater_locationBox">
							지역 <select id="basictheater_location" name="agegrade">
								<option id="basictheater_seoul" value="basictheater_seoul" selected="selected">서울특별시</option>
								<option id="basictheater_busan" value="basictheater_busan">부산광역시</option>
								<option id="basictheater_deagu" value="basictheater_deagu">대구광역시</option>
								<option id="basictheater_incheon" value="basictheater_incheon">인천광역시</option>
								<option id="basictheater_gwangju" value="basictheater_gwangju">광주광역시</option>
								<option id="basictheater_daejeon" value="basictheater_daejeon">대전광역시</option>
								<option id="basictheater_ulsan" value="basictheater_ulsan">울산광역시</option>
								<option id="basictheater_sejong" value="basictheater_sejong">세종특별자치시</option>
								<option id="basictheater_Gyeonggi" value="basictheater_Gyeonggi">경기도</option>
								<option id="basictheater_gangwon" value="basictheater_gangwon">강원도</option>
								<option id="basictheater_chungcheong-bukdo" value="basictheater_chungcheong-bukdo">충청북도</option>
								<option id="basictheater_chungcheong-namdo" value="basictheater_chungcheong-namdo">충청남도</option>
								<option id="basictheater_jeonlla-bukdo" value="basictheater_jeonlla-bukdo">전라북도</option>
								<option id="basictheater_jeonlla-namdo" value="basictheater_jeonlla-namdo">전라남도</option>
								<option id="basictheater_gyeongsang-bukdo" value="basictheater_gyeongsang-bukdo">경상북도</option>
								<option id="basictheater_gyeongsang-namdo" value="basictheater_gyeongsang-namdo">경상남도</option>
								<option id="basictheater_jeju" value="basictheater_jeju">제주특별자치도</option>
							</select>
						</div>
						<br> <br>
						<p>
							관람시간&nbsp;&nbsp;&nbsp;<input type="text" id="detail_runtime">
						</p>
						<br> <br>
						<p>
							출연&nbsp;&nbsp;&nbsp;<input type="text" id="detail_actor">
						</p>
						<br> <br>
						<div>
							<p id="notice_tag">
								<br> <span>공연시간 안내</span> <br /> <br />
								<textarea id="theater_notice" rows="10px" cols="95px"></textarea>
							</p>
						</div>

						<div id="seat_price_in" class="seat_price_in"></div>
						<br> <br>
					</div>
					<!--포인트-->
					<div class="detail_top_right_down">
						<!--공연시간안내, 배송정보-->
						<br>
						<div id="roundDayBox">
							<span>티켓 정보 입력</span>&nbsp;
							<button onclick="ticketPlus();">+</button>
							<br>
							<br> 공연날짜 : <input type='date' id="runtimeDate1" name='userBirthday'
								 /><br /> <span id="roundday"> <br>

								시작시간 : <input type="time" name="starttime" id="starttime1"
								class="playtime1" size="7" /> 종료시간: <input type="time"
								name="endtime" id="endtime1" class="playtime1" size="7" />

								<p>
									좌석&nbsp;&nbsp;: <input id="seat_select1" class="seat_select1"
										type="text" size="7" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격&nbsp;:&nbsp;
									<input id="seat_price1" class="seat_price1" type="text"
										size="7" />&nbsp;원
								</p>
							</span> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="detail_body_view">
		<div class="detail_body_note">
			<textarea id="summernote" class="summernote"></textarea>
		</div>
		<div id="detail_btn">
			<button id="detail_btn_list" onclick="location='IY_theater_list'">목록</button>
			<button type='button' id="detail_btn_submitbtn" onclick="check()">확인</button>
		</div>
	</div>


	<!-- summernote script start -->
	<script>
	var a = 1;
	var url;
	document.getElementById('runtimeDate1').value= new Date().toISOString().slice(0, 10);
$(document).ready(function(){
	$('#summernote').summernote({
		width:1200,
		height:500,
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			}
		}
	});

	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data);
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
});

function ticketPlus(){
	if(a > 3){
		alert('등록할수있는 연극최대 갯수입니다.');
	}else{
		a+=1;
		htmls="";
		htmls+="<span>티켓 정보 입력</span>&nbsp;<br><br> 공연날짜 : <input type='date' id='runtimeDate"+a+"' name='userBirthday'value='2020-03-30' /><br /> <span id='roundday'> <br>";
		htmls+="시작시간 : <input type='time' name='starttime' id='starttime"+a+"' class='playtime1' size='7' /> 종료시간: <input type='time' name='endtime' id='endtime"+a+"' class='playtime1' size='7' />";
		htmls+="<p>좌석&nbsp;&nbsp;: <input id='seat_select"+a+"' class='seat_select1'type='text' size='7' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격&nbsp;:&nbsp;";
		htmls+="<input id='seat_price"+a+"' class='seat_price1' type='text' size='7' />&nbsp;원 </p> </span> <br>";
	$("#roundDayBox").append(htmls);
	}
}


function check(){ //연극 기본정보를 DB로 넘긴후 티켓팅 재기함수를 부르는 함수							
	var formData = new FormData();
	

	
	
	if($.trim($('#detail_title').val())==""){ //입력 경고창
		 alert("제목을 입력하세요!");
		 $("#detail_title").val('').focus();
		return false;
		 }
	else if($.trim($('#detail_dayto').val())==""){
		 alert("상영기간을 입력하세요!");
		 $("#detail_dayto").val('').focus();
		return false;
		 }
	else if($.trim($('#detail_runtime').val())==""){
		 alert("관람시간을 입력하세요!");
		 $("#detail_runtime").val('').focus();
		return false;
		 }
	else if($.trim($('#detail_actor').val())==""){
		 alert("출연진 정보를 입력하세요!");
		 $("#detail_actor").val('').focus();
		return false;
		 }
	else if($.trim($('#theater_notice').val())==""){
		 alert("공연시간안내을 입력하세요!");
		 $("#theater_notice").val('').focus();
		return false;
		 }
	else if($.trim($('#summernote').val())==""){
		 alert("내용 및 포스터를 입력하세요!");
		 $("#summernote").val('').focus();
		return false;
		 } else{
			    for(var i=0; i<$('#file_upload_dp_poster')[0].files.length; i++){
			        formData.append('file', $('#file_upload_dp_poster')[0].files[i]);
			        console.log('실행');
			    }
			    $.ajax({
			        type:"post",
			        url: 'td_imgInsert',
			        data: formData,
			        processData: false,
			        contentType: false,
			        success: function (data) {
			            	theaterInfo(data.url);
			        }
			    });
			 
		 }
	
}

function theaterInfo(url){
	 var D_age = $("#theaterD_age option:selected").text()
	const boardInfo={
			 td_title:$("#detail_title").val(),
			 td_viewdays:$("#detail_dayto").val(),
			 td_agegrade:D_age,
			 td_actor:$("#detail_actor").val(),
			 td_tinfo:$("#theater_notice").val(),
			 td_detailposter:$("#summernote").val(),
			 td_ticketinginfo:$("#detail_runtime").val(),
			 td_location:$("#basictheater_location option:selected").text(),
			 td_mainposter:url,
   		email:"${login.email}"
   	};
	console.log(boardInfo);
	$.ajax({
        type: "post",
        url: 'td_insert',
        headers:{"Content-Type":"application/json"},
        data:JSON.stringify(boardInfo),
        processData: false,
        contentType: false,
        success: function (data) {
            ticketInfoInsert(data.td_no);
            console.log(data);
        }
    });
	
}
function ticketInfoInsert(td_no){
	if(a>=1){
		var runtimeDate = $("#runtimeDate"+a).val();
		var starttime = $("#starttime"+a).val();
		var endtime = $("#endtime"+a).val();
	console.log(td_no);
		var td_no = td_no;
		var td_runtime = runtimeDate+" "+starttime+"~"+endtime;
		var td_stgrade = $("#seat_select"+a).val();
		var td_stprice = $("#seat_price"+a).val();
		
		console.log(td_no);
		console.log(td_runtime);
		console.log(td_stgrade);
		console.log(td_stprice);
		
		const ticketInfo={
				td_no:td_no,
				td_runtime:td_runtime,
				td_stgrade:td_stgrade,
				td_stprice:td_stprice
		}
		console.log(ticketInfo);
		$.ajax({
	        type: "post",
	        url: 'ticket_insert',
	        headers:{"Content-Type":"application/json"},
	        data:JSON.stringify(ticketInfo),
	        processData: false,
	        contentType: false,
	        success: function () {
	            a = a-1;
	            ticketInfoInsert(td_no);
	        }
	    });
		
	}else{
		alert('연극 등록 완료');
		location.href="IY_theater_list";
	}
}



</script>
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>
