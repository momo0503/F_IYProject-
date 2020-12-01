
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>네이버로그인</title>
    <script type="text/javascript" src="./resources/JavaScript/jquery.js"></script> 
  </head>
  <body>
  <%
    String clientId = "yNBXdmQkw280ggG5Pgs5";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "zRWovd_ZcL";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8011/controller/navercallback", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
    	 System.out.println("1");
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        System.out.println("2");
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
      String test=res.toString();
      %>
       <script>
       $(function(){
    	   
      
       const info=<%=test%>;
       
       console.log(info);
   	$.ajax({
   		type:"get",
   		url:"naverinfo",
   		headers:{"Content-Type":"application/json"},
   		dataType:"json",
   		data:info,
   		success:function(data){
   			console.log(data.response);
   			$.ajax({
   				type:"post",
   				url:"naverlogin",
   				headers:{"Content-Type":"application/json"},
   				dataType:"json",
   				data:JSON.stringify(data.response),
   				success:function(test){
   					console.log("성공");
   					console.log(test);
   					console.log(test.phone);
   					if((test.phone).length>1){
   						console.log(test);
   						
	    				location.href="lifetheater";
   					}else{
   						location.href="IY_moreinfo?email="+test.email+"&loginWay="+test.loginWay;
   					}
   				},error:function(){
	    			console.log("dd");
	    		}
   			})
   		},error:function(){
   			alert("dhk");
   		}
   	})
  
       });
     
       </script>
    <%  }
    } catch (Exception e) {
      System.out.println(e);
    }%>
  </body>
</html>