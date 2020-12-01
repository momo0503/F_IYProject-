<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<title>연극 등록 승인</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script>
<link rel="stylesheet" href="./resources/css/board.css">
</head>
<body>
	<jsp:include page="../../include/header.jsp" />
	<div class="board_list_wrap">
		<div class="board_submenu">
			<a class=board_list_st href="IY_admin_userSerch"
				style="border: none;">회원 유져 등급 변경</a>|<a class=board_list_st_last
				style="margin-left: 5px;" href="IY_amdin_theaterCh">연극 등록 승인</a>
			<!-- IY_amdin_theaterCh -->
		</div>
		<div>
			<div>
				<h2 class="board_list_bt" style="margin-bottom: 20px;">
					<b>연극 등록 승인</b>
				</h2>
			</div>
		</div>
		<div>
			<div class="board_list">
				<div class="board_list_head">
					<div class="admin_board_Tname">홍보자</div>
					<div class="admin_board_Ttitle">공연 제목</div>
					<div class="admin_board_date">공연 기간</div>
					<div class="admin_board_membership">등급</div>
					<div class="admin_board_membershipCh">확인</div>
					<div class="admin_board_SignUpDate">신청 날짜</div>
				</div>
				<c:if test="${theaterChList.size() <= 0}">
					<div class="NoSelectBox" style="text-align: center;">
						<strong>등록할 연극이 없습니다.</strong>
					</div>
				</c:if>
				
				<div class="board_list_body">
					<c:if test="${theaterChList.size() > 0}">
						<c:forEach var="tl" items="${theaterChList}">
							<div class="board_item">
								<div class="admin_board_Tname">${tl.email}</div>
								<div class="admin_board_Ttitle">${tl.td_title}</div>
								<div class="admin_board_date">${tl.td_viewdays}</div>
								<div class="admin_board_membership">${tl.td_agegrade}</div>
								<div class="admin_board_membershipCh">
										<button onclick="cancle(${tl.td_no});">거부</button>
										<button onclick="approve(${tl.td_no});">승인</button>
									</div>
								<div class="admin_board_SignUpDate">${tl.td_signUp_date}</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
			</div>
		</div>

		<div class="board_search_form">
			<select id="board_select_list" name="condition">
				<!-- 검색될꺼 바뀔예정 -->
				<option value="name"
					<c:if test="${condition=='td_title'}">
   ${'selected'}</c:if>>공연 제목</option>
				<option value="email"
					<c:if test="${condition=='email'}">
   ${'selected'}</c:if>>email</option>
			</select> <input name="find_name" id="board_search" value="${keyword}" /> <input
				type="button" id="searchflist" value="검색" />
		</div>
		<div class="board_paging">
			<%-- 검색전 페이징 --%>
			<c:if test="${(empty condition) && (empty keyword)}">
				<c:if test="${page>1}">
					<a href="IY_amdin_theaterCh?page=${startpage}"
						class="board_bt board_first">처음 페이지</a>
					<a href="IY_amdin_theaterCh?page=${page-1}"
						class="board_bt board_prev">이전 페이지</a>
				</c:if>
				<c:forEach var="f" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${f==page}">
						<a class="board_num on">${f}</a>
					</c:if>
					<c:if test="${f!=page}">
						<a href="IY_amdin_theaterCh?page=${f}" class="board_num">${f}</a>
					</c:if>
				</c:forEach>



				<c:if test="${page<maxpage}">
					<a href="IY_amdin_theaterCh?page=${page+1}"
						class="board_bt board_next">다음 페이지</a>
					<c:if test="${maxpage>endpage+1}">
						<a href="IY_amdin_theaterCh?page=${endpage+1}"
							class="board_bt board_last">마지막 페이지</a>
					</c:if>
					<c:if test="${maxpage<endpage+1}">
						<a href="IY_amdin_theaterCh?page=${endpage}"
							class="board_bt board_last">마지막 페이지</a>
					</c:if>
				</c:if>
			</c:if>

			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty condition) || (!empty keyword)}">
				<c:if test="${page>1}">
					<a
						href="IY_amdin_theaterCh?page=${startpage}&condition=${condition}&keyword=${keyword}"
						class="board_bt board_first">처음 페이지</a>
					<a
						href="IY_amdin_theaterCh?page=${page-1}&condition=${condition}&keyword=${keyword}"
						class="board_bt board_prev">이전 페이지</a>
				</c:if>
				<c:forEach var="f" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${f==page}">
						<a class="board_num on">${f}</a>
					</c:if>
					<c:if test="${f!=page}">
						<a
							href="IY_amdin_theaterCh?page=${f}&condition=${condition}&keyword=${keyword}"
							class="board_num">${f}</a>
					</c:if>
				</c:forEach>



				<c:if test="${page<maxpage}">

					<a
						href="IY_amdin_theaterCh?page=${page+1}&condition=${condition}&keyword=${keyword}"
						class="board_bt board_next">다음 페이지</a>
					<c:if test="${maxpage>endpage+1}">
						<a
							href="IY_amdin_theaterCh?page=${endpage+1}&condition=${condition}&keyword=${keyword}"
							class="board_bt board_last">마지막 페이지</a>
					</c:if>
					<c:if test="${maxpage<endpage+1}">
						<a
							href="IY_amdin_theaterCh?page=${endpage}&condition=${condition}&keyword=${keyword}"
							class="board_bt board_last">마지막 페이지</a>
					</c:if>
				</c:if>
			</c:if>
		</div>
	</div>
	<jsp:include page="../../include/footer.jsp" />

	<script type="text/javascript">
      	
      	$(function() {
      	$("#searchflist").click(function() {
			console.log("검색 버튼이 클릭됨!");
			const keyword = $("#board_search").val();
			console.log("검색어: " + keyword);
			
			const condition = $("#board_select_list option:selected").val();
			console.log("검색 조건: " + condition);
			
			if(keyword==''){
				alert("검색어를 입력해주세요");
			}else{
				location.href="IY_amdin_theaterCh?keyword="+keyword
				+"&condition=" + condition;
			}
		});
  });
	function cancle(td_no){
		var answer = confirm('등록을 거부하겠습니까?');
		if(answer){
			const theaterInfo={
					td_no:td_no
			};
			$.ajax({
				type:"POST",
	    	url:"td_cancle",
	    	headers:{"Content-Type":"application/json"},
	    	data:JSON.stringify(theaterInfo),
		    success:function(){
	    		window.location.reload();
	    	} 
			});
		}
	}
	function approve(td_no){
		var answer = confirm('등록을 승인하겠습니까?');
		if(answer){
			const theaterInfo={
					td_no:td_no
			};
			$.ajax({
				type:"POST",
	    	url:"td_approve",
	    	headers:{"Content-Type":"application/json"},
	    	data:JSON.stringify(theaterInfo),
		    success:function(){
	    		window.location.reload();
	    	} 
			});
		}
	}
</script>