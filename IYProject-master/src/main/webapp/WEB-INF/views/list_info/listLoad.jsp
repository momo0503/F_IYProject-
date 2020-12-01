<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/listLoad.css">
<script src="./resources/js/jquery.js"></script>
	<jsp:include page="../../include/header.jsp" />
</head>
<body>
	<div id="list_wrap">
		<div id="list_li1">
			<span id="li_tit1"> 연극 </span> <span class="list_arrow_right">></span>
			<div id="list_tit_slid_submenuBox">
				<button id="li_tit_slidcheckBtn" onclick="slidOnOff();">
					<span id="li_tit2_on"> 전체보기 </span> <span id="li_tit2_updown">∨
					</span>
				</button>
				<div id="list_tit_slid_submenu" style="display: none;">
					<span id="li_tit2_select" style="display: inline;"> 
					<a class="li_title_selecter" style="cursor: pointer;">전체보기</a><br>
						<a class="li_title_selecter" style="cursor: pointer;">대학로</a><br>
						<a class="li_title_selecter" style="cursor: pointer;">기타 지역</a>
					</span>
				</div>
			</div>

		</div>
		<div id="list_tot_cntBox">
			<span class="list_tot_cntname">현재 예매 가능한 공연은 </span> <span
				id="list_tot_cnt">0</span> <span class="list_tot_cntname">개
				입니다</span>
		</div>

		<div class="list_img_lazyload">	
			<!-- img box -->
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
		</div>
		<div class="list_img_lazyload">
			<!-- img box -->
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
		</div>
		<div class="list_img_lazyload">
			<!-- img box -->
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='IY_detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
		</div>
		<div class="list_img_lazyload">
			<!-- img box -->
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='list_info/detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='list_info/detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='list_info/detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='list_info/detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
			<div class="list_wrap_infoBox">
			<a style="cursor: pointer;" onclick="location='list_info/detailPage'" title="연극 [0]"> <!-- img box click -->
				<div class="list_box_wrap">

					<img class="lazyload" alt="연극 [name]"
						src="./resources/img/image01.jpeg" style="">
					<div class="list_tit_txt">
						<p class="list-b-tit1">연극 [name]</p>
						<p class="list-b-tit2">YYYY.MM.DD ~ YYYY.MM.DD</p>
						<p class="list-b-tit2">location</p>
					</div>
				</div>
			</a>
			</div>
		</div>
	</div>
		<jsp:include page="../../include/footer.jsp" />
</body>
<script>
	slidcheck = 1;
	function slidOnOff() {
		if (slidcheck == 1) {
			//슬라이드 open 실행
			$("#li_tit2_updown").html('∧');
			$('#list_tit_slid_submenu').css({
				'display' : 'inline-block'
			});
			slidcheck = 0;
		} else if (slidcheck == 0) {
			//슬라이드 close 실행
			$("#li_tit2_updown").html('∨');
			$('#list_tit_slid_submenu').css({
				'display' : 'none'
			});
			slidcheck = 1;
		}
	}
</script>
</html>



















