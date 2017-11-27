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
<script src="../se2/js/HuskyEZCreator.js" charset="UTF-8"></script><!-- 스마트에디트 스킨 불러오기 -->
<script>
var	oEditors = [];		//	에디터에 필요한 내용을 기억할 배열 변수
$(function(){
	nhn.husky.EZCreator.createInIFrame({
		
		//	이 변수는 앞에서 선언된 변수이어야 한다.
          oAppRef: oEditors,
          
        //	body는 준비된 <textarea>의 id 값이 되어야 한다.
          elPlaceHolder: "nbody",
          
        //	입힐 스킨 내용을 지정한다.	
        
          sSkinURI: "../se2/SmartEditor2Skin.html",
		//	스킨에 표시할 내용을 지정한다.
          htParams : {
				bUseToolbar :false,
              	bUseVerticalResizer : false,
      			bUseModeChanger : false
         }
	});
});

$(document).ready(function(){
	$("#lBtn").click(function(){ //목록보기 기능 버튼
		
		$(location).attr("href", "../Nboard/NboardList.do"); 
	}); 
	
	$("#dBtn").click(function(){ //삭제하기 기능 버튼

		if(confirm("정말로 삭제하시겠습니까?")){
			$(location).attr("href","../Nboard/NboardDelete.do?nno=${VO.nno}"); 
			alert("게시물이 삭제되었습니다."); 
			return; 
		}else{
			return; 
		}
	}); 
	
	$("#mtn").click(function(){//수정하기 폼으로 이동 버튼
		$(location).attr("href","../Nboard/NboardModify.do?nno=${VO.nno}"); 
	}); 
	
	
	
	
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
			작성일 :${VO.nday}		 | 		공지 번호 :${VO.nno}		| 	  	${VO.ntitle}
				</td>
			  </tr>
			<tr>
			<!--  <td colspan="2" ><textarea  id="nbody" name="ncontents" row="10" cols="110"   disabled >${VO.ncontents}</textarea></td>-->	
						<td colspan="2"><div>${VO.ncontents}</div></td>
			</tr> 
	</table>
	
		<br>
	<table border="1" align="center" width="800">
		<tr>
			<c:if test="${PRENEXT.pre ne '이전글 없음'}">		
			<td>▲이전글</td><td><a href="../Nboard/NboardView.do?rno=${PRENEXT.preNo}">${PRENEXT.pre}</a></td><td>작성일 : ${PRENEXT.preday}</td>
			</c:if>
		</tr>
		
	<tr>
	<c:if test="${PRENEXT.next ne '다음글 없음'}">		
			<td>▼다음글</td><td><a href="../Nboard/NboardView.do?rno=${PRENEXT.nextNo}">${PRENEXT.next}</a></td><td>작성일 : ${PRENEXT.nextday}</td>
	</c:if>
	</tr>

	</table>
	
	<div align="center">
	<input type="button" id="lBtn" value="목록보기" align="right">	
	<c:if test="${sessionScope.UID eq 'admin'}">
	<input type="button" id="dBtn" value="삭제하기" align="right">
	<input type="button" id="mtn" value="수정하기" align="right">
	</c:if>
	</div>
		</form>


			
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>