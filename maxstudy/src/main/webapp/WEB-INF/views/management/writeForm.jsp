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
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<script src="../js/management/management.js"></script>
</head>
<body>
	<div class="container">
		<div><b>직원교육관리 등록</b></div>
		<form id="writeFrm" method="post">
		<table class="table writeTB">
			<tr>
				<td width="15%">이름</td>
				<td colspan="2">교육기간</td>
				<td width="25%">교육과정</td>
				<td width="15%">평가</td>
				<td width="15%">합격여부</td>
			</tr>
			<tr>
				<td><input type="text" class="m_name form-control" name="m_name"> </td>
				<td width="15%">
					<input type="text" class="m_startdate form-control datepicker" name="m_startdate" placeholder="시작일">
				</td>
				<td width="15%">
					<input type="text" class="m_enddate form-control datepicker" name="m_enddate"placeholder="종료일">
				</td>
				<td><input type="text" class="m_title form-control" name="m_title"></td>
				<td>
					<select name="m_evaluation" class="m_evaluation form-control">
						<option value="잘함">잘함
						<option value="적절함">적절함
						<option value="조금만더">조금만더
						<option value="노력요함">노력요함
					</select>
				</td>
				<td>
					<select name="m_status" class="m_status form-control">
						<option value="합격">합격
						<option value="진행중">진행중
						<option value="불합격">불합격
					</select>
				</td>
			</tr>
		</table>
		
		<div><b>상세정보</b></div>
		<table class="table writeDetailTB">
			<tr>
				<td width="15%">일자</td>
				<td width="10%">요일</td>
				<td>교육내용</td>
				<td>평가</td>
				<td>비고</td>
			</tr>
			<tr>
				<td>
					<input type="text" class="s_date form-control datepicker" name="detailList[0].s_date">
				</td>
				<td>
					<input type="text" class="s_day form-control" name="detailList[0].s_day">
				</td>
				<td><input type="text" class="s_content form-control" name="detailList[0].s_content"></td>
				<td>
					<select name="detailList[0].s_evaluation" class="s_evaluation form-control">
						<option value="잘함">잘함
						<option value="적절함">적절함
						<option value="조금만더">조금만더
						<option value="노력요함">노력요함
					</select>
				</td>
				<td>
					<input type="text" class="s_comment form-control" name="detailList[0].s_comment">
				</td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					<input type="button" class="btn btn-default writeAddBtn" value="추가">
					<input type="button" class="btn btn-default writeBtn" value="등록">
				</td>
			</tr>
		</table>
		</form>
		
		<!-- 복사용 테이블 -->
		<table class="table writeCloneTB" style="display:none;">
			<tr>
				<td>
					<input type="text" class="s_date form-control datepicker" name="s_date">
				</td>
				<td>
					<input type="text" class="s_day form-control" name="s_day">
				</td>
				<td><input type="text" class="s_content form-control" name="s_content"></td>
				<td>
					<select name="s_evaluation" class="s_evaluation form-control">
						<option value="잘함">잘함
						<option value="적절함">적절함
						<option value="조금만더">조금만더
						<option value="노력요함">노력요함
					</select>
				</td>
				<td>
					<input type="text" class="s_comment form-control" name="s_comment">
				</td>
			</tr>
		</table>
	</div>	
</body>
</html>