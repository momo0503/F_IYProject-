<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 > 자주묻는 질문</title>
<link rel='stylesheet' type='text/css' href="./resources/css/main.css"/>
<link rel='stylesheet' type='text/css' href="./resources/css/support.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
	  // add db faq
	  loadHelpList('전체');
	  $(".cc-block-btn").click(function(){
		  var curBlockBtnNum = $(".cc-block-btn").index(this);
		  $(".cc-block ul li").removeClass("on");
		  $(".cc-block ul li").eq(curBlockBtnNum).addClass('on');
		  $('#faq-list-title').text($(this).data('kind'));
		  // load support faq db data 
		  loadHelpList($(this).data('kind'));
	  }) 
	  
	  
	  
	
  });

  
  function loadHelpList(kind){
	  $.ajax({
		  url:"${pageContext.request.contextPath}/support_help_list?condition=title&keyword="+kind,
		  type:'GET',
		  dataType:'json',
		  success:function(data){
			  var listSize=0;
			  console.log(data);
			  var addstr="<ul>";
			  $.each(data,function(key,val){
				  addstr+="<li>"
		        	+"<div class='faq-q'>"
		        	 +' <a>'
		        	  +'  <p class="faq-tit">'
		        	     
		        	     +'<span class="font-green">'
		        	  +'['+val.field+']'
		        	    +'</span></p><p class="faq-txt"><span>'
		        	     +val.quest
		        	    +'</span></p></a></div><div class="faq-a"><p class="faq-a-cont">'
		        	    <!-- A. -->
		        	   +' <span>'
		        	      	+val.answer
		        	    +'</span></p></div></li>';
								  
				  ++listSize;
			  })
			  $("#faq-list-cnt").text(listSize+"건");
			  
			  $("#faq-list").html(addstr);
			  
			// when start page, answer hide
			  $(".faq-a").hide();
			  $(".faq-q").removeClass("on");
			  
			  
				// when question clicks,  
			  var preQnANum = -1;
			  $(".faq-q").click(function(){
				 var curQnANum = $(".faq-q").index(this);
				 if(curQnANum!=preQnANum){
					 $(".faq-a").stop(true,true).slideUp(400);
					 $(".faq-q").removeClass('on');
					 preQnANum = curQnANum;
					 $(".faq-q").eq(preQnANum).addClass('on');
					 $(".faq-a").eq(preQnANum).stop(true,true).slideDown(400);
				 }else{
					 $(".faq-a").eq(curQnANum).stop(true,true).slideUp(400);
					 $(".faq-q").eq(curQnANum).removeClass('on');
					 preQnANum=-1;
				 }
			  })
		  },
		  error:function(xhr,status,error){
			  console.log('error  '+error);
		  }
	  });
  }
</script>
</head>
<body>
	<jsp:include page="../../include/header.jsp" />


<div class="inner_wrap">

<!-- gnb - 고객센터 홈,공지사항,1:1문의,FAQ -->
  <div class="lnb-area">
    <nav id="lnb">
      <p class="tit">
        <a href="support">고객센터</a>
         <!-- I want to make support main home but we don't have enough time-->
      </p>
      <ul>
        <li><a href="IY_board_nlist">공지사항</a></li>
        <li><a href="IY_mypage_inquiry">1:1 문의</a></li>
        <li class="on"><a href="support">자주 묻는 질문</a></li>
      </ul>
    </nav>
  </div>


<!-- FAQ -->
  <div id="contents">
    <h2 class="tit">
      	자주 묻는 질문
    </h2>
    <!-- 검색 -->
    <!-- <div class="input-search-area mb30">
      <div class="input-area">
        <label class="search_label">빠른 검색</label>
        <div class="board-search w460px">
          <input type="search" id="serchTxt" class="input-text"/>
          <button type="button" id="searchBtn"></button>
        </div>
      </div>
      
      <div class="clear"></div>
    </div> -->
    
    <!-- 질문 분류 -->
    <div class="cc-block mb30">
      <ul>
        <li class="on"><button type="button" class="cc-block-btn" data-kind="전체">전체</button>
        <li><button type="button" class="cc-block-btn" data-kind="연극예매">연극예매</button>
        <li><button type="button" class="cc-block-btn" data-kind="포인트">포인트</button>
        <li><button type="button" class="cc-block-btn" data-kind="극장">극장</button>
        <li><button type="button" class="cc-block-btn" data-kind="결제수단">결제수단</button>
      </ul>
    
    </div>
    
    <!-- 질문 & 답 -->
    <div class="faq-list-box">
      <p class="faq-list-box-title mb10">
        <strong><span id="faq-list-title">전체</span>
          <span id="faq-list-cnt">0건</span>
        </strong>
      </p>
    
      <div class="faq-list" id="faq-list">
        <ul>
          <li>
        	<div class="faq-q on">
        	  <a href="#">
        	    <p class="faq-tit">
        	     
        	      <span class="font-green">[극장]</span>
        	    </p>
        	    <p class="faq-txt">
        	      <span>질문 퀘스천???</span>
        	    </p>
        	  </a>
        	</div>
        	<div class="faq-a">
        	  <p class="faq-a-cont">
        	    <!-- A. -->
        	    <span>
        	      	질문에 대한 답</br>
        	      	응답
        	    </span>
        	  </p>
        	</div>
          </li>
          
          <li>
        	<div class="faq-q">
        	  <a href="#">
        	    <p class="faq-tit">
        	     
        	      <span class="font-green">[포인트]</span>
        	    </p>
        	    <p class="faq-txt">
        	      <span>포인트가 적립을 못받았어요. 어떻게 해야 하나요?</span>
        	    </p>
        	  </a>
        	</div>
        	<div class="faq-a">
        	  <p class="faq-a-cont">
        	    <!-- A. -->
        	    <span>
        	      	멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br/>
					상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.<br/><br/>
					(이용약관 '제 13조 포인트 안내'에 의거 )
        	    </span>
        	  </p>
        	</div>
          </li>
        </ul>
      
      </div>
      
      <div class="clear"></div>
      
      <!-- pagination -->
      <!-- <nav class="faq-pagination">
        <strong class="faq-page active">1</strong>
        <a href="#">2</a>
      </nav> -->
    </div>
    
    <div class="clear"></div>
    
  </div>

</div>

<div class="clear" ></div>

	<jsp:include page="../../include/footer.jsp" />
</body>
</html>