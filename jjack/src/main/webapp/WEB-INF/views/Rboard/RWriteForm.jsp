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
          elPlaceHolder: "rbody",
          
        //	입힐 스킨 내용을 지정한다.	
        
          sSkinURI: "../se2/SmartEditor2Skin.html",
		//	스킨에 표시할 내용을 지정한다.
          htParams : {
				bUseToolbar :true,
              	bUseVerticalResizer : true,
        		bUseModeChanger : true
          }
	});
});

$(document).ready(function(){
	$("#rbtn").click(function(){
		//스킨을 입혀서 스마트 에디터를 구현한 것이다. 
		//사용자가 입력한 내용은 스킨에 입력한 것일 뿐 textarea에는 입력되지 않는다. 
		//처리 방법 : ★★★ 스킨에 있는 내용을 <textarea>에 반영한 후 서브밋 처리를 해야 한다. 
		oEditors.getById["rbody"].exec("UPDATE_CONTENTS_FIELD", []);
		var	rtitle = $("#rtitle").val();
		var	body = $("#rbody").val();
	
		if(rtitle==""){
			alert("제목을 입력하십시오");
			return ; 
		}
		
		if(body=="<p>&nbsp;</p>"){
			alert("본문을 입력하십시오"); 
			return; 
		}
		

		$("#nfrm").submit(); 
	}); 
}); 
</script>


<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		
			
<!-- 글쓰기 폼  -->
<form method="post" id="nfrm"action="../Rboard/RboardProc.do">
	<table width="800"  border="1" align="center">
		<tr>
			<td>
				<input type="text" name="rtitle" id="rtitle"  style="width:100%" placeholder="제목을 입력해주세요">
			</td>
		</tr>
		 <tr>
		 	<td colspan="2">
		 		<textarea  id="rbody" name="rcontents" row="100" cols="110"  ></textarea>
		  </td>
		 </tr>
		  <tr>
				<td colspan="2" align="center">
					<input type="button" id="rbtn" value="작성완료" >
				</td>
			</tr>
	</table>
</form>
<!-- 글쓰기 폼 종료   -->	
			
			
			
			
			
			
			
			
			
			
			
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>