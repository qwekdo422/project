<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
</head>
<script src="../js/MyPage/MyPage.js"></script>

<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		<div id="main">
				<form method="post" action="../Login/modifyProc.do" id="Mfrm">
			<table width="800" align="center" border="1">
			<tr>
					<td>아이디 :</td>
					<td> <input type="text"  name="id"  id="id" value="${PVO.id }" readOnly>
			</tr>
			
			<tr>
					<td>이름 변경</td><td><input type="text" name="name" id="name" value="${PVO.name}" ></td>
			</tr>
			<tr>
				<td rowspan="3">비밀번호 변경 </td><td><input type="password" name="pw" id="pw" placeholder="사용중인 비밀번호"></td>
			</tr>
			<tr><td><input type="password" name="pw" id="pw" placeholder="새 비밀번호"></td></tr>
			<tr><td><input type="password" name="pw" id="pw" placeholder="새 비밀번호 확인"></td></tr>
			<tr>
					<td>성별 :</td> 
					<td>
					<c:if test="${PVO.sex eq  'M'}">
					<input type="radio" id="sex" name="sex" value="M"  checked="checked">남자
					<input type="radio" id="sex"name="sex" value="F" >여자
					</c:if>
					<c:if test="${PVO.sex eq  'F'}">
					<input type="radio" id="sex" name="sex" value="M" >남자
					<input type="radio" id="sex"name="sex" value="F"  checked="checked">여자
					</c:if>
					
					</td>
			</tr>
			<tr>
					<td>생일 : </td><td><input type="text" name="birth" id="birth"  placeholder="YYYY-MM-DD" value="${PVO.birth}" readOnly></td>
			</tr>
			
			<tr>
					<td>E-MAIL 변경 </td><td><input type="email" name="email" id="email" placeholder="abc@domain.com" value="${PVO.email}"></td>
			</tr>
			<tr>
					<td>거주지 변경 </td>
					<td>
						<select name="loc" id="loc" value="${PVO.loc}">
								<option value="">지역선택</option>
								<option value="서울/경기">서울/경기</option>
								<option value="강원도">강원도</option>
								<option value="충청도">충청도</option>
								<option value="경상도">경상도</option>
								<option value="전라도">전라도</option>
								<option value="제주도">제주도</option>
						</select>
					</td>
			</tr>
	
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="수정하기" id="mBtn"align="center">	
			</tr>
		
			</table>
			</form>

		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>