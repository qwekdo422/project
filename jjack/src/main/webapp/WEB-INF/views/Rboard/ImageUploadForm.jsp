<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script><!-- 제이쿼리 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jstl 라이브러리 -->
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<style>
#floater {
  float: left; 
  height: 50%; 
  margin-bottom: -145px;
}
#content  {
  clear: both; 
  height: 290px; 
  position: relative;
}
</style>
<link rel="stylesheet" href="../css/common/bootstrap.min.css" />
<script src="../js/main/bootstrap.bundle.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			//	무결성 검사하고
		$("#frm").submit();
		});
	});
</script>

<body >
<div height="300px">
	<div id="floater"></div>
	<div id="content">
	<form method="POST" id="frm" action="../Rboard/ImageUploadProc.do" enctype="multipart/form-data">
		<table  class="table table-bordered mt-4">
			<tr>
				<td>첨부 이미지</td>
				<td><input type="file" id="files" name="files"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="첨부하기" id="btn">
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
	
	
</body>
</html>