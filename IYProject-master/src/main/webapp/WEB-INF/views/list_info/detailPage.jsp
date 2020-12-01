<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/detailPage.css">
<script src="./resources/js/jquery.js"></script>
</head>
	<jsp:include page="../../include/header.jsp" />
<div class="detail_title_wrap">
	<div class="detail_title_box">
		<!--큰 제목-->
		<p class="detail_title_name">연극종류[연극이름]</p>


		<div>
			<p>
				<span class="detail_title_days">YYYY.MM.DD ~ YYYY.MM.DD</span>
			</p>
		</div>
	</div>
	</div>

	<div class="detail_wrap_box">
		<div class="detail_wrap_content">
			<div class="detail_top_view">
				<!--상단-->
				<div class="detail_image_p">
					<!--포스터-->
					<img class="detail_images_box" src="./resources/img/image01.jpeg">
				</div>

				<div class="detail_top_right">
					<!--상품정보-->
					<div class="detail_top_right_product">
						<!--등급, 관람시간, 출연, 가격, 혜택-->
						<dl>
							<dt>등급</dt>
							<dd>&nbsp;만 7세 이상 관람가</dd>
							<dt>관람시간</dt>
							<dd>&nbsp;100분</dd>
							<dt>출연</dt>
							<dd>
								&nbsp;<a href="#"
									target="_blank" class="rn-product-peole">김태경</a><a
									href="#" target="_blank"
									class="rn-product-peole">권순형</a><a
									href="#" target="_blank"
									class="rn-product-peole">신아라</a><a
									href="#" target="_blank"
									class="rn-product-peole">곽예헌</a><a
									href="#" target="_blank"
									class="rn-product-peole">심유라</a><a
									href="#" target="_blank"
									class="rn-product-peole">박희연</a><a
									href="#" target="_blank"
									class="rn-product-peole">전형준</a><a
									href="#" target="_blank"
									class="rn-product-peole">박성원</a><a
									href="#" target="_blank"
									class="rn-product-peole">신승철</a><a
									href="#" target="_blank"
									class="rn-product-peole">김지욱</a><a
									href="#" target="_blank"
									class="rn-product-peole">문종영</a><a
									href="#" target="_blank"
									class="rn-product-peole">김범수</a>
							</dd>
							<dt id="dtPrice">가격</dt>
							<dd id="divPrice" class="rn-product-price">
								<ul
									class="rn-product-price1 scroll-color mCustomScrollbar _mCS_3 mCS_no_scrollbar">
									<div id="mCSB_3"
										class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
										tabindex="0" style="max-height: none;">
										<div id="mCSB_3_container"
											class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
											style="position: relative; top: 0; left: 0;" dir="ltr">
											<li>전석 <span class="rn-red">35,000</span>원
											</li>
										</div>
										<div id="mCSB_3_scrollbar_vertical"
											class="mCSB_scrollTools mCSB_3_scrollbar mCS-light mCSB_scrollTools_vertical"
											style="display: none;">
											<div class="mCSB_draggerContainer">
												<div id="mCSB_3_dragger_vertical" class="mCSB_dragger"
													style="position: absolute; min-height: 30px; height: 0px; top: 0px;">
													<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
												</div>
												<div class="mCSB_draggerRail"></div>
											</div>
										</div>
									</div>
								</ul>
							</dd>
						</dl>
					</div>
					<!--포인트-->

					<div class="detail_top_right_down">
						<!--공연시간안내, 배송정보-->
						<dl>
							<dt>공연시간 안내</dt>
							<br/><br/>
							
							<dd>
								2018년 03월 10일(토) ~ OPEN RUN <br>토,일 오후 1시 / 평일 공연없음 <br>*
								8월 공연없음 <br>* 9월 30일(수) 공연없음
							</dd>
							<dt>배송정보</dt>
							<dd>현장 수령만 가능</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>

	</div>
		<jsp:include page="../../include/footer.jsp" />
<body>
</body>
</html>