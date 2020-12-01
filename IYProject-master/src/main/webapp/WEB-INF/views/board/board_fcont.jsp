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
			<div id="board_cont_fb_num" style="display: none;">${fbCont.fb_num}</div>
			<h3 id="board_cont_title">${fbCont.fb_title}</h3>
				<div id="board_cont_writerInfo">
					<div id="board_cont_profile">
						<div id="board_cont_nameBox">
							${fbCont.name}
						</div>
						<div id="board_cont_article_info">
							<span id="board_cont_uploadDate">
								${fbCont.fb_date}
							</span>
							<span id="board_cont_hitCount">
								조회수 ${fbCont.fb_hit}
							</span>
							<span id="board_cont_comCount">
								댓글 ${totalRep}
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 헤더 끝 -->
			<!-- 내용시작 -->
			<div id="board_cont_body">
				<div id="board_cont_content">
					${fbCont.fb_cont}
				</div>
				<div id="board_cont_comCount2">
				<span>댓글  ${totalRep}</span>
				</div>
			</div>
			<!-- 내용 끝 -->
			<!-- 댓글 시작 -->
			<div id="board_cont_comment">
				<div id="board_cont_comment_option">
						<h3 style="font-size: 17px; margin-right: 12px; display: inline-block;">댓글</h3>
					<div id="board_cont_comment_tab">
						<c:if test="${param.order eq 1}">
							<a href="IY_board_fcont?order=1&fb_num=${fbCont.fb_num}" id="board_cont_lastbtn" class="board_cont_Act" onclick="lastbtnClick();">등록순</a>
							<a href="IY_board_fcont?order=2&fb_num=${fbCont.fb_num}" id="board_cont_firstbtn" onclick="firstbtnClick();">최신순</a>
						</c:if>
						<c:if test="${param.order eq 2}">
							<a href="IY_board_fcont?order=1&fb_num=${fbCont.fb_num}" id="board_cont_lastbtn" onclick="lastbtnClick();">등록순</a>
							<a href="IY_board_fcont?order=2&fb_num=${fbCont.fb_num}" id="board_cont_firstbtn" class="board_cont_Act" onclick="firstbtnClick();">최신순</a>
						</c:if>
					</div>
				</div>
				<div id="board_cont_commentBox">
					<ul class="board_cont_commentList">
						<%-- <c:if test="${empty frContList}">
							
						</c:if>
						<c:if test="${!empty frContList}"> --%>
						<c:forEach var="r" items="${frContList}">
							<!-- /반복 해야대 -->
							<c:if test="${empty r.fb_reply_reply_name}">
							<c:if test="${r.del_ck=='0'}">
								<li class="boad_cont_commentItem">
									<div class="board_cont_commentArea">
										<div class="board_cont_comment_contBox">
											<span class="board_cont_comment_content"><pre>삭제된 댓글입니다.</pre></span>
										</div>
									</div>
								</li>
								</c:if>
							
							
								<c:if test="${r.del_ck=='1'}">
								<li class="boad_cont_commentItem">
									<div class="board_cont_commentArea">
										<div id="rid${r.freply_num}">
										<div class="board_cont_comment_nickBox">

											<span class="board_cont_comment_nickname">${r.name}</span>
										</div>
										<div class="board_cont_comment_contBox">
											<span class="board_cont_comment_content"><pre>${r.fb_reply_cont}</pre></span>
										</div>
										<div class="board_cont_comment_infoBox">
											<span class="board_cont_comment_info_date">${r.fb_reply_date}</span>
											<c:if test="${login.email eq r.email || login.membertype == '3'.charAt(0)}">
											<button role="button" class="board_cont_comment_info_button"
												onclick="rep_rep_write('${r.name}','${r.fb_reply_cont}');">답글쓰기</button>
												<button role="button" class="board_cont_comment_info_button"
												onclick="rep_rep_delete('${r.freply_num}');">댓글삭제</button>
												<c:if test="${login.email eq r.email}">
													<button role="button" class="board_cont_comment_info_button"
													onclick="rep_rep_edit('${r.freply_num}','${r.fb_reply_cont}');">댓글수정</button>
												</c:if>
												</c:if>
											<!--  -->
										</div>
									</div>
									</div>
								</li>
								</c:if>
								<!-- /반복 해야대 -->
							</c:if>
							<c:if test="${!empty r.fb_reply_reply_name}">
							<c:if test="${r.del_ck=='0'}">
								<li class="boad_cont_commentItem">
									<div class="board_cont_commentArea">
										<div class="board_cont_comment_contBox">
											<span class="board_cont_comment_content"><pre>삭제된 댓글입니다.</pre></span>
										</div>
									</div>
								</li>
								</c:if>
								
							
							
								<c:if test="${r.del_ck=='1'}">
								<li class="boad_cont_commentItem">
									<div class="board_cont_commentArea">
									<div id="rid${r.freply_num}">
										<div class="board_cont_comment_nickBox">
											<span class="board_cont_comment_nickname">${r.name}</span>
										</div>
										<div class="board_cont_rep_info">
											<span class="board_cont_rep_rep_name">${r.fb_reply_reply_name}</span>
											<%-- <span class="board_cont_rep_rep_cont">${r.fb_reply_reply_cont}</span> --%>
										</div>
										<div class="board_cont_comment_contBox">
											<span class="board_cont_comment_content"><pre>${r.fb_reply_cont}</pre></span>
										</div>
										<div class="board_cont_comment_infoBox">
											<span class="board_cont_comment_info_date">${r.fb_reply_date}</span>
											
											<c:if test="${login.email eq r.email || login.membertype == '3'.charAt(0)}">
											<button role="button" class="board_cont_comment_info_button"
												onclick="rep_rep_write('${r.name}','${r.fb_reply_cont}');">답글쓰기</button>
												
															<button role="button" class="board_cont_comment_info_button"
												onclick="rep_rep_delete('${r.freply_num}');">댓글삭제</button>
												<c:if test="${login.email eq r.email}">
													<button role="button" class="board_cont_comment_info_button"
													onclick="rep_rep_edit('${r.freply_num}','${r.fb_reply_cont}');">댓글수정</button>
												</c:if>
												</c:if>
											<!--  -->
										</div>
									</div>
									</div>
								</li>
								<!-- /반복 해야대 -->
							</c:if>
							</c:if>
						</c:forEach>
						<%-- </c:if> --%>
						
					</ul>
					<!-- 댓글 글쓰기  -->
					<c:if test="${!empty login }">
						<div class="board_cont_comment_commentWriter">
							<div class="board_cont_comment_inbox">
								<span class="board_cont_comment_inboxName">${login.name}</span>
								<span id="board_rep_arpa">@</span><span id="board_rep_name"></span>
								<span id="board_rep_cont"></span>
								<div class="clear"></div>
								<textarea placeholder="댓글을 남겨보세요" rows="1" 
									class="board_cont_comment_inbox_text" onkeydown="resize(this)"
									onkeyup="resize(this)"
									style="overflow: hidden; overflow-wrap: break-word; height: 17px;"></textarea>
							</div>
								<div class="board_cont_comment_register_box">
									<!-- 댓글 등록 버튼 -->
									<span id="board_req_cancle" onclick="req_cacle();">취소</span>
									<span role="button" class="button btn_register is_active" onclick="repInsert();">등록</span>
								</div>
								<!--  -->
								<div class="clear"></div>
							</div>
						<!-- 댓글 끝 -->
					</c:if>
					<div class="board_cont_btnBox"> <!-- 목록버튼 -->
						<button class="board_cont_listbtn" onclick="location='IY_board_flist?page=${param.page}'">목록</button>
						<!-- 로그인된 회원의 이메일 equlas 게시글 작성자의 이메일  => 수정,삭제 버튼 표시하기-->
						<c:if test="${login.email eq fbCont.email}">
						<button class="board_cont_delbtn" onclick="delcheck();">삭제</button>
						<button class="board_cont_editbtn" onclick="location='IY_fboardEdit?fb_num=${fbCont.fb_num}'">수정</button>
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

	function resize(h) {//댓글 입력란 높이 자동 증가
	  h.style.height = "1px";
	  h.style.height = (12+h.scrollHeight)+"px";
	}
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	function delcheck(){
		var answer = confirm('게시물을 삭제 하겠습니까?');
		var fb_num=getParameterByName("fb_num");
		
		const fboardinfo={
    			fb_num:fb_num
    	};
		if(answer){
			$.ajax({
				type:"post",
				url:"fbdelete",
				headers:{"Content-Type":"application/json"},
				data:JSON.stringify(fboardinfo),
				dataType:"text",
				success:function(){
					alert("게시글 삭제완료")
					location.href="IY_board_flist";
					
				}
			})
		}
	}
	console.log($("#board_cont_fb_num").html());
	function repInsert(){//댓글 등록 시 실행
		if($.trim($(".board_cont_comment_inbox_text").val()) == ""){
			alert("글을 작성해주세요");
			$(".board_cont_comment_inbox_text").focus();
			
			return false;
		}else{
			 if(($("#board_rep_name").text()=="")&&($("#board_rep_cont").text()=="")){<%-- 일반 댓글일 경우 --%>
				const repInfo={
						fboard_num:$("#board_cont_fb_num").html(),
						fb_reply_cont:$(".board_cont_comment_inbox_text").val(),
		    		email:"${login.email}"
		    	};
				console.log(repInfo);
					 $.ajax({
		    		type:"post",
		    		url:"fb_rep_insert",
		    		headers:{"Content-Type":"application/json"},
		    		data:JSON.stringify(repInfo),
			    		success:function(){
			    			window.location.reload();
			    			$('.board_cont_comment_inbox_text').val('');
		    		} 
		    });
			 }
			 else{ <%-- 대댓글 일경우 --%>
			 const repInfo={
						fboard_num:$("#board_cont_fb_num").html(),
						fb_reply_cont:$(".board_cont_comment_inbox_text").val(),
						fb_reply_reply_name:$("#board_rep_name").text(),
						fb_reply_reply_cont:$("#board_rep_cont").text(),
		    		email:"${login.email}"
		    	};
				console.log(repInfo);
					 $.ajax({
		    		type:"post",
		    		url:"fb_rep_rep_insert",
		    		headers:{"Content-Type":"application/json"},
		    		data:JSON.stringify(repInfo),
			    		success:function(){
			    			window.location.reload();
			    			$('.board_cont_comment_inbox_text').val('');
		    		} 
		    });
			 }
		}
	
	}
	//document.onkeydown = notReload;
	//r.name},${r.fb_reply_cont}
	function rep_rep_write(r,c){
		
		var N = r;
		const C = c;
		console.log(N);
		console.log(C);
/* 		$(".board_cont_comment_inbox_text").text('');
		$(".board_cont_comment_inbox_text").append("<p style='color:gray;'>"+N+"<br>"+C+"</p>"); */
	
		$("#board_rep_name").text(N);
		$("#board_rep_cont").text(C);
		$("#board_rep_arpa").show();
		
		console.log($("#board_rep_name").text());
		console.log($("#board_rep_cont").text());
	}
	
	function req_cacle(){
		$("#board_rep_name").text('');
		$("#board_rep_cont").text('');
		$("#board_rep_name").hide();
		$("#board_rep_cont").hide();
		$(".board_cont_comment_inbox_text").val('');
		$(".board_cont_comment_inbox_text").focus();
	}
	
	function rep_rep_delete(d){
		const D=d;
		console.log(D);
		const replynum={freply_num:D};
		console.log(replynum);
		$.ajax({
			type:"post",
			url:"fbreplydelete",
			headers:{"Content-Type":"application/json"},
			dataType:"text",
			data:JSON.stringify(replynum),
			success:function(){
				alert("댓글 삭제 완료");
				location.reload();
			}
		})
	}
	
	function rep_rep_edit(rid,cont){ //댓글 수정버튼 클릭시 
		var htmls = "";
		htmls += "";
		htmls += "<div class='board_cont_comment_commentWriter'>";
		htmls += "<div class='board_cont_comment_inbox'> ";
		htmls += "<span class='board_cont_comment_inboxName'>${login.name}</span>";
		htmls += "<textarea placeholder='댓글을 남겨보세요' rows='1' id='editContent"+rid+"' class='board_cont_comment_inbox_text' onkeydown='resize(this)' ";
		htmls += "style='overflow: hidden; overflow-wrap: break-word; height: 17px;'>"+cont+"</textarea></div>";
		htmls += "<div class='board_cont_comment_register_box'> ";
		htmls += "<span id='board_req_cancle' onclick='reload();'>취소</span> ";
		htmls += "<span role='button' class='button btn_register is_active' onclick='repEdit("+rid+");'>수정</span></div>";
		htmls += "<div class='clear'></div></div>";
		$('#rid'+ rid).replaceWith(htmls);
		$('#rid'+ rid + '#editContent').focus();
	}
	
	function reload(){
		location.reload();
	}
	
	function repEdit(rid){
		var fb_reply_cont = $.trim($('#editContent'+rid).val());
		
		if (fb_reply_cont == '') {
			alert('수정할 내용을 입력하세요');
			$('#editContent'+rid).val('').focus();
			return false;
		}else{
			const repInfo={
					fb_reply_cont:fb_reply_cont,
					freply_num:rid
	    	};
			 $.ajax({
		    		type:"post",
		    		url:"frep_update",
		    		headers:{"Content-Type":"application/json"},
		    		data:JSON.stringify(repInfo),
		    		success:function(){
		    			reload();
		    		} 
		    });
		}
	}
	
</script>

</html>












