<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/basictheaterwrite.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js">
	
</script>
<style type="text/css">
.theater_view_title{
word-break: break-all;
    font-size: 35px;
    color: #333;
    line-height: 40px;
    font-weight: bold;
    letter-spacing: -0.003em;
    font-family: 'Noto Sans KR','NanumBarunGothic','맑은 고딕','Malgun Gothic',sans-serif;
    margin-bottom: 15px;
}
.theater_view_viewdays {
    font-size: 15px;
    color: #666
}
.theater_view_cont{
font-size: 15px;
    color: #333;
    font-weight: bold;
    float: left;
    line-height: 35px;
}
.theater_selectgrade,.select_location{
    font-size: 15px;
    color: #333;
    clear: right;
    margin: 0 0 3px 86px;
    line-height: 35px;
    position: relative;
}
.theater_td_ticketinginfo{
    font-size: 15px;
    color: #333;
    clear: right;
    margin: 0 0 3px 58px;
    line-height: 35px;
    position: relative;
}
.theater_td_actor{
    font-size: 15px;
    color: #333;
    clear: right;
    margin: 0 0 3px 86px;
    line-height: 35px;
    position: absolute;
}
.theater_view_guide{
    font-size: 15px;
    color: #333;
    font-weight: bold;
    line-height: 35px;
}
.theater_td_tinfo{
margin-left: 2px;
    color: #666;
    line-height: 23px;
    font-size: 14px;
}
.detailposterHeader{
    display: inline-block;
    height: 55px;
    line-height: 55px;
    width: 180px;
    border-top: 3px solid #fff;
    font-size: 22px;
}
img {
display:block;
}
.td_posterBox{
	display: inline-block;
}
</style>
</head>
<body>
	<jsp:include page="../../include/header.jsp" />
	
	<div class="info_wrap" id="info_submit">
				<!--큰 제목-->
			<div class="detail_title_box">
				<p>
					<span class="theater_view_title">${btview.td_title}</span><br>
					<div style="margin:10px 0px;"></div>
					<span class="theater_view_viewdays">${btview.td_viewdays}</span>
					<div style="margin:10px 0px;"></div>
				</p>
			</div>
	</div>


	<div class="detail_wrap_box">
		<div class="detail_wrap_content">
			<div class="detail_top_view">
				<!--상단-->
				<!-- poster upload -->
				<br>
				
					<img src="${btview.td_mainposter}" style="float: left;">
				
						<br>
					<br>



				<div class="detail_top_right">
					<!--상품정보-->
					<div class="detail_top_right_product">
						<!--등급, 관람시간, 출연, 가격, 혜택-->
							<div class="theater_agegradeBox" style="display: inline-block;">
								<span class="theater_view_cont">등급</span><div class="theater_selectgrade" style="display: inline-block;">${btview.td_agegrade}</div>
							</div>
							<br>
							<div class="td_location_box" id="td_location_box" style="display: inline-block;">
								<span class="theater_view_cont">지역</span> <div class="select_location" style="display: inline-block;">${btview.td_location}</div>
							</div>
							<br>
							<br>		
							<span class="theater_view_cont">관람시간</span><div class="theater_td_ticketinginfo" style="display: inline-block;">${btview.td_ticketinginfo}</div>
							<br>
							<br>
							<div style="overflow: hidden;">
							<span class="theater_view_cont">출연</span><div class="theater_td_actor" style="display: inline-block;">${btview.td_actor}</div>
							</div>
							<br>
							<br>
						<div>
							<p id="notice_tag">
								<br>
								<span class="theater_view_guide">공연시간 안내</span>
								<br />
								<br />
								<span class="theater_td_tinfo">
									${btview.td_tinfo }
								</span>
							</p>
						</div>

							<div id="seat_price_in" class="seat_price_in">
								
							</div>
								<br>
								<br>
					</div>
				</div>
			</div>
			<div class="detail_low_view" style="border-top: 2px solid #333;text-align: center;">
				<div>
					<span class="detailposterHeader">상세 정보</span>
				</div>
				<div style="display: inline-block;">
					${btview.td_detailposter}
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../../include/footer.jsp" />
</body>
</html>
