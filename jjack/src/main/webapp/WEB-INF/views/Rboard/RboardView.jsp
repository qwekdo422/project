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
<script>
$(document).ready(function(){
	
	//목록보기 버튼 눌렀을 때 요청처리 
	$("#lBtn").click(function(){
		$(location).atrr("href" , "../Rboard/RboardList.do"); 
	}); 
	
	//
	
}); 

</script>




<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		
<form method="post" id="vfrm"action="">
	<table width="1100" border="1" align="center">
			<tr>
				<td>
			작성일 :${VO.rdate}		 | 		공지 번호 :${VO.rno}		| 	  	${VO.rtitle}
				</td>
			  </tr>
			<tr>
			<%--  <td colspan="2" ><textarea  id="nbody" name="ncontents" row="10" cols="110"   disabled >${VO.ncontents}</textarea></td>--%>	
						<td colspan="2"><div>${VO.rcontents}</div></td>
			</tr> 
	</table>
<%-- 	
	<br>
	<table border="1" align="center" width="800">
		<tr>
			<c:if test="${PRENEXT.pre ne '이전글 없음'}">		
			<td>▲이전글</td><td><a href="../Nboard/NboardView.do?nno=${PRENEXT.preNo}">${PRENEXT.pre}</a></td><td>작성일 : ${PRENEXT.preday}</td>
			</c:if>
		</tr>
		
	<tr>
	<c:if test="${PRENEXT.next ne '다음글 없음'}">		
			<td>▼다음글</td><td><a href="../Nboard/NboardView.do?nno=${PRENEXT.nextNo}">${PRENEXT.next}</a></td><td>작성일 : ${PRENEXT.nextday}</td>
	</c:if>
	</tr>
--%>			
	</table>
	
	<div align="center">
	<input type="button" id="lBtn" value="목록보기" align="right">	
	<input type="button" id="dBtn" value="삭제하기" align="right">
	<input type="button" id="mtn" value="수정하기" align="right">
	</div>
		</form>

		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>