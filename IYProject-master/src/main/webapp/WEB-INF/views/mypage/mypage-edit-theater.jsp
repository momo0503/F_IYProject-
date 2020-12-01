<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선호 극장 선택 - 인연</title>
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
    <div class="mypage-edit-theater-wrap">
    <div class="mypage-tit">
      <p>선호 극장</p>
    </div>
    <div class="clear"></div>
    <div class="mypage-table-wrap">
      <form method="post">
      <table>
        <tr><th>1순위</th><td>
          <select>
             <option>지역선택</option>
            <option>서울</option>
            <option>경기</option>
            <option>인천</option>
            <option>대전/충청/세종</option>
            <option>부산/대구/경상</option>
            <option>광주/전라</option>
            <option>강원</option>
            <option>제주</option>
          </select>
          <select>
            <option>극장 선택</option>
            <option>세종문화회관</option>
            <option>예술의 전당</option>
            <option>뫄뫄극장</option>
          </select></td>
          </tr>
          <tr><th>2순위</th><td>
          <select>
            <option>지역선택</option>
            <option>서울</option>
            <option>경기</option>
            <option>인천</option>
            <option>대전/충청/세종</option>
            <option>부산/대구/경상</option>
            <option>광주/전라</option>
            <option>강원</option>
            <option>제주</option>
          </select>
          <select>
            <option>극장 선택</option>
            <option>세종문화회관</option>
            <option>예술의 전당</option>
            <option>뫄뫄극장</option>
          </select></td>
          </tr>
          <tr><th>3순위</th><td>
          <select>
            <option>지역선택</option>
            <option>서울</option>
            <option>경기</option>
            <option>인천</option>
            <option>대전/충청/세종</option>
            <option>부산/대구/경상</option>
            <option>광주/전라</option>
            <option>강원</option>
            <option>제주</option>
          </select>
          <select>
            <option>극장 선택</option>
            <option>세종문화회관</option>
            <option>예술의 전당</option>
            <option>뫄뫄극장</option>
          </select></td>
          </tr>
      </table>
      <div class="mypage-edit-theater-btn">
         <button>취소</button>
         <button>등록</button>
      </div>
    </form>
    </div>
    
  </div>
  </div>
  
</div>


<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>