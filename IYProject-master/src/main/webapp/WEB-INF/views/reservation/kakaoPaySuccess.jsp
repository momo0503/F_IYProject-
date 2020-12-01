<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
#pay_way {
    width: 410px;
    margin: 80px auto 0;
    padding: 57px 0 2px 2px;
    font-size: 15px;
    font-family: "나눔고딕", "NanumGothic", "돋움", Dotum, Helvetica, Sans-serif;
    text-align: left;
    line-height: 14px;
    white-space: nowrap;
    text-align: center;
}
.pay_main_img {
    max-width: 109px;
}
.pay_main_img:hover {
  cursor: pointer;
}
</style>
</head>
<body>
 <div id="pay_way">
 <img src="./resources/img/include/LT.png" class="pay_main_img" onclick="location='lifetheater'"><br>
카카오페이 결제가 정상적으로 완료되었습니다.<br/>
 
구매자 :     [${vo.email}]<br/>
결제일시:     [${vo.pur_date}]<br/>
연극명:     [${vo.td_title}]<br/>
매수:       [${vo.value1}]<br/>
결제금액:    [${vo.totalCost}]<br/>
공연 시간:    [${vo.td_runtime}]<br/>
결제방법:    [카카오 페이]<br/>
 	<button onclick="location='lifetheater'">확인</button>
 </div>
</body>
</html>