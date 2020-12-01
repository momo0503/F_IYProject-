<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<link rel="stylesheet" href="./resources/css/membership.css">

<script src="./resources/js/jquery.js"></script>

</head>
<body>
	<div data-vue="token"></div>
	<div data-vue="globalUser"></div>
	<div data-vue="resizeHandler"></div>

	<div class="wrap login">
		<div class="head_banner_group"></div>
		<form data-form="reauth-phone" class="form form-signup-step2" id="MemberShipForm"
			data-page="signup" action="checkEmail" method="post">
			<div class="login wrap">
				<div class="login logo">
					<h1>
						<a href="/"> <span class="sp-icon icon-iduslogo"></span>
						</a>
					</h1>
				</div>

				<section class="login section signup-form">
					<div>
						<a href="lifetheater"><img alt="로고" src="./resources/img/include/rectanglelogo.png"><br></a>
						<h1 class="login title">회원가입하기</h1>
						<h3 class="signup-step title">가입 정보 입력하기</h3>
					</div>

					<div class="form-block">
						<label for="" class="form-block-head"> <em
							class="asterisk red">&lowast;</em> 이메일
						</label>&nbsp;&nbsp;&nbsp;<span id="email_ch"></span>
						<div class="form-block-body">
							<div class="input-text size-w">
								<input class="" type="email" name="email" id="email"
									placeholder="이메일을 입력해주세요." required value="" />
							</div>
						</div>
					</div>

					<div class="form-block">
						<label for="" class="form-block-head"> <em
							class="asterisk red">&lowast;</em> 비밀번호
						</label>&nbsp;&nbsp;&nbsp;<span id="pwd_ch"></span>
						<div class="form-block-body">
							<div class="input-text size-w">
								<input type="password" name="pw" id="pw"
									placeholder="비밀번호 (영문+숫자+특수문자 8자 이상)" required>
							</div>
						</div>
						<div class="form-block"><!-- form-block-body : 윗공백없는 css-->
						<label for="" class="form-block-head"> <em
							class="asterisk red">&lowast;</em> 비밀번호 확인
						</label>&nbsp;&nbsp;&nbsp;<span id="pwd_ch2"></span>
							<div class="input-text size-w">
								<input type="password" name="password_confirm" id="password_check"
									placeholder="비밀번호 확인" required>
							</div>
						</div>
					</div>

					<div class="form-block">
						<label for="" class="form-block-head"> <em
							class="asterisk red">&lowast;</em> 이름
						</label>&nbsp;&nbsp;&nbsp;<span id="user_ch"></span>
						<div class="form-block-body">
							<div class="input-text size-w type-l">
								<input class="" type="text" name="name" value="" id="name"
									placeholder="이름을 입력해주세요." required>
							</div>
						</div>
					</div>
					<div class="form-block" data-auth="root">
						<label for="" class="form-block-head"> <em
							class="asterisk red">&lowast;</em> 전화번호
						</label>&nbsp;&nbsp;&nbsp;<span id="phone_ch"></span>
						<div class="form-block-body">
							<div class="ui-input-btn-combo">
								<div class="input-text size-w type-l">
									<!-- <input class="reauth" type="hidden" name="only_auth" value="1"> -->
									<input type="tel" name="phone" data-auth="cell_phone" id="phone"
										placeholder="010-1234-5678" value="" required>
								</div>
							</div>
						</div>
					</div>

					<div class="form-block check-all-wrap">
						<div class="terms">

							<div class="terms-body">

								<div class="terms-item">
									<div class="input-checkbox">
										<input id="terms2" class="bp check" type="checkbox"
											name="terms2" required data-ui="check-all-linked"
											data-ui-id="signup" checked>
									</div>
									<a class="label" target="_blank" href="/w/board/terms/privacy">개인정보
										처리방침 필수 동의</a>
								</div>

							</div>
						</div>
					</div>

					<div class="form-block form-block-submit">
						<div class="form-block-body">
							<button class="btn btn-point btn-login" type="button" id="email_submit">
								회원가입하기(이메일 인증하기)</button>
						</div>
					</div>
				</section>
			</div>
		</form>
	</div>
		<script>
		
		$(function(){
			var getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
			var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
			var getName= RegExp(/^[가-힣]+$/);
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var getPhone = RegExp(/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/);
			var chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		
			//회원가입 검증~~
			//ID 입력값 검증.
			$('#email').on('keyup', function() {
				if($("#email").val() == ""){
					$('#email').css("background-color", "pink");
					$('#email_ch').html('<b style="font-size:16px;color:red;">[이메일은 필수 정보에요!]</b>');
					chk1 = false;
				}
				
				//아이디 유효성검사
				else if(!getMail.test($("#email").val())){
					$('#email').css("background-color", "pink");
					$('#email_ch').html('<b style="font-size:16px;color:red;">[이메일 형식에 맞게 써주세요!]</b>');	  
					chk1 = false;
				} 
				 //ID 중복확인 비동기 처리
 				 else {
					$.ajax({
						type: "POST",
						url: "/controller/confirmEmail",
						headers: { 
							'Accept': 'application/json',
	            'Content-Type': 'application/json' 
	            },
						data: JSON.stringify({email:$("#email").val()}),
						dataType:"text",
						success: function(data) {
							if($.trim(data) == "YES") {
								$('#email').css("background-color", "white");
								$('#email_ch').html('<b>√</b>');
								$('#email_ch').css({'color':'#E95753',});
								chk1 = true;
							} else {
								$('#email').css("background-color", "pink");
								$('#email_ch').html('<b style="font-size:16px;color:red;">[중복된 Email입니다!]</b>');
								chk1 = false;
							}
						}
					});
				}
			});
			$('#pw').on('keyup', function() {
				//비밀번호 공백 확인
				if($("#pw").val() == ""){
				    $('#pw').css("background-color", "pink");
					$('#pwChk').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보에요!]</b>');
					chk2 = false;
				}		         
				//비밀번호 유효성검사
				else if(!getPwCheck.test($("#pw").val()) || $("#pw").val().length < 8 || $("#pw").val().length > 14){
				    $('#pw').css("background-color", "pink");
					$('#pwd_ch').html('<b style="font-size:16px;color:red;">[특수문자 포함 8자이상으로 작성해주세요!]</b>');
					chk2 = false;
				} else {
					$('#pw').css("background-color", "white");
					$('#pwd_ch').html('<b>√</b>');
					$('#pwd_ch').css({'color':'#E95753',});
					chk2 = true;
				}
			});
			//패스워드 확인란 입력값 검증.
			$('#password_check').on('keyup', function() {
				//비밀번호 확인란 공백 확인
				if($("#password_check").val() == ""){
				    $('#password_check').css("background-color", "pink");
					$('#pwd_ch2').html('<b style="font-size:16px;color:red;">[패스워드확인은 필수정보에요!]</b>');
					
					chk3 = false;
				}		         
				//비밀번호 확인란 유효성검사
				else if($("#pw").val() != $("#password_check").val()){
				    $('#password_check').css("background-color", "pink");
					$('#pwd_ch2').html('<b style="font-size:16px;color:red;">[비밀번호가 일치하지 않습니다!]</b>');
					chk3 = false;
				} else {
					$('#password_check').css("background-color", "white");
					$('#pwd_ch2').html('<b>√</b>');
					$('#pwd_ch2').css({'color':'#E95753',});
					chk3 = true;
				}
			});
			//이름 입력값 검증.
			$('#name').on('keyup', function() {
				//이름값 공백 확인
				if($("#name").val() == ""){
				    $('#name').css("background-color", "pink");
					$('#user_ch').html('<b style="font-size:16px;color:red;">[이름은 필수정보에요!]</b>');
					chk4 = false;
				}
				else{
					$('#name').css("background-color", "white");
					$('#user_ch').html('<b>√</b>');
					$('#user_ch').css({'color':'#E95753',});
					chk4 = true;
				}
			});
			//핸드폰 유효성 검증
			$('#phone').on('keyup', function() {
				//이름값 공백 확인
				if($("#phone").val() == ""){
				    $('#phone').css("background-color", "pink");
					$('#phone_ch').html('<b style="font-size:16px;color:red;">[전화번호를 입력해주세요!]</b>');
					chk5 = false;
				}
				else if(!getPhone.test($("#phone").val())){
				  $('#phone').css("background-color", "pink");
					$('#phone_ch').html('<b style="font-size:16px;color:red;">[전화번호를 올바르게 적어주세요!]</b>');
					chk5 = false;
				}
				else{
					$('#phone').css("background-color", "white");
					$('#phone_ch').html('<b>√</b>');
					$('#phone_ch').css({'color':'#E95753',});
					chk5 = true;
				}
			});
			$('#email_submit').click(function(e) {
				if(chk1 && chk2 && chk3 && chk4 && chk5) {
					var answer = confirm('회원가입을 완료하시겠습니까?');
					if(answer) {
						e.preventDefault();
						$('#MemberShipForm').submit();
					} 
				} else {
					alert('입력정보를 다시 확인하세요.');	
					return false;
				}
			});
		});
		</script>
</body>
</html>
