<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
    <div class="mypage-main">
      <div class="mypage-home-box">
		<div class="mypage-home-box-left">
            <p><strong>${login.name}</strong>님</p>
             <div class="mypage-info-user-point">
              <p>포인트 : ${login.point}p</p>
            </div>
            <div class="mypage-home-box-link">
              <a href="IY_mypage_edit_user">개인정보 수정 &gt;</a>
              <a href="IY_mypage_point">포인트 내역 확인 &gt;</a>
            </div>
        </div>
        
        <%-- 선호 극장 --%>
        <%-- <div class="mypage-home-box-right">
          <div class="mypage-home-box-theater">
            <p>선호극장</p>
            <a href="IY_mypage_edit_theater">변경&gt;</a>
            
        	  <div class="mypage-home-box-th-items">
                <div class="mypage-home-box-th-item">
                  <c:if test="${empty  login.prefTheater01 }">
                    <p> 선호 극장을 설정해 주세요</p>
                  </c:if>
                  <c:if test="${!empty login.prefTheater01}">
                    <p><strong>1</strong> ${login.prefTheater01 }<p>
                    <c:if test="${!empty login.prefTheater01}">
                    <p><strong>2</strong> ${login.prefTheater02 }<p>
                  </c:if>
                  <c:if test="${!empty login.prefTheater01}">
                    <p><strong>3</strong> ${login.prefTheater03 }<p>
                  </c:if>
                  </c:if>
                  
                </div>
                
              </div>
          </div>
        </div> --%>
        
      </div>
      
      <div class="mypage-home-res-wrap">
        <div class="mypage-tit">
          <p>나의 스토리</p>
          
            <a href="#" class="mypage-tit-link">+ 더보기</a>
          
        </div>
        <div class="clear"></div>
        <div class="mypage-home-res-items-wrap">
          <div class="mypage-home-res-items">
            <div class="mypage-res-item">
              
                <a href="#" class="mypage-res-img">
                  <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF166781_200812_101930.gif"/></a>
              
              <table class="mypage-res-cont">
                
                <tr>
                  <th>연극명</th>
                  <td colspan="3">
                    <p><span>연극제목</span></p>
                  </td>
                </tr>
                <tr>
                  <th>장소</th><td>서울특별시</td>
                  
                </tr>
                <tr>
                  <th>관람일시</th><td colspan="3">2020.08.18 17:00</td>
                </tr>
                <tr>
                  <th>좌석 등급</th><td>R석</td>
                  <th>관람 인원</th><td> 1명</td>
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
      </div>
      
      <div class="mypage-home-board-wrap">
        <div class="mypage-tit">
          <p>내가 쓴 게시글</p>
            <a href="IY_mypage_board" class="mypage-tit-link">+ 더보기</a>
        </div>
         <div class="clear"></div>
        <div class="mypage-table">
          <table border="1">
            <tr><th class="mypage-table-bno">번호</th><th class="mypage-table-btit">제목</th><th class="mypage-table-bdate">작성일</th><th class="mypage-table-bhit">조회수</th></tr>
            <c:if test="${empty boardlist}">
            <tr><th colspan="4"> 목록이 없습니다~<br/><a href="http://localhost:8011/controller/IY_board_flist?page=1">글쓰러가기</a></th></tr>
            </c:if>
            <c:if test="${!empty boardlist}">
              <c:forEach var="board" items="${boardlist}">
                <tr><th>${board.fb_num}</th><th><a href="IY_board_fcont?fb_num=${board.fb_num}">${board.fb_title}</a></th><th>${board.fb_date}</th><th>${board.fb_hit}</th></tr>
              </c:forEach> 
            </c:if>
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