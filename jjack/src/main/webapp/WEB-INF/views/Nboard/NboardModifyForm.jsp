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
				bUseToolbar :true,
              	bUseVerticalResizer : true,
        		bUseModeChanger : true
          }
	});
});

$(document).ready(function(){
	$("#nbtn").click(function(){
		//상품 등록 단추 이벤트 처리 
		$("#nbtn").click(function(){
			//스마트 에디터 스킨에 있는 내용을 textarea에 반영하고(▼밑에 코드가 그 부분)
			oEditors.getById["nbody"].exec("UPDATE_CONTENTS_FIELD", []);
			
			//무결성 검사 하고 
			var title=$("#ntitle").val();
			var body=$("#nbody").val(); 
			if(title==""){
				alert("제목을 입력하십시오"); 
				title.focus(); 
				return; 
			}
			if(body=="<p>&nbsp;</p>"){//눈에는 보이지 않지만 네이버 텍스트로 인해 기본적으로 <p>&nbsp;</p>이 붙어 있어서 이걸로 무결성 검사함 
				alert("본문을 입력하십시오"); 
				body.focus(); 
				return; 	
			}
			
			//서브밋 시킨다. 
			$("#nfrm").submit(); 
			
		});
		
	}); 
	
}); 

</script>
<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">

<!-- 수정하기 폼  -->
<form method="post" id="nfrm"action="../Nboard/NboardModifyProc.do">
<input type="hidden" id="nno" name="nno" value="${VO.nno}">
		<tableclass="table table-hover table-striped table-bordered mt-4">
			<tr>
				<td>
					<input type="text" name="ntitle" id="ntitle"  style="width:100%" placeholder="제목을 입력해주세요" value="${VO.ntitle}">
				</td>
			</tr>																																																								
		 	<tr>
		 		<td colspan="2">
		 			<textarea  id="nbody" name="ncontents"  row="100" cols="110" >${VO.ncontents}</textarea>
		 		</td>
		 	</tr>
		  	<tr>
				<td colspan="2" align="center">
					<input type="button" id="nbtn" value="수정완료" >
				</td>
			</tr>
	</table>
</form>



			
		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>