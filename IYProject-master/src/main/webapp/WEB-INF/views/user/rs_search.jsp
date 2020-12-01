<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인생연극 - 예매번호 찾기</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 

<link rel="stylesheet"  href="./resources/JavaScript/IYUI.css" type="text/css" />
</head>
<body>


	<div id="IYWrap">
		<!-- #################### 간략 HEADER 영역 시작 #################### -->
		<div id="IYHeader">
			<div class="IYHeaderAera">
				<h1>
					<span class=""><a href="/hyeah/" id="aLogo" class="lnk_logo"><img
							src="./resources/img/login/LT.png" width="150" height="100" /></a></span>
							 <span
						class="servName">예매번호 찾기</span>
							
				</h1>
				<div class="headerLnk">
					<a href="login" id="aTopLogin" class="btnC m_size w_120"><span
						class="bWrap"><em class="txt">로그인</em></span></a> <a href="membership"
						class="btnC m_size w_120"><span class="bWrap"><em
							class="txt">회원가입</em></span></a>

				</div>
			</div>
		</div>
		<!-- #################### 간략 HEADER 영역 끝 #################### -->

		<!-- #################### 간략 Content 영역 시작 #################### -->
		<div id="IYContent" class="pat60 pab60">
			<div id="searchIdPw" class="IYContRow">
				<div id="divFind">

					<!-- ############################## 개인회원 아이디 찾기 방법 영역 시작 ############################## -->
					<div id="searchIDPW_p_wrap" class="searchIDPW_wrap">
						<div class="IYTab_botCont"></div>

						<!-- ############### 이메일 주소로 찾기 영역 시작 ############### -->

						
							<div class="IYIptRow">
								<span id="spanEmailMemNm"
									class="IYIpt m_size ipt_wSizeF focus_blue"> <input
									id="txtEmailMemNm" type="text" placeholder="이메일 아이디">
								</span>
							</div>

							<div class="IYIptRow row_btnR_120 mgt10">
								<span id="spanEMail" class="IYIpt m_size ipt_wSizeF focus_blue">

									<input id="txtEmail" type="text" placeholder="이름">
								</span>

							</div>
							
							<div class="IYIptRow row_btnR_120 mgt10">
								<span id="spanEMail" class="IYIpt m_size ipt_wSizeF focus_blue">

									<input id="txtEmail" type="text" placeholder="휴대폰 번호">
								</span>

							</div>

							<div class="IYIptRow mgt10">
								<a href="javascript:void(0);" onclick="IdSearch('E');"
									class="btnC m_size btn_wSizeF btn_blue"><span class="bWrap"><em
										class="txt">찾기</em></span></a>
							</div>
						

						<!-- ############### 이메일 주소로 찾기 영역 끝 ############### -->

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- #################### 간략 FOOTER 영역 시작 #################### -->
	<div id="IYFooter">
		<div class="IYFooterAera pos_r">
			<address>
				Copyright &#0169; <strong>HyeAh Corp.</strong> All Rights Reserved.
				<div class="pos_a" style="left: 0; top: 0; color: #F8F8F8;">EQUUS10</div>
			</address>
		</div>
	</div>
	<!-- #################### 간략 FOOTER 영역 시작 #################### -->
	</div>


</body>
</html>