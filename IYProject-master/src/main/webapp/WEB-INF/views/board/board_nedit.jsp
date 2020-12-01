<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript" ></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- <script src="resources/js/jquery-3.5.1.min.js"></script> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="resources/js/summernote-ko-KR.js" ></script>
<link rel="stylesheet" href="./resources/css/board.css">
</head>
<body>

	<jsp:include page="../../include/header.jsp" />
	<div class="board_write_wrap">
		<h2 class="board_write_title"><b>공지 게시판</b></h2>
		<span id="board_fb_num">${nbCont.nb_num}</span>
		<input placeholder="제목을 입력해 주세요." id="board_title" style="height: 40px;" value="${nbCont.nb_title}" />
		<textarea id="board_summernote">${nbCont.nb_cont}</textarea>
	
		<div id="board_write_btmbtn">
			<button id="board_write_listbtn" onclick="location='IY_board_nlist'">목록</button>		
			<button type='button' id="board_write_submitbtn" onclick='check();'>수정</button>
		</div>
		<div class="clear"></div>
	</div>
		<jsp:include page="../../include/footer.jsp" />
	<script>
	$("#board_fb_num").hide();
		var url;
		

	   
		
		$('#board_summernote').summernote({
			placeholder : '내용을 입력해주세요',
			tabsize : 300,
			height : 500,
			width : 900,
			lang : 'ko-KR',
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				}
			}
		});
		
		
		function uploadSummernoteImageFile(file, editor) {
			console.log('이미지 함수 실행');
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				processData : false,
				success : function(data) {
					console.log('성공?');
	            	//항상 업로드된 파일의 url이 있어야 한다.
					$(editor).summernote('insertImage', data.url);//경로를 넣어주면 이미지를 보여주는 함수(미리보기)
	        console.log(data.url);
					url = data.url;
				},
				error:function(){
					console.log("실패");
				}
			});
		}
		
		$("div.note-editable").on('drop',function(e){
	         for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
	         	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#board_summernote")[0]);
	         }
	       	console.log("얌마");
	        console.log(e);
	        console.log("야임마");
	   })
		
		function check() {
			if ($.trim($('#board_title').val()) == '') {
				alert('제목을 입력하세요');
				$('#board_title').val('').focus();
				return false;
			} else if ($.trim($('#board_summernote').val()) == '') {
				alert('내용을 입력하세요');
				$('#board_summernote').val('').focus();
				return false;
			} else {
				const boardInfo={
						nb_num:$("#board_fb_num").text(),
						nb_title:$("#board_title").val(),
		    		nb_cont:$("#board_summernote").val(),
		    		nb_img_url:url,
		    		email:"<c:out value='${login.email}'/>"
		    	};
				console.log(boardInfo);
 				 $.ajax({
		    		type:"post",
		    		url:"nb_update",
		    		headers:{"Content-Type":"application/json"},
		    		data:JSON.stringify(boardInfo),
 		    		success:function(){
		    			window.location.replace("IY_board_nlist");
		    		} 
		    });
			}
		}

	</script>
</body>
</html>

