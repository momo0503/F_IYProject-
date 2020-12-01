<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 - 인연</title>
<link rel='stylesheet' type='text/css' href="./resources/css/main.css"/>
<link rel='stylesheet' type='text/css' href="./resources/css/mypage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../../include/header.jsp" />
<div class="container">
  <div class="mypage-left-lnb-wrap">
    <nav class="mypage-left-manu">
      <p class="mypage-left-manu-tit">
      	<a href="IY_mypage">나의 인연</a>
      </p>
      <ul>
        <c:if test="${login.membertype eq '1'.charAt(0) }">
          <li><a href="IY_mypage_reservation">예매내역</a></li>
        </c:if>
        <li><a href="IY_mypage_board">게시글 내역</a>
        <li><a href="IY_mypage_edit_user">회원정보</a>
        </li>
      </ul>
    </nav>
  </div>


  <div class="mypage-right-wrap">
    <div class="mypage-contents">
        <div class="mypage-edit-user-ck">
      <div class="mypage-tit">
        <p>회원정보 - 비밀번호 변경</p>
      </div>
       <div class="clear"></div>
        <form action="${pageContext.request.contextPath}/IY_mypage_edit_pwd_ok" onSubmit='return check()' method='POST'>
      <div class="mypage-edit-user-ck-pwd">
          <p>변경할 비밀번호를 입력해 주세요</p>
          <table>
            <tr><th>현재 비밀번호 </th><td><input type="password" maxlenth="20" name="curpwd" id="curpwd" class="mypage-input-pwd"></td></tr>
            <tr><th>변경할 비밀번호 </th><td><input type="password" maxlenth="20" name="chgpwd" id="chgpwd" class="mypage-input-pwd"></td></tr>
            <tr><th>변경할 비밀번호 확인 </th><td><input type="password" maxlenth="20" name="pwdcheck" id="pwdcheck" class="mypage-input-pwd"></td></tr>                        
          </table>
          	
          </div>
          <div class="mypage-edit-user-ck-pwd-btn">
             <button id=cancel>취소</button>
             <button type="submit" id="ok">확인</button>
        </form>
      </div>
    </div>
    
    <script>
    function check(){
    	if($("#curpwd").val().trim()==''){
				alert('비밀번호를 입력해주세요');    		
    		return false;
    	}
    	
    	if($("#chgpwd").val().trim()==''){
    			alert('변경할 비밀번호를 입력해주세요');     		
        	return false;
    	}
    	
    	if($("#pwdcheck").val().trim()==''){
    			alert('변경할 비밀번호확인란을 입력해주세요');     		
        	return false;
    	}
    	
    	if($("#chgpwd").val().trim()!=$("#pwdcheck").val().trim()){
    		alert('변경할 비밀번호가 서로 다릅니다');
    		return false;
    	}
    	
    	var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    	if(!getPwCheck.test($("#curpwd").val()) || $("#curpwd").val().length < 8 || $("#curpwd").val().length > 14){
    		alert("[특수문자 포함 8자이상으로 작성해주세요!]");
				return false;
		} 
    	if(!getPwCheck.test($("#chgpwd").val()) || $("#chgpwd").val().length < 8 || $("#chgpwd").val().length > 14){
    		alert("[특수문자 포함 8자이상으로 작성해주세요!]");
				return false;
		} 
    	if(!getPwCheck.test($("#pwdcheck").val()) || $("#pwdcheck").val().length < 8 || $("#pwdcheck").val().length > 14){
		    alert("[특수문자 포함 8자이상으로 작성해주세요!]");
				return false;
		} 
    }
    
      $("#cancel").click(function(){
    	  $("#curpwd").val('').focus();
    	  $("#chgpwd").val('').focus();
    	  $("#pwdcheck").val('').focus();
      })
    
    </script>
    
  
    </div>
  
    
  </div>



<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>