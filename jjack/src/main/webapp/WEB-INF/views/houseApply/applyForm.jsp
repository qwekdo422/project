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
<link rel='stylesheet prefetch' href='../css/houseApply/magnific-popup.css'>
<link rel="stylesheet" href="../css/houseApply/calendar.css" />

<%-- 입소신청 폼 --%>
<link rel="stylesheet" href="../css/houseApply/applyForm.css" />
<script type="text/javascript">
var tEvent = ${CALENDAR};
</script>
</head>

<body style="margin: 0 auto;">
		
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		
		<div class="container">
			<%-- ================ 달력 =============== --%>
			<%-- <jsp:include page="./calendar.jsp" /> --%>
			<div id='calendar'></div>
				<script src='../js/houseApply/moment.min.js'></script>
				<script src='../js/houseApply/fullcalendar-2.1.1.js'></script>
				<script src='../js/houseApply/fullcalendar.min.js'></script>
				<script src='../js/houseApply/jquery.magnific-popup.min.js'></script>
				<script src="../js/houseApply/calendar.js"></script>
			<%-- ================ 달력  =============== --%>
			
			
			<%-- ================ 입소신청 =============== --%>
			<div class="">
						<div class="form-group">
					    	<label for="name">이름:</label>
					    	<input type="text" class="form-control" name="name" value="홍길동" readonly="readonly">
					  	</div>
					  	<div class="form-group">
					    	<label for="age">나이:</label>
					    	<input type="text" class="form-control" name="age" value="99" readonly="readonly">
					 	</div>
					  	<div class="form-group">
					    	<label for="addr">거주지:</label>
					    	<input type="text" class="form-control" name="addr">
					 	</div>
						<div class="form-group">
							<label for="sel1">관심사:</label> 
							<select class="form-control" id="sel1">
								<option>== 선택하세요 ==</option>
								<option>사진</option>
								<option>바다</option>
								<option>절경</option>
								<option>올레길</option>
							</select>
						</div>
					  	<div class="form-group">
					    	<label for="inDay">입소일:</label>
					    	<input type="text" class="form-control" name="inDay">
					 	</div>
					</div>
			<%-- ================ 입소신청 =============== --%>
		</div>


		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
</body>
</html>