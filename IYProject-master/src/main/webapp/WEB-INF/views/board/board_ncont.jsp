<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/board.css">
</head>
<body>
<script src="./resources/js/jquery.js"></script>
	<jsp:include page="../../include/header.jsp" />
	<div class="board_cont_wrap">
		<div class="board_contentBox">
			<!-- 헤더 시작 -->
			<div id="board_cont_header">
			<div id="board_cont_fb_num" style="display: none;">${nbCont.nb_num}</div>
			<h3 id="board_cont_title">${nbCont.nb_title}</h3>
				<div id="board_cont_writerInfo">
					<div id="board_cont_profile">
						<div id="board_cont_nameBox">
							${nbCont.name}
						</div>
						<div id="board_cont_article_info">
							<span id="board_cont_uploadDate">
								${nbCont.nb_date}
							</span>
							<span id="board_cont_hitCount">
								조회수 ${nbCont.nb_hit}
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 헤더 끝 -->
			<!-- 내용시작 -->
			<div id="board_cont_body">
				<div id="board_cont_content">
					${nbCont.nb_cont}
				</div>
				<div>
					<div class="board_cont_btnBox"> <!-- 목록버튼 -->
						<button class="board_cont_listbtn" onclick="location='IY_board_nlist?page=${param.page}'">목록</button>
						<!-- 로그인된 회원의 이메일 equlas 게시글 작성자의 이메일  => 수정,삭제 버튼 표시하기-->
						<c:if test="${login.membertype == '3'.charAt(0)}">
								<button class="board_cont_delbtn" onclick="delcheck();">삭제</button>
								<button class="board_cont_editbtn" onclick="location='IY_nboardEdit?nb_num=${nbCont.nb_num}'">수정</button>
						</c:if>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="../../include/footer.jsp" />
</body>
<script>
$("#board_rep_arpa").hide();

	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	function delcheck(){
		var answer = confirm('게시물을 삭제 하겠습니까?');
		var nb_num=getParameterByName("nb_num");
		
		const nboardinfo={
    			nb_num:nb_num
    	};
		if(answer){
			$.ajax({
				type:"post",
				url:"nbdelete",
				headers:{"Content-Type":"application/json"},
				data:JSON.stringify(nboardinfo),
				dataType:"text",
				success:function(){
					alert("게시글 삭제완료")
					location.href="IY_board_nlist";
					
				}
			})
		}
	}
	
</script>

</html>












