<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청한 페이지를 찾을수 없습니다.</title>
<link rel="stylesheet" href="./resources/css/error.css">
<style type="text/css">

</style>
</head>
<body>
	<div class="error_content">
		<div style="text-align: center">
			<img src="./resources/img/include/LT.png" class="error_main_img" onclick="location='lifetheater'" >
		</div>
		<p class="error_desc">
			페이지를 찾을수 없습니다.
		</p>
		<p class="error_desc2">
			방문하시려는 페이지의 주소가 잘못 입력되어있거나,
			<br>
			페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
			<br>
			입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
		</p>
		<p class="error_desc3">
			관련 문의사항은 
			<a href="/controller/support">고객센터</a>
			에 알려주시면 친절히 안내해드리겠습니다. 감사합니다.
		</p>
		<p class="btn">
				<a href="javascript:history.back();" target="_top" class="error_backBtn">
					<button>이전 페이지로</button>
				</a>
		</p>
	</div>
</body>
</html>