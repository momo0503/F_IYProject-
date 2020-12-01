<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<title>회원 유져 등급 변경</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script>
<link rel="stylesheet" href="./resources/css/board.css">
</head>
<body>
	<jsp:include page="../../include/header.jsp" />
	<div class="board_list_wrap">
		<div class="board_submenu">
			<a class=board_list_st href="IY_admin_userSerch"
				style="border: none;">회원 유져 등급 변경</a>|<a class=board_list_st_last style="margin-left: 5px;"
				href="IY_amdin_theaterCh">연극 등록 승인</a> <!-- IY_amdin_theaterCh -->
		</div>
		<div>
			<div>
				<h2 class="board_list_bt" style="margin-bottom: 20px;">
					<b>회원 유져 등급 변경</b>
				</h2>
			</div>
		</div>
		<div>
			<div class="board_list">
				<div class="board_list_head">
					<div class="admin_board_name">이름</div>
					<div class="admin_board_email">email</div>
					<div class="admin_board_phone">폰번호</div>
					<div class="admin_board_date">가입 날짜</div>
					<div class="admin_board_membership">등급</div>
					<div class="admin_board_membershipCh">변경등급</div>
					<div class="admin_board_belong">소속</div>
				</div>
				<c:if test="${userlist.size() <= 0}">
					<div class="NoSelectBox" style="text-align: center;">
						<strong>유져가 없습니다</strong>
					</div>

				</c:if>
				<div class="board_list_body">
					<c:if test="${userlist.size() > 0}">
						<c:forEach var="ul" items="${userlist}">
						<c:set var="i" value="${i+1}" />
								<div class="board_item">
									<div class="admin_board_name">${ul.name}</div>
									<div class="admin_board_email">${ul.email}</div>
									<div class="admin_board_phone">${ul.phone}</div>
									<div class="admin_board_date">${ul.reg_date}</div>
									<div class="admin_board_membership">
										<c:set value="${ul.membertype}" var="type" />									
										<c:if test="${type eq '0'.charAt(0)}">탈퇴 회원</c:if>
										<c:if test="${type eq '1'.charAt(0)}">일반 회원</c:if>
										<c:if test="${type eq '2'.charAt(0)}">공연 관계자</c:if>
										<c:if test="${type eq '3'.charAt(0)}">관리자</c:if>
									</div>
									<div class="admin_board_membershipCh">
										<button onclick="general_memberCh('${ul.email}');">일반회원변경</button>
										<button onclick="show_memberCh('${ul.email}',${i});">공연관계자변경</button>
									</div>
									<div class="admin_board_belong">
										<span class="belong_name">${ul.belong}</span>
										<input id="admin_belongUp${i}" type="text" size="10"/>
									</div>
								</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="board_search_form">
				<select id="board_select_list" name="condition">
					<option value="name"
						<c:if test="${condition=='name'}">
   ${'selected'}</c:if>>이름</option>
					<option value="email"
						<c:if test="${condition=='email'}">
   ${'selected'}</c:if>>email</option>
					<option value="membertype"
						<c:if test="${condition=='membertype'}">
   ${'selected'}</c:if>>회원등급</option>
				</select> <input name="find_name" id="board_search" value="${keyword}" /> <input
					type="button" id="searchflist" value="검색" />
			</div>
			
			<label style="color:gray;">0:탈퇴 회원 1:일반 회원 2:공연 관계자 3:관리자</label>
			<div class="clear"></div>
			<div class="board_paging">
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty condition) && (empty keyword)}">
					<c:if test="${page>1}">
						<a href="IY_admin_userSerch?page=${startpage}"
							class="board_bt board_first">처음 페이지</a>
						<a href="IY_admin_userSerch?page=${page-1}"
							class="board_bt board_prev">이전 페이지</a>
					</c:if>
					<c:forEach var="f" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${f==page}">
							<a class="board_num on">${f}</a>
						</c:if>
						<c:if test="${f!=page}">
							<a href="IY_admin_userSerch?page=${f}" class="board_num">${f}</a>
						</c:if>
					</c:forEach>



					<c:if test="${page<maxpage}">
						<a href="IY_admin_userSerch?page=${page+1}"
							class="board_bt board_next">다음 페이지</a>
						<c:if test="${maxpage>endpage+1}">
							<a href="IY_admin_userSerch?page=${endpage+1}"
								class="board_bt board_last">마지막 페이지</a>
						</c:if>
						<c:if test="${maxpage<endpage+1}">
							<a href="IY_admin_userSerch?page=${endpage}"
								class="board_bt board_last">마지막 페이지</a>
						</c:if>
					</c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty condition) || (!empty keyword)}">
					<c:if test="${page>1}">
						<a
							href="IY_admin_userSerch?page=${startpage}&condition=${condition}&keyword=${keyword}"
							class="board_bt board_first">처음 페이지</a>
						<a
							href="IY_admin_userSerch?page=${page-1}&condition=${condition}&keyword=${keyword}"
							class="board_bt board_prev">이전 페이지</a>
					</c:if>
					<c:forEach var="f" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${f==page}">
							<a class="board_num on">${f}</a>
						</c:if>
						<c:if test="${f!=page}">
							<a
								href="IY_admin_userSerch?page=${f}&condition=${condition}&keyword=${keyword}"
								class="board_num">${f}</a>
						</c:if>
					</c:forEach>



					<c:if test="${page<maxpage}">
						
							<a href="IY_admin_userSerch?page=${page+1}&condition=${condition}&keyword=${keyword}"
							class="board_bt board_next">다음 페이지</a>
												<c:if test="${maxpage>endpage+1}">
							<a href="IY_admin_userSerch?page=${endpage+1}&condition=${condition}&keyword=${keyword}"
								class="board_bt board_last">마지막 페이지</a>
						</c:if>
						<c:if test="${maxpage<endpage+1}">
							<a href="IY_admin_userSerch?page=${endpage}&condition=${condition}&keyword=${keyword}"
								class="board_bt board_last">마지막 페이지</a>
						</c:if>
					</c:if>
				</c:if>
			</div>
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
				location.href="IY_admin_userSerch?keyword="+keyword
				+"&condition=" + condition;
			}
			
			
		
			
		});
  });
 	function general_memberCh(email){
 		const userInfo = {
 			email:email
 			}
 		alert(email);
 		$.ajax({
    		type:"post",
    		url:"general_memberCh",
    		headers:{"Content-Type":"application/json"},
    		dataType:"text",
    		data:JSON.stringify(userInfo),
    		success:function(data){
    			alert('성공');
    			location.reload();
    		}
 		});
 	}
 	
 	function show_memberCh(email,n){
 		var belong = $("#admin_belongUp"+n).val();
 		if($.trim($("#admin_belongUp"+n).val())==""){
 			alert("소속을 입력해주세요");
 			return false;
 		}else{
 			const userInfo = {
 				email:email,
 				belong:belong
 				}
 			alert(email);
 			alert($("#admin_belongUp"+n).val());
 			$.ajax({
    			type:"post",
    			url:"show_memberCh",
    			headers:{"Content-Type":"application/json"},
    			dataType:"text",
    			data:JSON.stringify(userInfo),
    			success:function(data){
    				alert('성공');
    				location.reload();
    			}
 			});
 		}
 	}
      	</script>
</body>
</html>