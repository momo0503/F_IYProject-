<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 > 자주묻는 질문</title>
<link rel='stylesheet' type='text/css' href="./resources/css/main.css"/>
<link rel='stylesheet' type='text/css' href="./resources/css/support.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
	  
	  
	
  });

  
  
</script>
</head>
<body>
	<jsp:include page="../../include/header.jsp" />


<div class="inner_wrap">

<!-- gnb - 고객센터 홈,공지사항,1:1문의,FAQ -->
  <div class="lnb-area">
    <nav id="lnb">
      <p class="tit">
        <a href="support">고객센터</a>
         <!-- I want to make support main home but we don't have enough time-->
      </p>
      <ul>
        <li><a href="IY_board_nlist">공지사항</a></li>
        <li class="on"><a href="IY_mypage_inquiry">1:1 문의</a></li>
        <li><a href="support">자주 묻는 질문</a></li>
      </ul>
    </nav>
  </div>


<!-- FAQ -->
  <div id="contents">
    <h2 class="tit md30">
      	1:1 문의하기
    </h2>
   
    <pre>
    
    - 문의 사항은 관리자 이메일 주소 <strong style="color:#01738b;">wlghksl12@daum.net</strong> 로 보내주세요.
    - 회원 관리에 관한 문제는 계정의 이메일 주소와 이름,폰번호와 함꼐 보내주세요.
    - 일반 회원에서 공연 관계자 회원으로 전환 시 소속과 신분증명을 위한 명함 등의 사진을 첨부해주세요.
    </pre>
    
    
    
    <div class="clear"></div>
    
  </div>

</div>

<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />
</body>
</html>