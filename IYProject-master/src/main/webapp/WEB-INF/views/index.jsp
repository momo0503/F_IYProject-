<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인연</title>
<link rel='stylesheet' type='text/css' href="./resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<!-- https://www.w3schools.com/howto/howto_css_menu_icon.asp -->
 

<jsp:include page="../include/header.jsp" />


<div class="main-slide-wrap">
  <div class="main-slide">
    <div class="main-slide-item">
      <a href="#">
        <img src="./resources/img/include/slide1.jpg" class="main-slide-img"/>
      </a>
    </div>
    <div class="main-slide-item">
      <a href="#">
        <img src="./resources/img/include/slide2.jpg" class="main-slide-img"/>
      </a>
    </div>
  </div>
  <div class="main-slide-dir">
    <a href="#" class="main-slide-prev">
      <img src="./resources/img/include/slide-dir-prev.png" />
    </a>
    <a href="#" class="main-slide-next">
      <img src="./resources/img/include/slide-dir-next.png" />
    </a>
  </div>
</div>

<div class="main-reco-wrap">
  <div class="main-tit">
    <br/><br/><h1>오늘의 추천</h1><br/><br/>
  </div>
  <!-- http://kopis.or.kr/openApi/restful/pblprfr?service=87bc9b8de1994a3690cd1c296b09b00c&stdate=20200801&eddate=20200831&cpage=2&rows=20 -->
  <div class="main-reco-items" id="main-reco-item">
 <!--    <div class="main-reco-item">
      <a href="#">
        <div class="main-reco-item-box">
          <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF166727_200811_105337.jpg" />
          <div class="main-reco-item-box-txt">
            <p> 연극 제목 </p>
          </div>
        </div>
      </a>
    </div>-->
  </div>
</div>

<script>
  
  $.getJSON("/controller/lifetheater/main_reco",function(data){
	  var str="";
	  $(data).each(function(){
		  str+='<div class="main-reco-item">'
		  	+'<a href="/IY_detailPage&tid='+this.theater_id+'">'
		  	+ '<div class="main-reco-item-box">'
		  	+ '<img src="'+this.poster_url+'">'
		  	+ '<div class="main-reco-item-box-txt">'
		  	+ '<p> '+this.theater_name+'</p>'
		  	+ '</div></div></a></div>'
	  })
	  $('#main-reco-item').html(str);
  })
</script>


<div class="main-rank-wrap">
<!-- http://kopis.or.kr/openApi/restful/boxoffice?service=87bc9b8de1994a3690cd1c296b09b00c&ststype=week&date=20200811&catecode=AAAA -->
  <div class="main-tit">
    <br/><br/><h1>랭킹</h1><br/><br/>
  </div>
  <div class="main-rank-category">
    <p class="main-rank-category-tags">
      <a href="#" onclick="loadRanking('day'); return false;">#DAY</a>
      <a href="#" onclick="loadRanking('week'); return false;">#WEEK</a>
      <a href="#" onclick="loadRanking('month'); return false;">#MONTH</a>
    </p>
  </div>
  <div class="main-rank-items" id = "main-rank-items">
  <!-- http://kopis.or.kr/openApi/restful/pblprfr/PF166272?service=87bc9b8de1994a3690cd1c296b09b00c -->
    <!-- <div class="main-rank-item">
     <div class="main-rank-item-rtxt">
          <h1>1위</h1>
        </div>
      <a href="#">
        <div class="main-rank-item-card">
          <div class="main-rank-item-inner">
             <div class="main-rank-item-front">
            <img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF166272_200729_104653.JPG" />
          </div>
          <div class="main-rank-item-back">
            <div class="main-rank-item-disctxt">
            <p class="main-rank-item-tit"><span>Title</span></p>
            <p class="main-rank-item-detail">상영 장소<p>
            <p class="main-rank-item-price">price</p>
            <p class="main-rank-item-date">상영 날짜</p>
            </div>
            
          </div>
          </div>
       
        </div>
       
      </a>
    </div>-->
    
  
  </div>
  
  <script>
    var rType = "day";
    loadRanking(rType);
    function loadRanking(rankCondi){
    	rType = rankCondi;
    	 $.getJSON("/controller/lifetheater/main_rank/type="+rType,function(data){
    		  var str="";
    		  var rankNum = 1;
    		  $(data).each(function(){
    			  str+=
    			  "<div class='main-rank-item'>"
    			     +"<div class='main-rank-item-rtxt' style=margin-bottom:20px;>"
    			          +"<h1>"+(rankNum++)+"위</h1>"
    			        +"</div>"
    			      +"<a href='#'>"
    			        +"<div class='main-rank-item-card'>"
    			          +"<div class='main-rank-item-inner'>"
    			             +"<div class='main-rank-item-front'>"
    			            +"<img src='"+this.poster_url+"' style=width=420px; height=380px;/>"
    			          +"</div>"
    			          +"<div class='main-rank-item-back'>"
    			          +"<div class='main-rank-item-disctxt'>"  
    			           +"<p class='main-rank-item-tit'><span>"+this.theater_name+"</span></p><br/>" 
    			            +"<p class='main-rank-item-detail'>"+this.location_name+"</p>"
    			            +"<p class='main-rank-item-date'>"+this.playtime+"</p>"
    			            +"</div></div></div></div></a></div>"
    			  
    			if(rankNum>3)return false;
    		  })
    		  $('#main-rank-items').html(str);
    	  })
    }
 
  </script>
  
  <div class="main-rank-more">
    <a href="#">
    	 랭킹 더보기 + 
    </a>
  </div>
</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>