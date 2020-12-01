<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 조회 - 인연</title>
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
        <li><a href="IY_mypage_reservation">예매내역</a></li>
        <li><a href="IY_mypage_point">포인트 내역</a></li>
        <li><a href="IY_mypage_board">게시글 내역</a>
        <li><a href="IY_mypage_edit_user">회원정보</a>
        </li>
      </ul>
    </nav>
  </div>


  <div class="mypage-right-wrap">
    <div class="mypage-contents">
      <div class="mypage-point-wrap">
      <div class="mypage-tit">
        	<p>포인트 내역</p>
      </div>
      <div class="clear"></div>
      <div class="mypage-point-box">
        <p><strong>${login.name}</strong> 님의 사용가능 포인트 <b>${login.point}P</b></p>
      </div>
    </div>
    <div class="mypage-point-search-wrap">
      <div class="mypage-tit">
        <p>내역 조회</p>
      </div>
      <div class="clear"></div>
      <div class="mypage-point-search-condi">
        <form method="post">
          <select>
            <option>2020년 8월</option>
            <option>2020년 7월</option>
            <option>2020년 6월</option>
            <option>2020년 5월</option>
          </select>
          <button>조회</button>
        </form>
      </div>
      <div class="mypage-table">
        <table>
          <tr>
            <th>일자</th><th>내용</th><th>포인트</th>
          </tr>
        </table>
      </div>
      <div class="mypage-paging">
        <a href="#">&lt;&lt;</a>
        <a href="#">&lt;</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">&gt;</a>
        <a href="#">&gt;&gt;</a>
      </div>
    </div>
    </div>
    
  </div>

</div>


<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>