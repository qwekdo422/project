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

<%-- 일정관리  --%>
<link rel='stylesheet prefetch' href='../css/houseApply/fullcalendar.css'>
<link rel="stylesheet" href="../css/scheduler/scheduler.css" />
<script src="../js/scheduler/scheduler.js"></script>

<script type="text/javascript">
//	행사일정들(json형태)
var schedule = ${SCHEDULE};
//	관리자, 사용자 (상태여부)
var status = "${status}";
</script>
</head>

<body style="margin: 0 auto;">
		
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		<div class="container mt-4 mb-4">
			<%-- 관리자, 사용자 여부(관리자: ADMIN, 사용자: USER)  --%>
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
					<form method="post" id="scheduleFrm" action="">
					<div class="modal-body">
			            <!-- content goes here -->
			              <div class="form-group">
			                <label for="gisoo">기수:</label>
			                <input type="text" class="form-control" id="gisoo" name="gisoo" placeholder="ex) 100 only Number">
			              </div>
			              <div class="form-group">
			                <label for="eventdate">이벤트 시작일:</label>
			                <input type="text" class="form-control" id="eventdate" name="eventdate" readonly="readonly">
			              </div>
			              <div class="form-group">
			                <label for="eventend">이벤트 종료일:</label>
			                <input type="date" class="form-control" id="eventend" name="eventend">
			              </div>
			              <div class="form-group">
			                <label for="loc">대상 거주지역:</label>
			                <input type="text" class="form-control" id="loc" name="loc" placeholder="ex) 서울">
			              </div>
			              <div class="form-group">
			                <label for="age">대상 연령대:</label>
			                <input type="text" class="form-control" id="age" name="age" placeholder="ex) 20대">
			              </div>
			              <div class="form-group">
			                <label for="title">이벤트 제목:</label>
			                <input type="text" class="form-control" id="title" name="title" placeholder="ex) 20대  모임">
			              </div>
			              <div class="form-group">
			                <label for="contents">이벤트 내용:</label>
			                <input type="text" class="form-control" id="contents" name="contents" placeholder="ex) 20대 를 불태웁시다.">
			              </div>
					</div>
					<div class="modal-footer">
						<input type="button" id="wBtn" class="btn btn-info"  value="등록">
						<input type="button" id="mBtn" class="btn btn-info" value="수정">
						<input type="button" id="dBtn" class="btn btn-info" value="삭제">
						<input type="button" id="xBtn" class="btn btn-info" data-dismiss="modal" value="닫기">
					</div>
			        </form>
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