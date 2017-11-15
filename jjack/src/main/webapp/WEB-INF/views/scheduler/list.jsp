<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짝 게스트하우스</title>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>

<%-- 캘린더  --%>
<link rel='stylesheet prefetch' href='../css/houseApply/fullcalendar.css'>
<link rel="stylesheet" href="../css/scheduler/scheduler.css" />

<!-- 이벤트 종료일 달력으로  표시-->
<%--
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 --%>

<script src="../js/scheduler/scheduler.js"></script>
</head>

<body style="margin: 0 auto;">
		
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		<div class="container mt-4 lDiv">
			<div class="row">
			<%-- ================ 달력 =============== --%>
				<div class="col-md-12">
					<div id='calendar'></div>
					<script src='../js/houseApply/moment.min.js'></script>
					<script src='../js/houseApply/fullcalendar.min.js'></script>
				</div>
			<%-- ================ 달력  =============== --%>
			</div>
			<%-- row 끝 --%>
			
			<!-- 모달 창 -->
			<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
			  <div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="lineModalLabel">행사 일정</h3>
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
					</div>
					<div class="modal-body">
						
			            <!-- content goes here -->
						<form method="post" id="sFrm" action="">
			              <div class="form-group">
			                <label for="startEvent">이벤트 시작일:</label>
			                <input type="text" class="form-control" id="startEvent" name="startEvent" readonly="readonly">
			              </div>
			              <div class="form-group">
			                <label for="endEvent">이벤트 종료일:</label>
			                <input type="date" class="form-control" id="endEvent" name="endEvent" placeholder="이벤트 종료일을 선택하세요.">
			              </div>
			              <div class="form-group">
			                <label for="title">이벤트 제목:</label>
			                <input type="text" class="form-control" id="title" name="title" placeholder="이벤트 제목을 입력하세요.">
			              </div>
			              <div class="form-group">
			                <label for="content">이벤트 내용:</label>
			                <input type="text" class="form-control" id="content" name="content" placeholder="이벤트 내용을 입력하세요.">
			              </div>
			            </form>
			
					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group" aria-label="group button">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
							</div>
							<div class="btn-group btn-delete hidden" role="group">
								<button type="button" id="delImage" class="btn btn-default btn-hover-red" data-dismiss="modal"  role="button">Delete</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
							</div>
						</div>
					</div>
				</div>
			  </div>
			</div>
			
		</div>
		<%-- 메인 끝 --%>

		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
</body>
</html>