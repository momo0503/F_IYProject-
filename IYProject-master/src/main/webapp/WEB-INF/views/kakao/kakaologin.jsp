<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 
<script>


$(document).ready(function(){ 
	console.log("시작");
const userinfo=${kakaouser};
console.log(userinfo);
$.ajax({
		    		type:"post",
		    		url:"kakaologin",
		    		headers:{"Content-Type":"application/json"},
		    		dataType:"json",
		    		data:JSON.stringify(userinfo),
		    		success:function(data){
		    			console.log(data);
		    			console.log("야");
		    			
		    			if((data.phone).length>1){
	   						
		    				location.href="lifetheater";
	   					}else{
	   						location.href="IY_moreinfo?email="+data.email+"&loginWay="+data.loginWay;
	   						
	   					}
		    			
		    		}
		    			
		    		})
});
</script>
</head>
<body>

</body>
</html>