<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>인생연극</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 

<link rel="stylesheet"  href="./resources/JavaScript/IYUI.css" type="text/css" />
</head>
<body>


	<div id="IYWrap">
		<!-- #################### 간략 HEADER 영역 시작 #################### -->
		<div id="IYHeader">
			<div class="IYHeaderAera">

				<h1>
					<!-- <a class="lnk_logo" href="#"><img src="./img/logo.jpg" width="180" height="100" border="0" alt="인생연극"></a> -->
					<span class="servName"><a href="lifetheater"><img alt="lifetheater" src="./resources/img/include/rectanglelogo.png"></a></span>
				</h1>
				<div class="headerLnk">
					<a href="IY_membership" class="btnC m_size w_120"><span
						class="bWrap"><em class="txt">회원가입</em></span></a>
				</div>
			</div>
		</div>
		<!-- #################### 간략 HEADER 영역 끝 #################### -->

		<!-- #################### 간략 Content 영역 시작 #################### -->
		<div id="IYContent" class="pat60 pab60">
			<div id="loginFormWrap" class="IYContRow clearfix">
				<!-- ############################## 로그인 관련 영역 시작 ############################## -->
				<div class="loginCont">
					<!-- ############### 탭 영역 시작 ############### -->
					<div id="divTabMemberArea" class="IYTab_nor IYTab_blue tab_2col">
						<ul id="ulTabMember">
							<li id="liTabMember" class="on firstCol"><a
								href="javascript:void(0);" id="aTabMember"
								onClick="chgTabLogin(this,'mem');"><span class="txt">회원</span></a></li>
							<li id="liTabNoMember" class="lastCol"><a
								href="javascript:void(0);" id="aTabNoMember"
								onClick="chgTabLogin(this,'nMem');"><span class="txt">비회원 예매번호 찾기</span></a></li>
						</ul>
					</div>
					<!-- ############### 탭 영역 끝 ############### -->
					<!-- ############### 로그인 폼 : 회원 영역 시작 ############### -->
					<div id="memLoginForm" class="loginFormGrp">

						<form method="post" name="LoginSub" autocomplete="off">
							<fieldset class="loginForm">

								<span id="spanMemID" class="IYIpt b_size ipt_wSizeF focus_blue">
									<input id="SMemberID" name="SMemberID" type="text"
									autocomplete="off" value="${cookie.loginsave.value}" maxlength="100"
									placeholder="이메일 아이디" />
								</span> <span id="spanMemPW"
									class="IYIpt b_size ipt_wSizeF focus_blue mgt10"> <!-- <label for="SMemberPassword">비밀번호</label> -->
									<input id="SMemberPassword" name="SMemberPassword"
									type="password" autocomplete="off" maxlength="20"
									placeholder="비밀번호" />
								</span>
								<div class="loginForm_chk">
									<span class="IYChk"> <label for="chkAutoLogin"><em
											class="ico_IYChk bgYUI"></em>로그인 상태 유지</label> <input
										id="chkAutoLogin" name="chkAutoLogin" type="checkbox"
										autocapitalize="off" class="iptChk" />
									</span> 
									<c:if test="${cookie.loginsave eq null}">
									<span class="IYChk"> <label for="chkLoginIDSave"><em
											class="ico_IYChk bgYUI"></em>아이디 저장</label> <input
										id="chkLoginIDSave" name="chkLoginIDSave" type="checkbox"
										autocapitalize="off" class="iptChk" />
									</span>
									</c:if>
									<c:if test="${cookie.loginsave ne null}">
									<span class="IYChk"> <label for="chkLoginIDSave"><em
											class="ico_IYChk bgYUI"></em>아이디 저장</label> <input
										id="chkLoginIDSave" name="chkLoginIDSave" type="checkbox"
										autocapitalize="off" class="iptChk" checked="checked"/>
									</span>
									</c:if>
								</div>


								<button type="button" id="btnLogin" title="로그인"
									
									class="btn_login btnC xb_size btn_blue">
									<span class="bWrap"><em class="txt">로그인</em></span>
								</button>
							</fieldset>
						</form>
						<!-- ##### 아이디 비번 찾기 영역 시작 ##### -->
						<div class="loginEtc">
							<a href="IY_id_search" class="lnk_etc">아이디 찾기</a> <em class="divi">|</em>
							<a href="IY_pw_search" class="lnk_etc">비밀번호 찾기</a>

						</div>
						<!-- ##### 아이디 비번 찾기 영역 끝 ##### -->
						<!-- ##### 쇼셜 로그인 영역 시작 ##### -->

						<ul class="loginSocialLi">
							<li class="oddCol "><a href="javascript:void(0);"
								id="FBLoginSub_aBtnNaverLogin" 
								class="btn_social"><span class="bWrap"><em
										class="ico_social ico_na bgMem"></em><em class="txt">네이버
											아이디로 로그인</em></span></a></li>
							<li class="evenCol"><a href="javascript:void(0);"
								id="FBLoginSub_aBtnKakaoLogin"
								class="btn_social"><span class="bWrap"><em
										class="ico_social ico_ka bgMem"></em><em class="txt">카카오
											아이디로 로그인</em></span></a></li>
						</ul>

						<!-- ##### 쇼셜 로그인 영역 끝 ##### -->
						</script>

					</div>
					<!-- ############### 로그인 폼 : 회원 영역 끝 ############### -->
					<!-- ############### 로그인 폼 : 비회원 영역 시작 ############### -->
					<div id="nMemLoginForm" class="loginFormGrp" style="display: none;">
						<form name="frmNoMemberLogin" method="post"
							action="./FTLogin.aspx" id="frmNoMemberLogin" autocomplete="off">
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
								<div class="IYIptRow mgt10">
								<a href="javascript:void(0);" onclick="IdSearch('E');"
									class="btnC m_size btn_wSizeF btn_blue"><span class="bWrap"><em
										class="txt">찾기</em></span></a>
							</div>
							</div>
						</form>
						<!-- ##### 예매번호 찾기 영역 시작 ##### -->
					</div>
				</div>
				<!-- ############################## 로그인 관련 영역 끝 ############################## -->
				<!-- ############################## 광고 관련 영역 시작 ############################## -->
				<div class="login_adArea">

					<div class="adBig">

						<iframe id="adframeRight" src="./resources/img/login/gg.png"
							width="360" height="360" noresize scrolling="no" frameborder="0"
							marginheight="0" marginwidth="0"></iframe>
					</div>
					<div class="adSmall">

						<iframe id="adframeBottom" src="./resources/img/login/oo.jpg"
							width="360" height="140" noresize scrolling="no" frameborder="0"
							marginheight="0" marginwidth="0"></iframe>
					</div>
				</div>
				<!-- ############################## 광고 관련 영역 끝 ############################## -->
			</div>
		</div>



		<!-- #################### 간략 Content 영역 끝 #################### -->
		<hr />
		<!-- #################### 간략 FOOTER 영역 시작 #################### -->
		<div id="IYFooter">
			<div class="IYFooterAera pos_r">
				<address>
					Copyright &#0169; <strong> HyeAh Corp.</strong> All Rights
					Reserved.
					<div class="pos_a" style="left: 0; top: 0; color: #F8F8F8;">EQUUS7</div>
				</address>
			</div>
		</div>
		<!-- #################### 간략 FOOTER 영역 시작 #################### -->
	</div>

	<script type="text/javascript">
	//네이버 로그인 url
	  <%
	    String clientId = "yNBXdmQkw280ggG5Pgs5";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8011/controller/navercallback", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	 %>
	 //카카오 로그인 url
	 <%
	
	 String kakaoclientId="ba448362f6962e17e085b0b2349be544";//카카오 클라이언트 아이디값
	 String kakaoredirectURI="http://localhost:8011/controller/kakaoRedirect";
	 String kakaoapiURL="https://kauth.kakao.com/oauth/authorize?response_type=code";
	 kakaoapiURL +="&client_id="+kakaoclientId;
	 kakaoapiURL +="&redirect_uri="+kakaoredirectURI;
	 
	 %>
	 
	 
	

		function chgTabLogin(obj, oId) {
			$(obj).parent().parent().find("li").removeClass("on");
			$(obj).parent().addClass("on");
			$("#loginFormWrap .loginFormGrp").hide();
			$("#" + oId + "LoginForm").show();

		}
		
		
		   $("#btnLogin").click(function(){
		    	const email=$('#SMemberID').val();
		    	const pw=$('#SMemberPassword').val();
		    	const autologin=$("input[id=chkAutoLogin]").is(":checked");
		    	const loginsave=$("input[id=chkLoginIDSave]").is(":checked");
		    	
		    	console.log(email);
		    	console.log(pw);
		    	console.log(autologin);
		    	console.log(loginsave);
		    	
		    	const userinfo={
		    			email:email,
		    			pw:pw,
		    			autologin:autologin,
		    			loginsave:loginsave
		    	};
		    	console.log(userinfo);
		    	
		    	$.ajax({
		    		type:"post",
		    		url:"IY_login",
		    		headers:{"Content-Type":"application/json"},
		    		dataType:"text",
		    		data:JSON.stringify(userinfo),
		    		success:function(data){
		    			console.log("테스트");
		    			console.log(data);
		    			console.log(data=="loginok");
		    			if(data=="loginok"){
		    				alert(email+"님 환영합니다.");
		    				if(document.referrer=='http://localhost:8011/controller/IY_id_search'||document.referrer=='http://localhost:8011/controller/IY_pw_search'){
		    					location.href='lifetheater';
		    				}else{
		    				location.href=document.referrer;
		    				}
		    			}else{
		    				if(data=="loginno"){
		    					alert("이메일 인증을 해주세요.")
		    				}
		    				if(data=="pwfail"){
		    					alert("비밀번호가 틀렸습니다.")

		    				}
							if(data==""){

		    					alert("아이디가 존재하지 않습니다.")
		    				}
		    				
		    			}
		    			
		    		},error:function(){
		    			console.log("실패");
		    		}
		    	})
		    	
		    });
		   
		   
		   $("#FBLoginSub_aBtnNaverLogin").click(function(){
			   
			   location.href="<%=apiURL%>";
			   
		
		   });
		   
		   $("#FBLoginSub_aBtnKakaoLogin").click(function(){
			   location.href="<%=kakaoapiURL%>";
		   })
		  


		   
		   
	
	</script>
</body>
</html>
