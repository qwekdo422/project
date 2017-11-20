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
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//	행사일정들(json형태)
var schedule = ${SCHEDULE};
var status = "${status}";
</script>
</head>

<body style="margin: 0 auto;">
		
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		<div class="container mt-4 lDiv">
			<%-- 관리자, 사용자 여부(관리자: ADMIN, 사용자: USER)  --%>
			<div class="row">
			<%-- ================ 달력 =============== --%>
				<div class="col-md-8">
					<div id='calendar'></div>
					<script src='../js/houseApply/moment.min.js'></script>
					<script src='../js/houseApply/fullcalendar.min.js'></script>
					<br>
					<%-- 행사일정 상세정보 입소신청자만 보인다. --%>
					<c:if test="${status eq 'USER'}">
					<div class="container" style="padding: 0 0;">
						<table class="table table-bordered" id="eventView">
							<tr>
								<th>기수</th>
								<td class="gisoo"></td>
								<th>행사 기간</th>
								<td class="eventDay"></td>
							</tr>
							<tr>
								<th>대상지역</th>
								<td class="loc"></td>
								<th>대상 연령대</th>
								<td class="age"></td>
							</tr>
							<tr>
								<th>행사 제목</th>
								<td class="title" colspan="4"></td>
							</tr>
							<tr>
								<th>행사 내용</th>
								<td class="contents" colspan="4"></td>
							</tr>
						</table>
					</div>
					</c:if>
				</div>
				
			<%-- ================ 달력  =============== --%>
			
			<%-- ================ 입소신청 =============== --%>
				<div class="col-md-4 rDiv">
				<form method="post" id="applyFrm" action="" enctype="multipart/form-data">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
						    	<input type="file" name="imageUpload" id="imageUpload" style="display: none;"/> 
								<label for="imageUpload" class="btn btn-info">사진등록</label>
							</div> 
							<div class="col-md-12">
								<img src="../img/houseApply/basic.jpg" id="imagePreview" alt="Preview Image" width="180px" height="180px;"/>
								<label>이미지사진을 1:1 비율로 등록해주세요.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
				    	<label for="name">이름:</label>
				    	<input type="text" class="form-control" name="name" value="홍길동" readonly="readonly">
				  	</div>
				  	<div class="form-group">
				    	<label for="age">나이:</label>
				    	<input type="text" class="form-control" name="age" value="99" readonly="readonly">
				 	</div>
				  	<div class="form-group">
				    	<label for="tel">연락처:</label>
				    	<input type="text" class="form-control" name="tel">
				 	</div>
				  	<div class="form-group">
				    	<label for="addr">거주지:</label>
				    	<input type="text" class="form-control" name="addr">
				 	</div>
					<div class="form-group">
						<label for="interest">관심사:</label> 
						<select class="form-control" id="interest">
							<option value="">== 선택하세요 ==</option>
							<option value="사진">사진</option>
							<option value="바다">바다</option>
							<option value="절경">절경</option>
							<option value="올레길">올레길</option>
						</select>
					</div>
				  	<div class="form-group">
				    	<label for="inDay">입소일:</label>
				    	<input type="text" id="inDay" class="form-control" name="inDay">
				 	</div>
				 	<label class="btn btn-info applyBtn">입소신청</label>
				</form>
				</div>
			<%-- ================ 입소신청 =============== --%>
			</div>
			<%-- row 끝 --%>
			
			
		</div>
		<%-- 메인 끝 --%>

		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
</body>
</html>