<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인생연극 -  추가 정보 입력</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 

<link rel="stylesheet"  href="./resources/JavaScript/IYUI.css" type="text/css" />
</head>
<body>
<%String email= request.getParameter("email"); %>
<%String loginway=request.getParameter("loginWay"); %>


	<div id="IYWrap">
		<!-- #################### 간략 HEADER 영역 시작 #################### -->
		<div id="IYHeader">
			<div class="IYHeaderAera">
				<h1>
					<span class=""><a href="lifetheater" id="aLogo" class="lnk_logo"><img
							src="./resources/img/include/LT.png" width="150" height="100" /></a></span>
							 <span
						class="servName">추가 정보 입력</span>
							
				</h1>
				
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

						<!-- ############### 휴대폰 정보 추가 저장 영역 시작 ############### -->

						

							
							<div class="IYIptRow row_btnR_120 mgt10">
								<span id="spanEMail" class="IYIpt m_size ipt_wSizeF focus_blue">

									<input id="txtPHONE" type="text" placeholder="휴대폰 번호">
									<input id="hiddenemail" type="hidden" value=<%=email %>>
								</span>

							</div>
							
						<div class="IYIptRow mgt10">
								<button type="button" id="btninfo" title="추가정보"
									
									class="btnC m_size btn_wSizeF btn_blue">
									<span class="bWrap"><em
										class="txt">입력</em></span>
										</button>
											</div>

						<!-- 	<div class="IYIptRow mgt10">
								<a href="javascript:void(0);" onclick="IdSearch('E');"
									class="btnC m_size btn_wSizeF btn_blue"><span class="bWrap"><em
										class="txt">입력</em></span></a>
							</div>
						 -->

						<!-- ############### 휴대폰 정보 추가 저장 영역 끝 ############### -->

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
	<c:set var="loginway" value="<%=loginway%>"></c:set>
	<c:if test="${loginway eq '3'}">
	<script type="text/javascript">
	 $("#btninfo").click(function(){
		 const phone=$('#txtPHONE').val();
	    	const email=$('#hiddenemail').val();
	    	
	    	const moreinfo={
	    			phone:phone,
	    			email:email
	    	};	 
		 $.ajax({
	    		type:"post",
	    		url:"kakaomoreinsert",
	    		headers:{"Content-Type":"application/json"},
	    		dataType:"json",
	    		data:JSON.stringify(moreinfo),
	    		success:function(userinfo){
	    			$.ajax({
	    				type:"post",
	    				url:"kakaologin",
	    				headers:{"Content-Type":"application/json"},
	    				dataType:"json",
	    				data:JSON.stringify(userinfo),
	    				success:function(user){
	    					alert(userinfo.name+"님 환영합니다");
	    					location.href="lifethater";
	    				}
	    				
	    			})
	    		}
		 })
		 
		 
	 });
	
	</script>
</c:if>
	<c:if test="${loginway eq '2'}">
	<script type="text/javascript">
	 $("#btninfo").click(function(){
		 const phone=$('#txtPHONE').val();
	    	const email=$('#hiddenemail').val();
	    	
	    	const moreinfo={
	    			phone:phone,
	    			email:email
	    	};	 
		 $.ajax({
	    		type:"post",
	    		url:"navermoreinsert",
	    		headers:{"Content-Type":"application/json"},
	    		dataType:"json",
	    		data:JSON.stringify(moreinfo),
	    		success:function(userinfo){
	    			$.ajax({
	    				type:"post",
	    				url:"naverlogin",
	    				headers:{"Content-Type":"application/json"},
	    				dataType:"json",
	    				data:JSON.stringify(userinfo),
	    				success:function(user){
	    					alert(userinfo.name+"님 환영합니다");
	    					location.href="lifetheater";
	    				}
	    				
	    			})
	    		}
		 })
		 
		 
	 });
	
	</script>
</c:if>
</body>
</html>