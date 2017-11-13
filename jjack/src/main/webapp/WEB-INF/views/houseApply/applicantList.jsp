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
	<script src="../js/main/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(){
			/* 
			$("a[data-toggle='tooltip']").tooltip({
			    animated: 'fade',
			    placement: 'left',
			    html:true;
			});
			 */
			$('[data-toggle="tooltip"]').tooltip();
			 
		});
	</script>
</head>
<body style="margin:0 auto;">
	<div id="header">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div class="container">
		<h2 class="mt-4">입소신청자 관리</h2>
		<select class="form-control">
			<!-- 임시. 동적으로 바꿀 부분 -->
			<option value="">2017/11/11 : 100기</option>
			<option value="">2017/11/4 : 99기</option>
			<option value="">2017/10/28 : 98기</option>
			<option value="">2017/10/21 : 97기</option>
			<option value="">2017/10/14 : 96기</option>
			<option value="">2017/10/7 : 95기</option>
			<option value="">2017/9/30 : 94기</option>
		</select>
		<hr>
		<div class="container">
		<button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
  Tooltip on top
</button>
<button type="button" class="btn btn-secondary">Tooltip on top</button>
			<h3>승인대기자(3)</h3>
			<table class="table table-striped table-hover table-bordered">
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
					<!-- 임시. 동적으로 바꿀 부분 -->
					<tr>
						<td>1</td>
						<td>aaa</td>
						<td>김김김</td>
						<td>남자</td>
						<td>33</td>
						<td>수도권</td>
						<td>바다</td>
						<td>2017/11/03</td>
						<td>1</td>
						<td>0</td>
						<td><button class="btn btn-success btn-sm">승인</button><button class="btn btn-danger  btn-sm ml-2">거부</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>bbb</td>
						<td>이이이</td>
						<td>여자</td>
						<td>25</td>
						<td>수도권</td>
						<td>바다</td>
						<td>2017/11/03</td>
						<td>1</td>
						<td>0</td>
						<td><button class="btn btn-success btn-sm">승인</button><button class="btn btn-danger  btn-sm ml-2">거부</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>ccc</td>
						<td>박박박</td>
						<td>여자</td>
						<td>26</td>
						<td>수도권</td>
						<td>바다</td>
						<td>2017/11/03</td>
						<td>1</td>
						<td>0</td>
						<td><button class="btn btn-success btn-sm">승인</button><button class="btn btn-danger  btn-sm ml-2">거부</button></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<h3>입소 승인 (남자 : 3)</h3>
			<table class="table table-striped table-hover table-bordered mb-4">
				<thead>
					<tr>
						<th>호칭</th>
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
					<tr>
						<td>1호</td>
						<td>qwedao1111</td>
						<td><a data-toggle="tooltip" rel="tooltip" data-html="true" title="<img src='../img/guests/dao.jpg' />">김대오</a></td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
					<tr>
						<td>2호</td>
						<td>qwedao1111</td>
						<td>김대륙</td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
					<tr>
						<td>3호</td>
						<td>qwedao1111</td>
						<td>김대칠</td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
				</tbody>
			</table>
			<h3>입소 승인 (여자 : 3)</h3>
			<table class="table table-striped table-hover table-bordered mb-4">
				<thead>
					<tr>
						<th>호칭</th>
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
					<tr>
						<td>1호</td>
						<td>qwedao1111</td>
						<td>김대순</td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
					<tr>
						<td>2호</td>
						<td>qwedao1111</td>
						<td>김중순</td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
					<tr>
						<td>3호</td>
						<td>qwedao1111</td>
						<td>김소순</td>
						<td>31</td>
						<td>010-1234-5678</td>
						<td>바다</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">승인취소</button></td>
					</tr>
				</tbody>
			</table>
			<hr>
			<h3>입소 거부(3)</h3>
			<table class="table table-striped table-hover table-bordered mb-4">
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
					<tr>
						<td>1</td>
						<td>qwedao1111</td>
						<td>김대팔</td>
						<td>31</td>
						<td>남자</td>
						<td>010-1234-5678</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>qwedao1111</td>
						<td>김대구</td>
						<td>31</td>
						<td>남자</td>
						<td>010-1234-5678</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>qwedao1111</td>
						<td>김초순</td>
						<td>31</td>
						<td>여자</td>
						<td>010-1234-5678</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button></td>
					</tr>
					<tr>
						<td>4</td>
						<td>qwedao1111</td>
						<td>김하순</td>
						<td>31</td>
						<td>여자</td>
						<td>010-1234-5678</td>
						<td>10</td>
						<td>5</td>
						<td>연락예정&nbsp;&nbsp; <button class="btn btn-success btn-sm">메일발송</button><button class="btn btn-danger  btn-sm ml-2">거부취소</button></td>
					</tr>
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