<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<h2 class="mt-4">입소신청자 관리</h2><button id="comeBtn" class="btn">이건되나</button>
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
				<h3>승인대기자(${numbers.waitCount})</h3>	<%-- 이거 구할필요 없이 그냥 fn:length 쓰자 --%>
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
						<c:forEach var="wait" items="${wait}" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${wait.id}</td>
								<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${wait.pic}' />">${wait.name}</a></td>
								<td><c:if test="${wait.sex eq 'M'}">남자</c:if><c:if test="${wait.sex eq 'F'}">여자</c:if></td>
								<td>${wait.age}</td>
								<td>${wait.loc}</td>
								<td>${wait.interest}</td>
								<td>
								<c:set var = "adate1" value="${wait.adate}" />
								<c:set var = "adate2" value="${fn:substring(adate1, 5, 16)}" />${adate2}</td>
								<td>${wait.acount}</td>
								<td>${wait.gcount}</td>
								<td>
									<form method="POST" action="../applicantList/changeCond.do">
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${wait.ano}">
										<input type="hidden" name="nextStep" value="">	<%-- 승인버튼이면 2, 거부면 5 --%>
									</form>
									<button class="btn btn-success btn-sm comeBtn" class="comeBtn${wait.sex}">승인</button>
									<button class="denyBtn btn btn-danger btn-sm ml-2" class="denyBtn">거부</button>
								</td>
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
					<c:forEach var="m" items="${okMan}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${m.id}</td>
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${m.pic}' />">
								<c:if test="${!empty m.nick}">${m.nick}(${m.name})</c:if><c:if test="${empty m.nick}">${m.name}</c:if></a>
							</td>
							<td>${m.age}</td>
							<td>${m.tel}</td>
							<td>${m.interest}</td>
							<td>${m.acount}</td>
							<td>${m.gcount}</td>
							<td>
								<%-- 입소승인. 승인취소시 nextStep=1 --%>
								<c:if test="${m.thisStep eq 2}">
									연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button>
								</c:if>
								<%-- 입금대기. 입금확인시 nextStep=4--%>
								<c:if test="${m.thisStep eq 3}">
									입금대기&nbsp;&nbsp; <button class="btn btn-info btn-sm">입금확인</button>
								</c:if>
								<%-- 입금확인. 입소시 입소 쿼리 돌리고 nextStep=8 --%>
								<c:if test="${m.thisStep eq 4}">
									입금확인&nbsp;&nbsp; <button class="btn btn-warning btn-sm">입소확인</button>
								</c:if>
								<%-- 입소 상태. 퇴소시 nextStep=9 --%>
								<c:if test="${m.thisStep eq 8}">
									입소&nbsp;&nbsp; <button class="btn btn-warning btn-sm">퇴소</button>
								</c:if>
<%-- 처리 다 되면 여자에도 복사 --%>
							</td>
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
					<c:forEach var="w" items="${okWoman}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${w.id}</td>
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/${w.pic}' />">
								<c:if test="${!empty w.nick}">${w.nick}(${m.name})</c:if><c:if test="${empty w.nick}">${w.name}</c:if></a>
							</td>
							<td>${w.age}</td>
							<td>${w.tel}</td>
							<td>${w.interest}</td>
							<td>${w.acount}</td>
							<td>${w.gcount}</td>
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
							<td>
								<%-- 입소거부. 메일발송시 nextStep=6--%>
								<c:if test="${m.thisStep eq 5}">
									연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button>
								</c:if>
								<%-- 입소거부 안내메일 발송완료--%>
								<%-- 추가합격시 입소대기상태로 --%>
								<c:if test="${m.thisStep eq 6}">거부안내 완료 <button class="btn btn-danger  btn-sm ml-2">추가합격</button></c:if>
								<%-- 취소 --%>
								<c:if test="${m.thisStep eq 7}">취소</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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