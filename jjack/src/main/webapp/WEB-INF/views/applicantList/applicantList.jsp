<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청자 관리</title>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/applicantList/applicantList.css" />
<script src="../js/applicantList/applicantList.js"></script>
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<h2 class="mt-4">입소신청자 관리</h2>
		<form id="edateFrm" method="GET" action="../applicantList/ManageList.do">
			<select class="form-control" name="edate" id="edate">
				<c:forEach var="op" items="${elist}">
					<option value="${op.evdate}" <c:if test="${edate eq op.evdate}">selected</c:if>>${op.evdate} : ${op.gisoo}기</option>
				</c:forEach>
			</select>
		</form>
		<hr>
		<div class="container">
			<c:if test="${numbers.waitCount ne 0}">
				<h3>승인대기자(${numbers.waitCount})</h3>
				<table class="table table-striped table-hover table-bordered mb-4">
					<thead>
						<tr>
							<th>#</th>
							<th>ID</th>
							<th>이름</th>
							<th>성별</th>
							<th>나이</th>
							<th>거주지</th>
							<th>관심사</th>
							<th>신청일</th>
							<th>신청횟수</th>
							<th>입소횟수</th>
							<th>승인결정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="w" items="${wait}" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${w.id}</td>
								<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${w.pic}' />">${w.name}</a></td>
								<td><c:if test="${w.sex eq 'M'}">남자</c:if><c:if test="${w.sex eq 'F'}">여자</c:if></td>
								<td>${w.age}</td>
								<td>${w.loc}</td>
								<td>${w.interest}</td>
								<td>${w.adate}</td>
								<td>${w.acount}</td>
								<td>${w.gcount}</td>
								<td><button class="btn btn-success btn-sm">승인</button><button class="btn btn-danger  btn-sm ml-2">거부</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</c:if>
			<h3>입소 승인 (남자 : ${numbers.manCount})</h3>
			<table class="table table-striped table-hover table-bordered mb-4">
				<thead>
					<tr>
						<th>#</th>
						<th>ID</th>
						<th>이름</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>관심사</th>
						<th>신청횟수</th>
						<th>입소횟수</th>
						<th>승인상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="om" items="${okMan}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${om.id}</td>
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${om.pic}' />">${om.name}</a></td>
							<td>${om.age}</td>
							<td>${om.tel}</td>
							<td>${om.interest}</td>
							<td>${om.acount}</td>
							<td>${om.gcount}</td>
							<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
						</tr>
					</c:forEach>
			</table>
			<h3>입소 승인 (여자 : ${numbers.womanCount})</h3>
			<table class="table table-striped table-hover table-bordered mb-4">
				<thead>
					<tr>
						<th>#</th>
						<th>ID</th>
						<th>이름</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>관심사</th>
						<th>신청횟수</th>
						<th>입소횟수</th>
						<th>승인상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ow" items="${okWoman}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${ow.id}</td>
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${ow.pic}' />">${ow.name}</a></td>
							<td>${ow.age}</td>
							<td>${ow.tel}</td>
							<td>${ow.interest}</td>
							<td>${ow.acount}</td>
							<td>${ow.gcount}</td>
							<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr>
			<h3>입소 거부(${numbers.deniedCount})</h3>
			<table class="table table-striped table-hover table-bordered mb-5">
				<thead>
					<tr>
						<th>#</th>
						<th>ID</th>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>신청횟수</th>
						<th>입소횟수</th>
						<th>거부상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${denied}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${d.id}</td>
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${d.pic}' />">${name}</a></td>
							<td>${d.age}</td>
							<td><c:if test="${d.sex eq 'M'}">남자</c:if><c:if test="${d.sex eq 'F'}">여자</c:if></td>
							<td>${d.tel}</td>
							<td>${d.acount}</td>
							<td>${d.gcount}</td>
							<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form id="sttsFrm" method="POST" action="../../applicantList/.do">
				<input type="hidden" id="ano" name="ano" value="">
				<input type="hidden" id="nextProcess" name="nextProcess" value="">
			</form>
		</div>
		<!--  /.container -->
	</div>
	<!--  /.container -->
	<!---------------------------------------------->
	<div id="footer">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>