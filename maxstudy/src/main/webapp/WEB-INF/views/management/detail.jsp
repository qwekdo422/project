<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원교육관리</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../js/management/management.js"></script>
</head>
<body>
	<div class="container">
		<div class="m_no" data-no="${vo.m_no}">
			<b>직원교육상세관리(${vo.m_name})</b>
		</div>
		<table class="table">
			<tr>
				<td>순번</td>
				<td>이름</td>
				<td>일자</td>
				<td>요일</td>
				<td>교육내용</td>
				<td>평가</td>
				<td>비고</td>
			</tr>
			<c:forEach var="data" items="${list}" varStatus="st">
			<tr>
				<td class="m_cnt">${st.count}</td>
				<td class="s_name">${data.s_name}</td>
				<td class="s_date">${data.s_date}</td>
				<td class="s_day">${data.s_day}</td>
				<td class="s_content">${data.s_content}</td>
				<td class="s_evaluation">${data.s_evaluation}</td>
				<td class="s_comment">${data.s_comment}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="7" align="right">
					<input type="button" class="btn btn-default" onclick="location.href='list.do'" value="목록">
					<input type="button" class="btn btn-default detailUpdateBtn" value="수정">
				</td>
			</tr>			
		</table>
	</div>
</body>
</html>