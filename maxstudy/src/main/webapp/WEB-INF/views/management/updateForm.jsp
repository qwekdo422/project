<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
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
		<div><b>직원교육상세관리(${vo.m_name})</b></div>
		<table class="table listTB">
			<tr>
				<td><input type="checkbox" class="ch_all"></td>
				<td>이름</td>
				<td>일자</td>
				<td>요일</td>
				<td>교육내용</td>
				<td>평가</td>
				<td>비고</td>
			</tr>
			<c:forEach var="data" items="${list}" varStatus="st">
			<tr>
				<td>
					<input type="hidden" class="s_no" name="s_no" value="${data.s_no}">
					<input type="checkbox" class="ch_box" name="ch_box">
				</td>
				<td><input type="text" class="s_name" name="s_name" value="${data.s_name}"></td>
				<td><input type="date" class="s_date" name="s_date" value="${data.s_date}"></td>
				<td><input type="text" class="s_day" name="s_day" value="${data.s_day}"></td>
				<td><input type="text" class="s_content" name="s_content" value="${data.s_content}"></td>
				<td>
					<select class="s_evaluation" name="s_evaluation">
						<option value="잘함" <c:if test="${data.s_evaluation eq '잘함'}">selected</c:if>>잘함
						<option value="적절함" <c:if test="${data.s_evaluation eq '적절함'}">selected</c:if>>적절함
						<option value="조금만더" <c:if test="${data.s_evaluation eq '조금만더'}">selected</c:if>>조금만더
						<option value="노력요함" <c:if test="${data.s_evaluation eq '노력요함'}">selected</c:if>>노력요함
					</select>
				</td>
				<td><input type="text" class="s_comment" name="s_comment" value="${data.s_comment}"></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="9" align="right">
					<input type="button" class="btn btn-default updateAddBtn" value="추가">
					<input type="button" class="btn btn-default" onclick="location.href='detail.do?m_no=${vo.m_no}' " value="취소">
					<input type="button" class="btn btn-default updateSaveBtn" value="저장">
					<input type="button" class="btn btn-default updateDelteBtn" value="삭제">
				</td>
			</tr>			
		</table>
		
		<form id="detailUpdateFrm" method="post">
			<input type="hidden" name="m_no" value="${vo.m_no}">
			<table class="updateTB" style="display: none;"></table>		
		</form>
		<!-- 복사용 테이블 -->
		<table class="cloneTB" style="display: none;">
			<tr>
				<td>
					<input type="hidden" class="s_no" name="s_no" value=0>
					<input type="checkbox" class="ch_box" name="ch_box">
				</td>
				<td><input type="text" class="s_name" name="s_name" value="${vo.m_name}"></td>
				<td><input type="date" class="s_date" name="s_date" ></td>
				<td><input type="text" class="s_day" name="s_day" ></td>
				<td><input type="text" class="s_content" name="s_content" ></td>
				<td>
					<select class="s_evaluation" name="s_evaluation">
						<option value="잘함">잘함
						<option value="적절함">적절함
						<option value="조금만더">조금만더
						<option value="노력요함">노력요함
					</select>
				</td>
				<td>
					<input type="text" class="s_comment" name="s_comment" >
				</td>
			</tr>
		</table>
	</div>
</body>
</html>