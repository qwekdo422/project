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
//댓글 수정 완료
function uBtn(btn){	
	console.log();
	var cno = $(btn).attr("data-cno");
	var rmcontents = $("#mInput").val();
	$("#cno").val(cno);
	$("#rmcontents").val(rmcontents);
	$("#replyUpdate").attr("action", "reModify.do").submit();
											//attr 아이디가 replyUpdate 인 html의 action 속성에 reModify.do을 넣어서 submit()을 해주겠다. 
	
	/*
	var value=document.getElementById('modify').value; 
	alert(value); 
	document.mmm.submit(); 
	*/
}

//수정 취소 처리 
function resetBtn(btn){
	var div =  $(btn).parent();
	var td = $(btn).parents("td");//본인의 버튼의 조상들중에 td
	contents =  td.prev().val(); //전역변수 
	td.text("");
	td.append(contents);
	td.append(div);
	
	 $(btn).hide();
	 $(btn).siblings(".remBtn").show();
	 $(btn).siblings(".uBtn").hide();
	 $(btn).siblings(".redBtn").show();
	 
}
//댓글 삭제 함수
function replyDeleteBtn(btn){
	var cno=$(btn).prev().attr("data-cno") ; //나의-전의 data-cno를 저장시킴 
	$("#cno").val(cno);
	$("#replyUpdate").attr("action", "reDelete.do").submit();
}

$(document).ready(function(){


	

	//목록보기 버튼 눌렀을 때 요청처리 
	$("#lBtn").click(function(){
		$(location).attr("href" , "../Rboard/RboardList.do"); 
	}); 
	
	
	//댓글쓰기 버튼 실행
	$("#rBtn").click(function(){
		var rebody=$("#recontents").val(); 
		if(rebody == ""){
			alertify.alert("댓글을 입력하십시오"); 
			return ; 
		}
		$("#refrm").submit(); 
	}); 
	
	//리뷰 게시판 수정하기 
		$("#mBtn").click(function(){
	
			
		$(location).attr("href" , "../Rboard/RboardModify.do?rno=${VO.rno}"); 
		
	}); 
	
	
	//리뷰 게시판 삭제하기 
	$("#dBtn").click(function(){
		
		alertify.alert("게시글이 삭제되었습니다.", function(){
			
			$(location).attr("href" , "../Rboard/RboardDelete.do?rno=${VO.rno}"); 
			
			}); 
		


	}); 
	
	
	//댓글 수정폼 
	$(".remBtn").click(function(){
		var div = $(this).parent();
	
		 var td = div.parent();
		 contents =  td.prev().val(); //전역변수 

		 var input = "<input type='text' id='mInput'  value='"+contents+"' >";
		 td.text("");
		 td.append(input);
		 td.append(div);
		 $(this).hide();
		 $(this).siblings(".uBtn").show();
		 $(this).siblings(".redBtn").hide();
		 $(this).siblings(".resetBtn").show();
	}); 
	
	

	

}); 

</script>




<body style="margin:0 auto;">
   <div id="header">
      <jsp:include page="../common/header.jsp" />
   </div>
      <div class="container">
		
