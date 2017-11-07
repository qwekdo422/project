<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청</title>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/common/mainBody.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%-- 캘린더  --%>
<link rel="stylesheet" href="../css/houseApply/calendar.css" />
<%-- 입서신청 폼 --%>
<link rel="stylesheet" href="../css/houseApply/applyForm.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script>
	$(document).ready(function(){
		$("#calendar-month-next").click(function(){
			alert(1);
		});
		
		
	});
</script>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>

		<div id="main">
			<jsp:include page="./calendar.jsp" />
			
			<div class="" style="margin: 0 auto;">
				<div class="row">
					<div class="col-md-4">
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
				</div>
			</div>

		</div>


		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>