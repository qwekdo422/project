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
<script>
	var mail = "${mail}";
	var manCount = ${numbers.manCount};
	var womanCount = ${numbers.womanCount};
</script>
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
					<c:if test="${edate eq op.evdate}">
						<script>
							$(document).ready(function(){
								$(".gisoo").val(${op.gisoo});
							});
						</script>
					</c:if>
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
						<c:forEach var="wait" items="${wait}" varStatus="vs">
							<tr>
								<td>${vs.count}</td>
								<td>${wait.id}</td>
								<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../file/${wait.pic}' />">${wait.name}</a></td>
								<td><c:if test="${wait.sex eq 'M'}">남자</c:if><c:if test="${wait.sex eq 'F'}">여자</c:if></td>
								<td>${wait.age}</td>
								<td>${wait.loc}</td>
								<td>${wait.interest}</td>
								<td>
									<c:set var = "adate1" value="${wait.adate}" />
									<c:set var = "adate2" value="${fn:substring(adate1, 5, 16)}" />${adate2}
								</td>
								<td>${wait.acount}</td>
								<td>${wait.gcount}</td>
								<td>
									<form method="POST" action="../applicantList/changeCond.do">
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${wait.ano}">
										<input type="hidden" name="nextStep" value="" class="ns">
										<input type="button" class="btn btn-success btn-sm comeBtn${wait.sex}" value="승인">
										<input type="button" class="btn btn-danger btn-sm denyBtn ml-2" value="거부">
									</form>
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
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../file/${m.pic}' />">
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
									<form method="POST" action="../applicantList/mailing.do">
										연락예정&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${m.ano}">
										<input type="hidden" name="name" value="${m.name}">
										<input type="hidden" name="email" value="${m.email}">
										<input type="hidden" name="evdate" value="${m.evdate}">
										<input type="hidden" name="gisoo" class="gisoo">
										<input type="hidden" name="thisStep" value="${m.thisStep}" class="ts">
										<input type="hidden" name="nextStep" value="1" class="ns">
										<input type="submit" class="btn btn-success btn-sm" value="메일발송">
										<input type="button" class="btn btn-danger btn-sm ml-2 toWaitBtn" value="승인취소">
									</form>
								</c:if>
								<%-- 입금대기. 입금확인시 nextStep=4--%>
								<c:if test="${m.thisStep eq 3}">
									<form method="POST" action="../applicantList/changeCond.do">
										입금대기&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${m.ano}">
										<input type="hidden" name="nextStep" value="" class="ns">
										<input type="button" class="btn btn-warning btn-sm moneyOkBtn" value="입금확인">
										<input type="button" class="btn btn-info btn-sm cancelBtn ml-2" value="취소">
									</form>
								</c:if>
								<%-- 입금확인. 입소시 입소 쿼리 돌리고 nextStep=8 --%>
								<c:if test="${m.thisStep eq 4}">
									<form method="POST" action="../applicantList/newGuest.do">
										입금확인&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${m.ano}">
										<input type="hidden" name="evdate" value="${m.evdate}">
										<input type="hidden" name="sex" value="M">
										<input type="hidden" name="nextStep" value="7" class="ns">
										<input type="submit" class="btn btn-primary btn-sm newGuest" value="입소">
										<input type="button" class="btn btn-info btn-sm cancelBtn ml-2" value="취소">
									</form>
								</c:if>
								<%-- 입소 상태. 퇴소시 nextStep=9 --%>
								<c:if test="${m.thisStep eq 8}">
									<form method="POST" action="../applicantList/changeCond.do">
										입소&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${m.ano}">
										<input type="hidden" name="nextStep" value="9">
										<input type="submit" class="btn btn-dark btn-sm" value="퇴소">
									 </form>
								</c:if>
								<%-- 퇴소 상태. 후기 안씀 --%>
								<c:if test="${m.thisStep eq 9}">퇴소 (후기 미작성)</c:if>
								<%-- 퇴소 상태. 후기 씀 --%>
								<c:if test="${m.thisStep eq 10}">퇴소 (후기 작성완료)</c:if>
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
							<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../file/${w.pic}' />">
								<c:if test="${!empty w.nick}">${w.nick}(${w.name})</c:if><c:if test="${empty w.nick}">${w.name}</c:if></a>
							</td>
							<td>${w.age}</td>
							<td>${w.tel}</td>
							<td>${w.interest}</td>
							<td>${w.acount}</td>
							<td>${w.gcount}</td>
							<td>
								<%-- 입소승인. 승인취소시 nextStep=1 --%>
								<c:if test="${w.thisStep eq 2}">
									<form method="POST" action="../applicantList/mailing.do">
										연락예정&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${w.ano}">
										<input type="hidden" name="name" value="${w.name}">
										<input type="hidden" name="email" value="${w.email}">
										<input type="hidden" name="evdate" value="${w.evdate}">
										<input type="hidden" name="gisoo" class="gisoo">
										<input type="hidden" name="thisStep" value="${w.thisStep}" class="ts">
										<input type="hidden" name="nextStep" value="1" class="ns">
										<input type="submit" class="btn btn-success btn-sm" value="메일발송">
										<input type="button" class="btn btn-danger btn-sm ml-2 toWaitBtn" value="승인취소">
									</form>
								</c:if>
								<%-- 입금대기. 입금확인시 nextStep=4--%>
								<c:if test="${w.thisStep eq 3}">
									<form method="POST" action="../applicantList/changeCond.do">
										입금대기&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${w.ano}">
										<input type="hidden" name="nextStep" value="" class="ns">
										<input type="button" class="btn btn-warning btn-sm moneyOkBtn" value="입금확인">
										<input type="button" class="btn btn-info btn-sm ml-2 cancelBtn" value="취소">
									</form>
								</c:if>
								<%-- 입금확인. 입소시 입소 쿼리 돌리고 nextStep=8 --%>
								<c:if test="${w.thisStep eq 4}">
									<form method="POST" action="../applicantList/newGuest.do">
										입금확인&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${w.ano}">
										<input type="hidden" name="evdate" value="${w.evdate}">
										<input type="hidden" name="sex" value="F">
										<input type="hidden" name="nextStep" value="7" class="ns">
										<input type="submit" class="btn btn-primary btn-sm newGuest" value="입소">
										<input type="button" class="btn btn-info btn-sm ml-2 cancelBtn" value="취소">
									</form>
								</c:if>
								<%-- 입소 상태. 퇴소시 nextStep=9 --%>
								<c:if test="${w.thisStep eq 8}">
									<form method="POST" action="../applicantList/changeCond.do">
										입소&nbsp;&nbsp;
										<input type="hidden" name="edate" value="${edate}">
										<input type="hidden" name="ano" value="${w.ano}">
										<input type="hidden" name="nextStep" value="9">
										<input type="submit" class="btn btn-dark btn-sm" value="퇴소">
									 </form>
								</c:if>
								<%-- 퇴소 상태. 후기 안씀 --%>
								<c:if test="${w.thisStep eq 9}">퇴소 (후기 미작성)</c:if>
								<%-- 퇴소 상태. 후기 씀 --%>
								<c:if test="${w.thisStep eq 10}">퇴소 (후기 작성완료)</c:if>
							</td>
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
						<c:if test="${d.thisStep eq 5 or d.thisStep eq 6}">
							<tr>
								<td>-</td>
								<td>${d.id}</td>
								<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../file/${d.pic}' />">${d.name}</a></td>
								<td><c:if test="${d.sex eq 'M'}">남자</c:if><c:if test="${d.sex eq 'F'}">여자</c:if></td>
								<td>${d.age}</td>
								<td>${d.tel}</td>
								<td>${d.acount}</td>
								<td>${d.gcount}</td>
								<td>
									<%-- 입소거부. 메일발송시 nextStep=6--%>
									<c:if test="${d.thisStep eq 5}">
										<form method="POST" action="../applicantList/mailing.do">
											연락예정&nbsp;&nbsp; 
											<input type="hidden" name="edate" value="${edate}">
											<input type="hidden" name="ano" value="${d.ano}">
											<input type="hidden" name="name" value="${d.name}">
											<input type="hidden" name="email" value="${d.email}">
											<input type="hidden" name="thisStep" value="${d.thisStep}" class="ts">
											<input type="hidden" name="nextStep" value="1" class="ns">
											<input type="submit" class="btn btn-success btn-sm" value="메일발송">
											<input type="button" class="btn btn-danger  btn-sm ml-2 toWaitBtn" value="거부취소">
										</form>
									</c:if>
									<%-- 입소거부 안내메일 발송완료--%>
									<c:if test="${d.thisStep eq 6}">
										<form method="POST" action="../applicantList/changeCond.do">
											거부안내 완료&nbsp;&nbsp; 
											<input type="hidden" name="edate" value="${edate}">
											<input type="hidden" name="ano" value="${d.ano}">
											<input type="hidden" name="nextStep" value="3">
											<input type="button" class="btn btn-warning  btn-sm toOk${d.sex}Btn" value="추가합격">
										</form>
									</c:if>
								</td>
							</tr>
						</c:if>
					</c:forEach>
					<c:forEach var="d" items="${denied}" varStatus="vs">
						<c:if test="${d.thisStep eq 7}">
							<tr>
								<td>-</td>
								<td>${d.id}</td>
								<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../file/${d.pic}' />">${d.name}</a></td>
								<td><c:if test="${d.sex eq 'M'}">남자</c:if><c:if test="${d.sex eq 'F'}">여자</c:if></td>
								<td>${d.age}</td>
								<td>${d.tel}</td>
								<td>${d.acount}</td>
								<td>${d.gcount}</td>
								<td>취소</td>
							</tr>
						</c:if>
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