<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인생연극 - 아이디 찾기</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 

<link rel="stylesheet"  href="./resources/JavaScript/IYUI.css" type="text/css" />
</head>
<body>
<%String email= request.getParameter("email"); %>

	<div id="IYWrap">
		<!-- #################### 간략 HEADER 영역 시작 #################### -->
		<div id="IYHeader">
			<div class="IYHeaderAera">
				<h1>
					<span class=""><a href="lifetheater" id="aLogo" class="lnk_logo"><img
							src="./resources/img/include/LT.png" width="150" height="100" /></a></span> <span
						class="servName">비밀번호 변경</span> 
				</h1>
				<div class="headerLnk">
					<a href="IY_login" id="aTopLogin" class="btnC m_size w_120"><span
						class="bWrap"><em class="txt">로그인</em></span></a> <a href="IY_membership"
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
									id="txtPw" type="password" placeholder="비밀번호">
								</span>
							</div>

							<div class="IYIptRow row_btnR_120 mgt10">
								<span id="spanEMail" class="IYIpt m_size ipt_wSizeF focus_blue">

									<input id="txtPwMatch" type="password" placeholder="비밀번호 확인">
								</span>

							</div>
							
								<div class="IYIptRow mgt10">
								<button type="button" id="btnidinfo" title="추가정보"
									
									class="btnC m_size btn_wSizeF btn_blue">
									<span class="bWrap"><em
										class="txt">입력</em></span>
										</button>

						<!-- 	<div class="IYIptRow mgt10">
								<a href="javascript:void(0);" onclick="IdSearch('E');"
									class="btnC m_size btn_wSizeF btn_blue"><span class="bWrap"><em
										class="txt">찾기</em></span></a>
							</div> -->
						

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


<script type="text/javascript">
$("#btnidinfo").click(function(){
	 const pw=$('#txtPw').val();
   	const pwMatch=$('#txtPwMatch').val();
   	const email="<%=email%>"
   	if(pw===pwMatch){
   	const pwUpdate={
   			pw:pw,
   			email:email
   	};	 
    $.ajax({
		type:"post",
		url:"IY_pwupdate",
		headers:{"Content-Type":"application/json"},
		dataType:"text",
		data:JSON.stringify(pwUpdate),
		success:function(ok){
			alert(ok);
			location.href="IY_login";
		},error:function(){
			console.log("실패");
		}
    })
   	}else{
	alert("비밀번호가 일치하지 않음");
}
    });



</script>

</body>
</html>