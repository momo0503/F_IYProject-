/**
 * 
 */
/*문제 check함수를 정의하고, 자바스크립트와 jQuery를 사용해서 유효성 검증처리를 한다.
 * 비밀번호와 비밀번호 재확인은 서로 비번을 비교해서 비번이다릅니다. 라는 유효성 검증
 * 즉 validate를 처리한다. 아이디 중복검색은 빼고 진행한다.
 */
function check(){
	if($.trim($("#mem_id").val())==""){
		alert("아이디를 입력하세요");
		$("#mem_id").val('').focus();
		return false;
	}
	if($.trim($("#mem_pwd").val())==""){
		alert("비밀번호를 입력하세요");
		$("#mem_pwd").val('').focus();
		return false;
	}
	if($.trim($("#mem_pwd2").val())==""){
		alert("비밀번호 확인을 입력하세요");
		$("#mem_pwd2").val('').focus();
		return false;
	}
	if($.trim($("#mem_name").val())==""){
		alert("이름을 입력하세요");
		$("#mem_name").val('').focus();
		return false;
	}
	if($.trim($("#phone02").val())==""){
		alert("폰 번호를 입력하세요");
		$("#mem_phone2").val('').focus();
		return false;
	}
	if($.trim($("#phone03").val())==""){
		alert("폰번호를 입력하세요");
		$("#mem_phone3").val('').focus();
		return false;
	}
	if(!($.trim($("#mem_pwd").val())===$.trim($("#mem_pwd2").val()))){
		alert("비밀번호가 일치하지않습니다");
		$("#mem_pwd2").focus();
		return false;
	}
}

//비동기식 아작스로 아이디 중복검색
function id_check(){
	$("#idcheck").hide();//span아이디 영역을 숨김
	$mem_id=$.trim($('#mem_id').val());//양쪽공백을 제거하고 아이디값을 가져옴.
	if($mem_id.length<4){
		$newtext='<font color="red" size="3"><b>아이디는 4자이상이여야 합니다.</b></font>';
		$("#idcheck").text('');//idcheck영역 문자열 초기화
		$("#idcheck").show();//span아이디 영역을 보이게함
		$("#idcheck").append($newtext);//idcheck영역에 문자열 추가
		$("#mem_id").val('').focus();//회원아이디 입력박스 최기화하고 포커스 이동
		return false;//폼전송 안함.
	}
	/*문제 ) '아이디는 12자 이하여야합니다' 경고문자열이 span id영역에 추가되게 만들어보자.*/
	if($mem_id.length>12){
		$newtext="<font color='red' size='3'><b>아이디는 12자 이하여야합니다.</b></font>";
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#mem_id").val('').focus();
		return false;
	}
	
	//아이디 정규표현식 검사
	if(!(validate_userid($mem_id))){
		$newtext="<font color='red' size='3'><b>아이디는 영문소문자,숫자,_조합만 가능 합니다.</b></font>";
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#mem_id").val('').focus();
		return false;
	}
	
	//비동기식 jQuery 아작스
	$.ajax({
		type:"POST",//아이디를 서버로 보내는법
		url:"member_idcheck",//매핑주소
		data:{"id":$mem_id},//아이디 파라미터 이름에 $mem_id에 저장된 아이디값을 담아서 전달
		datatype:'int',//받아오는 자료형식이 int
		success:function(data){//받아오는 것이 성공시 호출되는 콜백함수
			//받아온 정수값은 data매개변수에 저장됨.
			if(data==1){
				$newtext="<font color='red' size='3'><b>이미 존재하는 아이디 입니다.</b></font>";
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#mem_id").val('').focus();
				return false;
			}else{
				$newtext="<font color='blue' size='3'><b>사용가능 아이디 입니다.</b></font>";
				$("#idcheck").text('');
				$("#idcheck").show();
				$("#idcheck").append($newtext);
				$("#mem_pwd").focus();
			}
		},
		error:function(){//받아오는 것이 실패시 호출되는 콜백함수
			alert('data error');
		}
	})
	
}//id_check()

//아이디를 정규표현식으로 유효성검증
function validate_userid($mem_id){
	var pattern=new RegExp(/^[a-z0-9_]+$/);
	//정규표현식검사해주는 pattern객체 생성, 영문소문자와 숫자,_조합만 가능
	return pattern.test($mem_id);//정규표현식 검사해서 반환
}


//정보수정 유효성 검증
function edit_check(){
	/*문제) 위소스를 참조해서 아이디만빼고 나머지 유효성검증을 validate를 완성하자*/
	if($.trim($("#mem_pwd").val())==""){
		alert("비밀번호를 입력하세요");
		$("#mem_pwd").val('').focus();
		return false;
	}
	if($.trim($("#mem_pwd2").val())==""){
		alert("비밀번호 확인을 입력하세요");
		$("#mem_pwd2").val('').focus();
		return false;
	}
	if($.trim($("#mem_name").val())==""){
		alert("이름을 입력하세요");
		$("#mem_name").val('').focus();
		return false;
	}
	if($.trim($("#phone02").val())==""){
		alert("폰 번호를 입력하세요");
		$("#mem_phone2").val('').focus();
		return false;
	}
	if($.trim($("#phone03").val())==""){
		alert("폰번호를 입력하세요");
		$("#mem_phone3").val('').focus();
		return false;
	}
	if(!($.trim($("#mem_pwd").val())===$.trim($("#mem_pwd2").val()))){
		alert("비밀번호가 일치하지않습니다");
		$("#mem_pwd2").focus();
		return false;
	}
}









