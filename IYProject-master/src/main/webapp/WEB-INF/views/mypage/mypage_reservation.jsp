<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 내역 확인 - 인연</title>
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
      <div class="mypage-res-wrap">
      <div class="mypage-tit">
        <p>예매내역</p>
      </div>
         <div class="clear"></div>
      <div class="mypage-res-search">
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
      <div class="mypage-res-none">
        <p>예매 내역이 없습니다</p>
      </div>
      <div class="mypage-res-items">
        <div class="mypage-res-items-cnt">
          <p><strong>총 <b>1</b>건</strong>
        </div>
        
         <div class="mypage-res-item">
              
                <a href="#" class="mypage-res-img">
                  <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF166781_200812_101930.gif"/></a>
              
              <table class="mypage-res-cont">
                <tr>
                  <th>예매번호</th>
                  <td colspan="3"><em class="res-num">9102-938-12324</em></td>
                </tr>
                <tr>
                  <th>연극명</th>
                  <td colspan="3">
                    <p><span>연극제목</span></p>
                  </td>
                </tr>
                <tr>
                  <th>극장</th><td>예술의 전당</td>
                  <th>관람 인원</th><td>성인 1명</td>
                </tr>
                <tr>
                  <th>관람일시</th><td colspan="3">2020.08.18 17:00</td>
                </tr>
               
              </table>
              <div class="mypage-res-item-price">
                <table>
                   <tr>
                  <th>결제일시</th><td colspan="3">2020.08.17 <button>결제정보</button><button>취소하기</button></td>
                </tr>
                </table>
              </div>
            </div>
      </div>
    </div>
    
    <div class="mypage-res-cancel-wrap">
    <div class="mypage-tit">
      <p>예매 취소 내역</p>
    </div>
    <div class="clear"></div>
    <ul class="dot-list"> <li>취소일 기준 7일간 내역을 확인하실 수 있습니다.</li></ul>
    <div class="mypage-table">
      <table>
        <tr><th>취소일시</th><th>연극명</th><th>극장</th><th>상영일시</th><th>취소금액</th></tr>
        <tr><th colspan="5">취소 내역이 없습니다</th></tr>

      </table>
    </div>
  </div>
    
  </div>



    </div>
    
</div>

<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>