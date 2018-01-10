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
		<!-- 검색 테이블 -->
		<div><b>직원교육관리</b></div>
		<form:form commandName="searchVO" id="searchFrm" method="post">
		<form:hidden path="searchIN" />
		<table class="table">
			<tr>
				<td>
					<label>이름</label>
					<form:input path="searchName" cssClass="searchName"/>
				</td>
				<td>
					<label>교육기간</label>
					<c:if test="${empty searchVO.searchStartDate}">
						<input type="date" class="searchStartDate"  name="searchStartDate"> ~
					</c:if>
					<c:if test="${!empty searchVO.searchStartDate}">
						<input type="date" class="searchStartDate"  name="searchStartDate" value="${searchVO.searchStartDate}"> ~
					</c:if>
					<c:if test="${empty searchVO.searchEndDate}">
						<input type="date" class="searchEndDate" name="searchEndDate">
					</c:if>
					<c:if test="${!empty searchVO.searchEndDate}">
						<input type="date" class="searchEndDate" name="searchEndDate" value="${searchVO.searchEndDate}">
					</c:if>
				</td>
				<td>
					<label>교육과정</label>
					<form:input path="searchTitle" cssClass="searchTitle"/>
				</td>
				<td>
					<input type="button" class="btn btn-success searchBtn" value="검색">
				</td>
			</tr>
			<tr>
				<td>
					<label>평가</label>
					<form:select path="searchEvaluation">
						<form:option value="" >선택</form:option>
						<form:option value="잘함" >잘함</form:option>
						<form:option value="적절함" >적절함</form:option>
						<form:option value="조금만더" >조금만더</form:option>
						<form:option value="노력요함" >노력요함</form:option>
					</form:select>
				</td>
				<td colspan="3">
					<label>합격여부</label>
					<form:checkbox path="searchStatus" cssClass="allStatus" value="0"/>전체
					<form:checkbox path="searchStatus" value="1"/>합격
					<form:checkbox path="searchStatus" value="2"/>진행중
					<form:checkbox path="searchStatus" value="3"/>불합격
				</td>
			</tr>
			<tr><td colspan="4"></td></tr>
		</table>
		<!-- 검색 테이블 -->
					
		
		<!-- 리스트 테이블 -->
		<table class="table listTB">
			<tr>
				<td><input type="checkbox" class="ch_all"></td>
				<td>순번</td>
				<td>이름</td>
				<td>교육기간</td>
				<td>교육과정</td>
				<td>평가</td>
				<td>합격여부</td>
			</tr>
			<c:forEach var="data" items="${list}" varStatus="st">
				<tr>
					<td><input type="checkbox" class="ch_box" name="ch_box" data-no="${data.m_no}"></td>
					<td class="m_cnt">${st.count}</td>
					<td class="m_name"><a href="detail.do?m_no=${data.m_no}">${data.m_name}</a></td>
					<td class="m_startdate">${data.m_startdate} ~ ${data.m_enddate}</td>
					<td class="m_title">${data.m_title}</td>
					<td class="m_evaluation">${data.m_evaluation}</td>
					<td class="m_status">${data.m_status}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 리스트 테이블 -->
		
		
		<!-- 페이징 번호 -->
		<nav aria-label="Page navigation">
			<%--현재페이지 토탈페이지 표시 --%>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a>${nowPage}/${totalPage}</a></li>
			</ul>
			<ul class="pagination justify-content-center">
				<%--	[이전] --%>
				<c:if test="${nowPage ne 1}"><!--'nowPage=1 이 맨 앞으로' 니까nowPage가 1이 아닐 때만 보이게 하자.  -->
					<li class="page-item"><a class="page-link" href="list.do?nowPage=1">《</a></li>
				</c:if>		
				<c:if test="${(startPage eq 1 || startPage ne 1) && nowPage ne 1}"><%-- ★★ nowPage가 1페이지면 [이전] 버튼이 사라지는 로직--%>
					<li class="page-item"><a class="page-link" href="list.do?nowPage=${nowPage -1}">〈</a></li>
				</c:if>
				<!-- [1][2][3] -->
				<c:forEach var="page" begin="${startPage}" end="${endPage}">
					<li class="page-item <c:if test="${nowPage eq page}">active</c:if>">
						<a class="page-link" href="list.do?nowPage=${page}">${page}</a>
					</li>
				</c:forEach>
				<%--	[다음] --%>
				<c:if test="${endPage ne totalPage || nowPage ne totalPage}">
					<li class="page-item"><a class="page-link" href="list.do?nowPage=${nowPage + 1}">〉</a></li>
				</c:if>
		
				<c:if test="${nowPage ne totalPage}"><!-- 맨 뒤로 가면 맨뒤로 이 버튼을 없애고 싶다. -->					
					<li class="page-item"><a class="page-link" href="list.do?nowPage=${totalPage}">》</a></li>
				</c:if>
			</ul>
			<%-- 기타메뉴 --%>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link excelDownBtn">EXCEL 파일저장</a></li>
				<li class="page-item dBtn"><a class="page-link">삭제</a></li>
				<li class="page-item">
					<a class="page-link">
						<form:select path="searchStatus" cssClass="bottomSelectBox" multiple="false">
							<form:option value="" label="합격여부 선택" />
							<form:option value="1" label="합격" />
							<form:option value="2" label="진행중" />
							<form:option value="3" label="불합격" />
						</form:select>
					</a>
				</li>
				<li class="page-item" ><a class="page-link cloneBtn" data-toggle="" data-target="">복사</a></li>
				<li class="page-item"><a class="page-link sampleDownBtn">EXCEL양식 다운</a></li>
				<li class="page-item"><a class="page-link" data-toggle="modal" data-target="#myModalExcel">EXCEL 등록</a></li>
				<li class="page-item"><a class="page-link regBtn">등록</a></li>
			</ul>
		</nav>
		<!-- 페이징 번호 -->
		</form:form>	
		
		<!-- 복사용 테이블 -->
		<table style="display:none;" class="cloneTB">
			<tr class="cloneTR">
				<td>
					<input type="hidden" class="m_no" name="m_no">
					<input type="checkbox" class="ch_box" name="ch_box" data-no="" value="0">
				</td>
				<td class="m_cnt"></td>
				<td><input type="text" class="m_name" name="m_name"></td>
				<td><input type="text" class="m_sumdate" name="m_sumdate" onclick="clickDate(this);" data-toggle="" data-target=""></td>
				<td><input type="text" class="m_title" name="m_title"></td>
				<td><input type="text" class="m_evaluation" name="m_evaluation"></td>
				<td><input type="text" class="m_status" name="m_status"></td>
			</tr>
		</table>
		<!-- 복사용 테이블 -->
		
		<!-- 등록 FORM -->
		<form method="post" id="regFrm">
			<table id="regTB" style="display: none;"></table>
		</form>
		
		<!-- 삭제용 FORM-->
		<form method="post" id="deleteFrm"></form>
		
		<!-- 교육기간 선택 모달창 -->
	  	<div class="modal fade" id="myModal" role="dialog">
	    	<div class="modal-dialog">
	     	 <!-- Modal content-->
	     		<div class="modal-content">
	       			<div class="modal-header">
	          			<button type="button" class="close" data-dismiss="modal">&times;</button>
	          			<h4 class="modal-title">교육기간을 선택하세요.</h4>
	       			 </div>
	        		<div class="modal-body">
						<input type="date" class="startDate"> ~ <input type="date" class="endDate">
	       			</div>
		        	<div class="modal-footer">
		          		<button class="btn btn-default dateCheckBtn" data-dismiss="" onclick="dateCheck(this);" >등록</button>
		        	</div>
	      		</div>
	    	</div>
	  	</div>
		<!-- 교육기간 선택 모달창 끝 -->
		
		<!-- 엑셀등록 모달창 -->
		<form id="exImportFrm" method="post" enctype="multipart/form-data">
	  	<div class="modal fade" id="myModalExcel" role="dialog">
	    	<div class="modal-dialog">
	     	 <!-- Modal content-->
	     		<div class="modal-content">
	       			<div class="modal-header">
	          			<button type="button" class="close" data-dismiss="modal">&times;</button>
	          			<h4 class="modal-title">엑셀파일을 등록하세요.</h4>
	       			 </div>
	        		<div class="modal-body">
						<input type="file" class="excelFile" name="excelFile">
	       			</div>
		        	<div class="modal-footer">
		          		<input type="button" class="btn btn-default excelImportBtn" data-dismiss="" value="등록">
		        	</div>
	      		</div>
	    	</div>
	  	</div>
	  	</form>
		<!-- 엑셀등록 모달창 끝 -->
	</div>	
</body>
</html>