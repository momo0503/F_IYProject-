<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
    <head>
    	<meta charset="UTF-8">
      <title>게시판 목록</title>
      <link rel="stylesheet" href="./resources/css/board.css">
      <script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 
    </head>
    <body>
    	<jsp:include page="../../include/header.jsp" />
    	<div class="board_list_wrap">
    		<div class="board_submenu">
    			<a class=board_list_st href="IY_board_nlist?page=1">공지 게시판</a>
    			<a class=board_list_st href="IY_board_flist?page=1">자유 게시판</a>
    			<a class=board_list_st id="board_list_st_last" href="IY_board_plist?page=1">홍보 게시판</a>
    		</div>
    		<div>
    		<div>
    			<h2 class="board_list_bt"><b>공지 게시판</b></h2>			
    		</div>	
    		<div>
    				<c:if test="${login.membertype eq '3'.charAt(0)}">
            <button type="button" onclick="location='IY_board_nwrite'" class="board_write_btn">글쓰기</button>
            </c:if>
    		</div>	
    		</div>
        	<div>
          	  <div class="board_list">
            	    <div class="board_list_head">
              	      <div class="board_num">번호</div>
                	    <div class="board_tit">제목</div>
                  	  <div class="board_writer">글쓴이</div>
                    	<div class="board_date">작성일</div>
                    	<div class="board_view">조회</div>
                	</div>
                	<c:if test="${nlist.size() <= 0}">
							<div class="NoSelectBox" style="text-align: center;">
								<strong>게시물이 없습니다!!</strong>
							</div>
							
						</c:if>
                	<div class="board_list_body">
                	<c:if test="${nlist.size() > 0}">
                	<c:forEach var="nb" items="${nlist}" >
                    <div class="board_item">
                      <div class="board_num">${nb.nb_num}</div>
                      <div class="board_tit"><a href="IY_board_ncont?nb_num=${nb.nb_num}&page=${param.page}">${nb.nb_title}</a></div>
                      <div class="board_writer">${nb.email}</div>
                      <div class="board_date">${f:substring(nb.nb_date,0,10)}</div>
                      <div class="board_view">${nb.nb_hit}</div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
         <div class="board_search_form">
            <select id="board_select_list" name="condition">
            		<option value="nb_title" <c:if test="${condition=='nb_title'}">
   ${'selected'}</c:if>>제목</option>
 								<option value="nb_cont" <c:if test="${condition=='nb_cont'}">
   ${'selected'}</c:if>>내용</option>
  							<option value="nb_title_cont" <c:if test="${condition=='nb_title_cont'}">
   ${'selected'}</c:if>>제목+내용</option>
            	</select>
            	<input name="find_name" id="board_search" value="${keyword}"/>
            	<input type="button" id="searchnlist" value="검색"/>
            </div>
            <div class="board_paging">
            <c:if test="${(empty condition) && (empty keyword)}"> 
    <c:if test="${page>1}">
              <a href="IY_board_nlist?page=${startpage}" class="board_bt board_first">처음 페이지</a>
              <a href="IY_board_nlist?page=${page-1}" class="board_bt board_prev">이전 페이지</a>
              </c:if>
              <c:forEach var="n" begin="${startpage}" end="${endpage}" step="1">
              <c:if test="${n==page}">
              <a class="board_num on">${n}</a>
              </c:if>
              <c:if test="${n!=page}">
              <a href="IY_board_nlist?page=${n}" class="board_num">${n}</a>
              </c:if>
              </c:forEach>
              
         
              <c:if test="${page<maxpage}">
               <a href="IY_board_nlist?page=${page+1}" class="board_bt board_next">다음 페이지</a>
              <a href="IY_board_nlist?page=${endpage}" class="board_bt board_last">마지막 페이지</a>
              </c:if>
              </c:if>
              
                           <%-- 검색후 페이징 --%>
 <c:if test="${(!empty condition) || (!empty keyword)}">    
          <c:if test="${page>1}">
              <a href="IY_board_nlist?page=${startpage}&condition=${condition}&keyword=${keyword}" class="board_bt board_first">처음 페이지</a>
              <a href="IY_board_nlist?page=${page-1}&condition=${condition}&keyword=${keyword}" class="board_bt board_prev">이전 페이지</a>
              </c:if>
              <c:forEach var="n" begin="${startpage}" end="${endpage}" step="1">
              <c:if test="${n==page}">
              <a class="board_num on">${n}</a>
              </c:if>
              <c:if test="${n!=page}">
              <a href="IY_board_nlist?page=${n}&condition=${condition}&keyword=${keyword}" class="board_num">${n}</a>
              </c:if>
              </c:forEach>
              
              
         
              <c:if test="${page<maxpage}">
               <a href="IY_board_nlist?page=${page+1}&condition=${condition}&keyword=${keyword}" class="board_bt board_next">다음 페이지</a>
              <a href="IY_board_nlist?page=${endpage}&condition=${condition}&keyword=${keyword}" class="board_bt board_last">마지막 페이지</a>
    </c:if>
</c:if>   
            </div>
        </div>
      </div>
      	<jsp:include page="../../include/footer.jsp" />
      	
      	      	<script type="text/javascript">
      	
      	$(function() {
      	$("#searchnlist").click(function() {
			console.log("검색 버튼이 클릭됨!");
			const keyword = $("#board_search").val();
			console.log("검색어: " + keyword);
			
			const condition = $("#board_select_list option:selected").val();
			console.log("검색 조건: " + condition);
			
			if(keyword==''){
				alert("검색어를 입력해주세요");
			}else{
				location.href="IY_board_nlist?keyword="+keyword
				+"&condition=" + condition;
			}
			
		});
      	});
      	
      	
      	
      	</script>
      	
    </body>
</html>