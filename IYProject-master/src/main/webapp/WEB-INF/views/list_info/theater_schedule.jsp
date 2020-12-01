<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="./resources/css/detailPage_schedule.css">
<script src="./resources/js/jquery.js"></script>
<script
	src="https://ajax.googlepis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- calendar -->
<link rel="stylesheet"
	href="resources/Calendar/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="resources/Calendar/vendor/css/bootstrap.min.css">
<link rel="stylesheet"
	href='resources/Calendar/vendor/css/select2.min.css' />
<link rel="stylesheet"
	href='resources/Calendar/vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="resources/css/main.css">
<!-- calendar -->

<!-- summerNote -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"
	type="text/javascript"></script> -->
<!-- <script src="resources/js/jquery-3.5.1.min.js"></script>  -->

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
<!-- summerNote -->
<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" 
rel="stylesheet"> 
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


</head>
<body>
	<jsp:include page="../../include/header.jsp" />
		 
		 
		<!-- calendar -->
		
		<div id="schedule_info_input" class="schedule_info_input">
		<h1>스케쥴 작성</h1>
		</div>				
		
		<div class="container">

			<!-- 일자 클릭시 메뉴오픈 -->
			<div id="contextMenu" class="dropdown clearfix">
				<ul class="dropdown-menu dropNewEvent" role="menu"
					aria-labelledby="dropdownMenu"
					style="display: block; position: static; margin-bottom: 5px;">
					<li><a tabindex="-1" href="#">카테고리1</a></li>
					<li><a tabindex="-1" href="#">카테고리2</a></li>
					<li><a tabindex="-1" href="#">카테고리3</a></li>
					<li><a tabindex="-1" href="#">카테고리4</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
				</ul>
			</div>

			<div id="wrapper">
				<div id="loading"></div>
				<div id="calendar"></div>
			</div>


			<!-- 일정 추가 MODAL -->
			<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
								<!-- 일정명 -->
							<div class="row">
								<div class="col-xs-12">
									<label class="col-xs-4" for="edit-title">내용</label> <input
										class="inputModal" type="text" name="edit-title"
										id="edit-title" required="required" />
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<label class="col-xs-4" for="edit-start">시작</label> <input
										class="inputModal" type="text" name="edit-start"
										id="edit-start" />
								</div>
							</div>
							
							<div class="row">
								<div class="col-xs-12">
									<label class="col-xs-4" for="edit-type">구분</label> <select
										class="inputModal" type="text" name="edit-type" id="edit-type">
										<option value="카테고리1">카테고리1</option>
										<option value="카테고리2">카테고리2</option>
										<option value="카테고리3">카테고리3</option>
										<option value="카테고리4">카테고리4</option>
									</select>
								</div>
							</div>
							<!-- 카테고리 등록시 색상 
							<div class="row">
								<div class="col-xs-12">
									<label class="col-xs-4" for="edit-color">색상</label> <select
										class="inputModal" name="color" id="edit-color">
										<option value="#D25565" style="color: #D25565;">빨간색</option>
										<option value="#9775fa" style="color: #9775fa;">보라색</option>
										<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
										<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
										<option value="#f06595" style="color: #f06595;">핑크색</option>
										<option value="#63e6be" style="color: #63e6be;">연두색</option>
										<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
										<option value="#4d638c" style="color: #4d638c;">남색</option>
										<option value="#495057" style="color: #495057;">검정색</option>
									</select>
								</div>
							</div> -->
							<!-- 카테고리 내용
							<div class="row">
								<div class="col-xs-12">
									<label class="col-xs-4" for="edit-desc">설명</label>
									<textarea rows="4" cols="50" class="inputModal"
										name="edit-desc" id="edit-desc"></textarea>
								</div>
							</div> -->
						</div>
						
						<div class="modal-footer modalBtnContainer-addEvent">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="save-event">저장</button>
						</div>
						<div class="modal-footer modalBtnContainer-modifyEvent">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
							<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- <div class="panel panel-default">

				<div class="panel-heading">
					<h3 class="panel-title">필터</h3>
				</div>

				<div class="panel-body">

					<div class="col-lg-6">
						<label for="calendar_view">구분별</label>
						<div class="input-group">
							<select class="filter" id="type_filter" multiple="multiple">
								<option value="카테고리1">카테고리1</option>
								<option value="카테고리2">카테고리2</option>
								<option value="카테고리3">카테고리3</option>
								<option value="카테고리4">카테고리4</option>
							</select>
						</div>
					</div>

					<div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

				</div>
			</div> -->
			<!-- /.filter panel -->
			<br>
			<input id="schedule_btn_check" class="schedule_btn_check" type="button" value="확인" submit="#">
			<input id="schedule_btn_can" class="schedule_btn_can" type="button" value="취소" submit="#">
			<input id="schedule_btn_back" class="schedule_btn_back" type="button" value="이전" submit="#">
			
			
		</div>
		<!-- /.container -->

		<script src="resources/Calendar/vendor/js/jquery.min.js"></script>
		<script src="resources/Calendar/vendor/js/bootstrap.min.js"></script>
		<script src="resources/Calendar/vendor/js/moment.min.js"></script>
		<script src="resources/Calendar/vendor/js/fullcalendar.min.js"></script>
		<script src="resources/Calendar/vendor/js/ko.js"></script>
		<script src="resources/Calendar/vendor/js/select2.min.js"></script>
		<script
			src="resources/Calendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
		<script src="resources/Calendar/js/main.js"></script>
		<script src="resources/Calendar/js/addEvent.js"></script>
		<script src="resources/Calendar/js/editEvent.js"></script>
		<script src="resources/Calendar/js/etcSetting.js"></script>
		
	<jsp:include page="../../include/footer.jsp" />

</body>
</html>