<form method="post" id="vfrm"action="">
	<table class="table table-striped table-bordered mt-4">
			<tr>
				<td width="10%" align="center">
					번호 :${VO.rno}	
				</td>
				<td width="25%">
					작성일 :${VO.rdate}			                        
				</td>
				<td width="45%">
					 <strong>제목 : 	${VO.rtitle}</strong>  
				</td>
				<td align="center">
						${VO.nickname} <c:if test="${VO.jjackname ne '-'}"><font color="tomato" >♥</font> ${VO.jjackname}</c:if>
				</td>
			  </tr>
			<tr>
			<%--  <td colspan="2" ><textarea  id="nbody" name="ncontents" row="10" cols="110"   disabled >${VO.ncontents}</textarea></td>--%>	
						<td colspan="4"><div>${VO.rcontents}</div></td>
			</tr> 
	</table>
		</form>
	<form method='post'  id='replyUpdate' name='mmm' action=''>
			<input type="hidden"  name="cno"  id="cno">
			<input type="hidden"  name="rmcontents" id="rmcontents">			
			<input type="hidden"  class ="tempRno"name ="rno" value="${VO.rno}">
	</form>	
	<table  class="table table-striped table-bordered mt-4">
				<tr align="center">
						<th >번호</th>	
						<th>작성자</th>
						<th >작성일</th>
						<th width="70%">댓글내용</th>					
				</tr>					
				<c:forEach var="data" items="${RE}" varStatus="vs">				
				<tr>
						<td align="center">${vs.count}</td>
						<td align="center">
							<c:if test="${empty data.nickname and empty data.jjackname}">${data.rid}</c:if>
							<c:if test="${!empty data.nickname}"><font color="tomato">${data.nickname}</font></c:if>
							<c:if test="${!empty data.jjackname}"><font color="tomato" >${data.jjackname}</font></c:if>
						</td>
							<td align="center">${data.cwdate} </td> 
							<input type="hidden" class="tempValue" value="${data.cctentents}">
						<td>${data.cctentents}
							<c:if test="${sessionScope.UID eq data.rid}">
								<div style="float:right;">
									<input type="button"  class="remBtn btn btn-success mr-1 btn-sm"  value="수정">
									<input type="button"  style="display:none;" class="uBtn btn btn-success mr-1 btn-sm" value="완료" onclick="uBtn(this)"
										data-cno="${data.cno}" >
									<input type="button" class="redBtn btn btn-success btn-sm" value="삭제" onclick="replyDeleteBtn(this)">
									<input type="button" style="display:none;" class="resetBtn btn btn-success btn-sm" value="취소" onclick="resetBtn(this)">
								</div>
							</c:if>
						</td>
					</tr>
			
					</c:forEach>
</table>
	
	<form method="post" action="../Rboard/reContentsProc.do" id="refrm">
	<input type="hidden"  name ="rno" value="${VO.rno}">
	<table  class="table table-hover table-striped table-bordered mt-4">
		<c:if test="${!empty sessionScope.UID}">
		<tr>
			<td>
				${sessionScope.UID}  : 
			</td>
			<td width="80%">
			<input type="text" id="recontents"  class="form-control form-control-sm" name="recontents" >
			</td>
			<td>
			<input type="button" class="btn btn-info btn-sm" value="댓글쓰기" id="rBtn" >
			</td>
		</tr>
		</c:if>
		<c:if test="${empty sessionScope.UID}">
		<tr>
			<td width="15%">
				작성자 :
			</td>
			<td>
			<input type="text" id="recontents"  class="form-control form-control-sm" name="recontents"  placeholder="로그인 하십시오.">
			</td>
		</tr>
		</c:if>
	</table>
	</form>
	
	
	
		<br>
	<table class="table table-hover table-striped table-bordered mt-4">
		<tr>
			<c:if test="${PRENEXT.pre ne '다음글 없음'}">		
			<td>▲다음글</td><td><a href="../Rboard/RboardView.do?rno=${PRENEXT.preNo}">${PRENEXT.pre}</a></td><td align="center">작성일 : ${PRENEXT.preday}</td>
			</c:if>
		</tr>

	<tr>
	<c:if test="${PRENEXT.next ne '이전글 없음'}">		
			<td>▼이전글</td><td><a href="../Rboard/RboardView.do?rno=${PRENEXT.nextNo}">${PRENEXT.next}</a></td><td align="center">작성일 : ${PRENEXT.nextday}</td>
	</c:if>
	</tr>
	</table>


	<div align="center" class="mb-4">
	<input type="button" id="lBtn" class="btn btn-info" value="목록보기">		
	<c:if test="${sessionScope.MNO eq  VO.writerno}">
	<input type="button" id="dBtn" class="btn btn-info" value="삭제하기">
	<input type="button" id="mBtn"  class="btn btn-info" value="수정하기">
	</c:if>	
	</div>



		</div>
   <div id="footer">
      <jsp:include page="../common/footer.jsp" />
   </div>
</body>
</html>