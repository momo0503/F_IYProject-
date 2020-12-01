<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인생연극 - 비밀번호 찾기</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 

<link rel="stylesheet"  href="./resources/JavaScript/IYUI.css" type="text/css" />
</head>
<body>


	<div id="IYWrap">
		<!-- #################### 간략 HEADER 영역 시작 #################### -->
		<div id="IYHeader">
			<div class="IYHeaderAera">
				<h1>
					<a href="lifetheater" id="aLogo" class="lnk_logo"><img
						src="./resources/img/include/LT.png" width="150" height="100" /></a> <span
						class="servName off"><a href="IY_id_search" id="aForgetId">아이디
							찾기</a></span> <span class="servDivi">|</span> <span class="servName"><a
						href="IY_pw_search" id="aForgetPw">비밀번호 찾기</a></span>
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
				<div id="divSearch">


					<!-- ############################## 개인회원 비밀번호 찾기 방법 영역 시작 ############################## -->
					<div id="searchIDPW_p_wrap" class="searchIDPW_wrap">
						
							<div class="IYTab_botCont"></div>

							<!-- ############### 이메일 주소로 찾기 영역 시작 ############### -->

							
								<div class="IYIptRow">
									<span id="spanEmailMemID"
										class="IYIpt m_size ipt_wSizeF focus_blue"> <input
										id="txtEmailMemID" type="text" placeholder="이메일 아이디">
									</span>
								</div>
								<div class="IYIptRow mgt10">
									<span id="spanEMail"
										class="IYIpt m_size ipt_wSizeF focus_blue"> <input
										id="txtPhone" type="text" placeholder="휴대폰 번호">
									</span>
								</div>
								
									<div class="IYIptRow mgt10">
								<button type="button" id="btnpwinfo" title="추가정보"
									
									class="btnC m_size btn_wSizeF btn_blue">
									<span class="bWrap"><em
										class="txt">입력</em></span>
										</button>

						<!-- 		<div class="IYIptRow mgt10">
									<a href="javascript:void(0);" onclick="IdCheck('E');"
										class="btnC m_size btn_wSizeF btn_blue"><span
										class="bWrap"><em class="txt">찾기</em></span></a>
								</div>
							 -->
						
						
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
$("#btnpwinfo").click(function(){
	 const email=$('#txtEmailMemID').val();
   	const phone=$('#txtPhone').val();
   	
   	const userinfo={
   			email:email,
   			phone:phone	
   	};	 
   	console.log(userinfo);
    $.ajax({
		type:"post",
		url:"IY_searchpw",
		headers:{"Content-Type":"application/json"},
		dataType:"text",
		data:JSON.stringify(userinfo),
		success:function(get){
			//비밀번호 변경페이지
			if(get=="ok"){
				alert(get);
				$("#searchIDPW_p_wrap").html(		
						'<div class="IYTab_botCont"></div>'
						+'<div class="IYIptRow"><span id="spanEmailMemNm"'
						+'class="IYIpt m_size ipt_wSizeF focus_blue">'
						+'<input id="txtPw" type="password" placeholder="비밀번호"></span></div>'
						+'<div class="IYIptRow row_btnR_120 mgt10">'
						+'<span id="spanEMail" class="IYIpt m_size ipt_wSizeF focus_blue">'
						+'<input id="txtPwMatch" type="password" placeholder="비밀번호 확인"></span></div>'
						+'<div class="IYIptRow mgt10">'
						+'<button type="button" id="btnidinfo" title="추가정보"'
						+'class="btnC m_size btn_wSizeF btn_blue">'
						+'<span class="bWrap"><em class="txt">입력</em></span></button></div>'
						)
						
						$("#btnidinfo").click(function(){
							const getPwCheck=RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
							 const pw=$('#txtPw').val();
							 
						  	const pwMatch=$('#txtPwMatch').val();
						  	console.log("di");
						  	if(pw===pwMatch){
						  	if((getPwCheck.test(pw) && (pw.length>=8 && pw.length<=14)) && pw!=""){
						  	
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
						  		alert("특수문자 포함 8자이상 14자이하로 작성해주세요!")
						  	}
						  	}else{
								alert("비밀번호와 확인란이 일치하지 않음")
								
						}
						   });
	
			}else{
				alert("부적절");
			}
		},error:function(){
			console.log("실패");
		}
    })
    });


</script>


</body>
</html>