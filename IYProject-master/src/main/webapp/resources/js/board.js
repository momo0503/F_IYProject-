/**
 * 
 */

function check(){
	if($.trim($('#board_name').val())==""){
		alert('이름을 입력하세요');
		$('#board_name').val('').focus();
		return false;
	}
	if($.trim($('#board_pwd').val())==""){
		alert('비밀번호를 입력하세요');
		$('#board_pwd').val('').focus();
		return false;
	}
	if($.trim($('#board_title').val())==""){
		alert('제목을 입력하세요');
		$('#board_title').val('').focus();
		return false;
	}
	if($.trim($('#board_cont').val())==""){
		alert('내용을 입력하세요');
		$('#board_cont').val('').focus();
		return false;
	}
	
}
function check_edit(){
	if($.trim($('#board_name').val())==""){
		alert('이름을 입력하세요');
		$('#board_name').val('').focus();
		return false;
	}
	if($.trim($('#board_pwd').val())==""){
		alert('비밀번호를 입력하세요');
		$('#board_pwd').val('').focus();
		return false;
	}
	if($.trim($('#board_title').val())==""){
		alert('제목을 입력하세요');
		$('#board_title').val('').focus();
		return false;
	}
	if($.trim($('#board_cont').val())==""){
		alert('내용을 입력하세요');
		$('#board_cont').val('').focus();
		return false;
	}
}

function cleck_del(){
	if($.trim($("#board_pwd").val())==""){
		alert('비번을 입력해주세요');
		$("#board_pwd").val('').focus();
		return false;
	}
}


































