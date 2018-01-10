// 데이트피커 설정
/*
$(function() {
	  $(".datepicker").datepicker({
		  changeMonth: true, 
		  dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		  monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  dateFormat: "yy-mm-dd"
	  });
});
*/
$(document).ready(function() {
	// 동적 생성된 데이트피커 설정
	$(document).on("mouseenter", ".datepicker", function() {
		$(".datepicker").removeClass('hasDatepicker').datepicker({
			changeMonth: true, 
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yy-mm-dd"
		});
	});
	
	// 합격여부 전체체크박스
	$(".allStatus").change(function(){
		if($(this).is(":checked")) {
			$("input[name=searchStatus]").prop("checked", true);
		} else {
			$("input[name=searchStatus]").prop("checked", false);
		}
	});
	
	//체크박스 전체 선택 or 해제
	$(".ch_all").click(function() {
		if($(this).is(":checked")) { // 전체 선텍 체크했을 경우 
			// 체크박스 모두 선택
			$(".ch_box").prop("checked", true);
		} else { // 전체선택 해제 했을 경우
			$(".ch_box").prop("checked", false);
		}
	});
	
	var del_flag = false; // 기존데이터가 있는지를 기억할 변수
	// 삭제버튼
	$(".dBtn").click(function() {
		// listTB 테이블 아래에 모든 체크박스
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) {
			alert("삭제할 목록을 체크하세요.");
			return;
		} 
		// 삭제할 번호를 담을태그
		var del_no = '<input type="hidden" class="ch_box" name="ch_box">';
		for (var i = 0; i < ch_box.length; i++) {
			var check = $(ch_box[i]);
			if(check.attr("data-no")) { // 기존데이터 (번호가 존재하는 경우)
				var input = $(del_no).clone().val(check.attr("data-no"));
				// 삭제할 input태그들을 삭제폼에 넣어준다.
				$("#deleteFrm").append(input);
				del_flag = true;
			} else { // 기존데이터가 아닌경우 (번호가 없고 새로복사한경우)
				check.parents("tr").remove();
			}
		}
		// 기존데이터 삭제할게 있을 경우 서브빗
		if(del_flag) {
			$("#deleteFrm").attr("action", "delete.do").submit();
		}
	});
	
	// 복사버튼
	$(".cloneBtn").click(function() {
		// 복사목록 조회
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) { // 복사할 목록이 없는 경우
			alert("복사할 목록을 체크하세요.");
			return;
		} else if(ch_box.length > 1) {
			alert("1개만 복사 가능합니다.");
			return;
		} else {
			$(".cloneBtn").attr("data-toggle", "modal");
			$(".cloneBtn").attr("data-target", "#myModal");
			
			// 체크된 tr을 복사한다.
			var cloneTR = ch_box.parents("tr").clone();
			// 기본체크된 tr 체크해제
			ch_box.prop("checked", false);
			cloneTR.addClass("cloneTR");
			
			// 복사한 tr 정보
			var no = cloneTR.find(".ch_box").attr("data-no");
			var name = cloneTR.find(".m_name").text();
			var sumdate = cloneTR.find(".m_sumdate").text();
			var title = cloneTR.find(".m_title").text();
			var evaluation = cloneTR.find(".m_evaluation").text();
			var status = cloneTR.find(".m_status").text();
			
			var addTR = $(".cloneTB").find("tr").clone();
			addTR.find(".m_no").val(no);
			addTR.find(".ch_box").prop("checked", true);
			addTR.find(".m_name").val(name+"(복사)");
			addTR.find(".m_startdate").val("");
			addTR.find(".m_title").val(title);
			
			var firstTR = $(".listTB tr:first");
			firstTR.after(addTR);
		}
	});
	
	// 등록버튼
	var reg_flag = false;
	$(".regBtn").click(function() {
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) {
			location.href="writeForm.do";
		} else {
			var ch_box = $(".listTB").find(".ch_box:checked");
			var evaluationArr = ["잘함", "적절함", "조금만더", "노력요함"];
			var statusArr = ["합격", "진행중", "불합격"];
			for (var i = 0; i < ch_box.length; i++) {
				var checkTR = $(ch_box[i]).parents("tr");
				var name = checkTR.find(".m_name");
				var sumdate = checkTR.find(".m_sumdate");
				var evaluation = checkTR.find(".m_evaluation");
				var status = checkTR.find(".m_status");
				if(!$(ch_box[i]).attr("data-no")) {
					if(name.val() == "") {
						alert("이름입력하세요."); name.focus(); return;
					} else if (sumdate.val() == "") {
						alert("교육기간를 입력하세요.");sumdate.focus(); return;
					} else if (evaluation.val() == "") {
						alert("평가를 입력하세요."); evaluation.focus(); return;
					} else if(status.val() == "") {
						alert("합격여부를 입력하세요."); status.focus(); return;
					} else if (!evaluationArr.contains(evaluation.val())) {
						alert("다음 문자만 입력가능합니다.(잘함, 적절함, 조금만더, 노력요함"); evaluation.focus();return;
					} else if(!statusArr.contains(status.val())) {
						alert("다음 문자만 입력가능합니다.(합격, 진행중, 불합격)"); status.focus(); return;
					}
					$("#regTB").append(checkTR);
				} else {
					reg_flag = true;
					alert("새로 생성한 행만 등록 가능합니다."); return;
				}
			}
			// 새로추가한 행만 선택되었을때
			if(!reg_flag) {
				$("#regFrm").attr("action", "write.do").submit();
			}
		}
	});
	
	// 일반 직원등록폼에서 행추가 버튼
	$(".writeDetailTB").on("click", ".writeAddBtn", function(){
		var i = 1;
		/*
		var lastTR = $(".writeDetailTB tr:last").prev().clone();
		console.log(lastTR.find(".s_content").val());
		*/
		var tr = $(".writeCloneTB").find("tr").clone();
		tr.find(".datepicker").removeAttr("id");
		tr.find(".datepicker").removeClass('hasDatepicker');
		
		tr.find(".s_name").prop("name", "detailList["+i+"].s_name");
		tr.find(".s_date").prop("name", "detailList["+i+"].s_date");
		tr.find(".s_day").prop("name", "detailList["+i+"].s_day");
		tr.find(".s_content").prop("name", "detailList["+i+"].s_content");
		tr.find(".s_evaluation").prop("name", "detailList["+i+"].s_evaluation");
		tr.find(".s_comment").prop("name", "detailList["+i+"].s_comment");
		$(this).parents("tr").before(tr);
		i++;
	});
	
	// 일반 직원등록폼에서 등록버튼
	$(".writeBtn").click(function() {
		// 직원정보
		var m_name = $(".writeTB").find(".m_name");
		var m_startdate = $(".writeTB").find(".m_startdate");
		var m_enddate = $(".writeTB").find(".m_enddate");
		var m_title = $(".writeTB").find(".m_title");
		var m_evaluation = $(".writeTB").find(".m_evaluation");
		var m_status = $(".writeTB").find(".m_status");
		if(m_name.val() == "") {
			alert("이름을 입력하세요."); m_name.focus(); return; 
		} else if(m_startdate.val() == "") {
			alert("교욱시작일을 입력하세요."); m_startdate.focus(); return; 
		} else if(m_enddate.val() == "") {
			alert("교육종료일을 입력하세요."); m_enddate.focus(); return; 
		} else if(m_title.val() == "") {
			alert("제목을 입력하세요."); m_title.focus(); return; 
		} else if(m_evaluation.val() == "") {
			alert("평가를 선택하세요."); m_evaluation.focus(); return; 
		} else if(m_status.val() == "") {
			alert("합격여부를 선택하세요."); m_status.focus(); return; 
		} 
		// 직원상세정보
		var tr = $(".writeDetailTB").find("tr");
		for (var i = 0; i < tr.length; i++) {
			if(i != 0 && i != tr.length-1){ // 첫번째 tr, 마지막 tr 제외(데이터는 그 중간 tr에 존재)
				var thisTR = $(".writeDetailTB").find("tr").eq(i);
				var s_date = thisTR.find(".s_date");
				var s_date = thisTR.find(".s_date");
				var s_day = thisTR.find(".s_day");
				var s_content = thisTR.find(".s_content");
				var s_evaluation = thisTR.find(".s_evaluation");
				if(s_date.val() == "") {
					alert("상세 일자를 입력하세요."); s_date.focus(); return;
				} else if (s_day.val() == "") {
					alert("상세 요일을 입력하세요."); s_day.focus(); return;
				} else if (s_content.val() == "") {
					alert("상세 교육내용 입력하세요."); s_content.focus(); return;
				} else if (s_evaluation.val() == "") {
					alert("상세 평가를 입력하세요."); s_evaluation.focus(); return;
				}
			} // 조건문 종료
		} // 반복문 종료
		$("#writeFrm").attr("action", "writeProc.do").submit();
	});
	
	// 엑셀저장
	$(".excelDownBtn").click(function() {
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) {
			alert("저장할 목록을 체크하세요."); return;
		} else if (ch_box.length > 1) {
			alert("1개만 저장가능합니다."); return;
		}
		var ch_box = $(".listTB").find(".ch_box:checked");
		var no =  ch_box.attr("data-no");
		$(location).attr("href", "excelOut.do?no="+no);
	});
	
	// 엑셀샘플 다운
	$(".sampleDownBtn").click(function() {
		$(location).attr("href", "fleDownload.do");
	});
	
	// 엑셀등록버튼 (임포트)
	$(".excelImportBtn").click(function() {
		var file = $(".excelFile");
		if(!file.val()) {
			alert("파일을 첨부하세요."); file.focus(); return;
		}
		// 엑셀 확장자 검사
		if(file.val().lastIndexOf(".xls") == -1 && file.val().lastIndexOf(".xlsx") == -1) {
			alert("엑셀만 등록 가능합니다."); file.focus(); return;
		}
		$("#exImportFrm").attr("action", "excelImport.do").submit();
	});
	
	// 검색버튼
	$(".searchBtn").click(function(){
		var a = $("input[name=searchIN]").val("Y");
		$("#searchFrm").attr("action", "list.do").submit();
	});
	
	// 상세관리 수정form 버튼
	$(".detailUpdateBtn").click(function(){
		var mNo = $(".m_no").attr("data-no");
		$(location).attr("href", "detail.do?m_no="+mNo+"&requestKey=updateForm");
	});
	
	// 직원교육상세관리 추가 버튼 (행추가)
	$(".updateAddBtn").click(function(){
		var table = $(".frmTable");
		var tr = $(this).parents("tr");
		tr.before($(".cloneTB").find("tr").clone());
	});
	
	// 직원교육상세관리 저장 버튼 (등록 및 업데이트)
	$(".updateSaveBtn").click(function(){
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) {
			alert("저장할 목록을 체크하세요.");
			return;
		} 
		var ch_box = $(".listTB").find(".ch_box:checked");
		for (var i = 0; i < ch_box.length; i++) {
			var checkTR = $(ch_box[i]).parents("tr");
			var name = checkTR.find(".s_name");
			var sDate = checkTR.find(".s_date");
			var sDay = checkTR.find(".s_day");
			var evaluation = checkTR.find(".s_evaluation");
			var comment = checkTR.find(".s_comment");
			if(name.val() == "") {
				alert("이름입력하세요."); name.focus(); return;
			} else if (sDate.val() == "") {
				alert("교육일자를 입력하세요.");sDate.focus(); return;
			} else if (sDay.val() == "") {
				alert("요일을 입력하세요."); sDay.focus(); return;
			} else if(evaluation.val() == "") {
				alert("평가를 입력하세요."); evaluation.focus(); return;
			}
			var selectVal = checkTR.find(".s_evaluation option:selected").val();
			var tr = checkTR.clone();
			tr.find(".s_evaluation").val(selectVal);
			tr.find(".s_no").attr("name", "detailList["+i+"].s_no");
			tr.find(".ch_box").attr("name", "detailList["+i+"].ch_box");
			tr.find(".s_name").attr("name", "detailList["+i+"].s_name");
			tr.find(".s_date").attr("name", "detailList["+i+"].s_date");
			tr.find(".s_day").attr("name", "detailList["+i+"].s_day");
			tr.find(".s_content").attr("name", "detailList["+i+"].s_content");
			tr.find(".s_evaluation").attr("name", "detailList["+i+"].s_evaluation");
			tr.find(".s_comment").attr("name", "detailList["+i+"].s_comment");
			$(".updateTB").append(tr);
		}
		// 체크된 항목들 서브밋
		$("#detailUpdateFrm").attr("action", "detailUpdate.do").submit();
	});
	
	// 상세정보 수정폼에서 삭제버튼
	$(".updateDelteBtn").click(function() {
		var ch_box = $(".listTB").find(".ch_box:checked");
		if(ch_box.length == 0) {
			alert("삭제할 목록을 체크하세요.");
			return;
		} 
		var ch_box = $(".listTB").find(".ch_box:checked");
		for (var i = 0; i < ch_box.length; i++) {
			var input = $(ch_box[i]).siblings(".s_no");
			var cloneInput = input.clone();
			cloneInput.attr("name", "detailList["+i+"].s_no");
			$("#detailUpdateFrm").append(cloneInput);
		}
		// 체크된 항목들 서브밋
		$("#detailUpdateFrm").attr("action", "detailDelete.do").submit();
	});
	
	// 하단바 합격여부선택
	$(".bottomSelectBox").change(function(){
		var val = $(this).val();
		$(location).attr("href", "list.do?searchIN=Y&searchStatus="+val);
	});
	
});

// 복사버튼 클릭
function dateCheck(btn){
	// 교육기간을 선택하게 한다.
	var start = $(".startDate");
	var end = $(".endDate");
	if(!start.val()) {
		alert("교육시작일을 선택하세요.");
		start.focus(); return;
	} else if(!end.val()) {
		alert("교육종료일을 선택하세요.");
		start.focus(); return;
	}
	// 복사된 tr안에 선택한 교육기간을 넣어준다.
	$(".cloneTR").find(".m_sumdate").val(start.val()+" ~ "+end.val());
	// 모달창을 닫는다.
	$(btn).attr("data-dismiss", "modal");
}

// 새로만들어진 tr의 교육기간을 클릭했을 때
function clickDate(target) {
	$(target).attr("data-toggle", "modal");
	$(target).attr("data-target", "#myModal");
}

// 배열값 확인
Array.prototype.contains = function(obj) {
    var i = this.length;
    while (i--) {
        if (this[i] == obj) {
            return true;
        }
    }
    return false;
}

// 테스트 함수
function checkMethod() {
	var ch_box = $(".listTB").find(".ch_box:checked");
	if(ch_box.length == 0) {
		alert("저장할 목록을 체크하세요.");
		return;
	} 
	var ch_box = $(".listTB").find(".ch_box:checked");
	for (var i = 0; i < ch_box.length; i++) {
		var checkTR = $(ch_box[i]).parents("tr");
		var name = checkTR.find(".s_name");
		var sDate = checkTR.find(".s_date");
		var sDay = checkTR.find(".s_day");
		var evaluation = checkTR.find(".s_evaluation");
		var comment = checkTR.find(".s_comment");
		if(name.val() == "") {
			alert("이름입력하세요."); name.focus(); return;
		} else if (sDate.val() == "") {
			alert("교육일자를 입력하세요.");sDate.focus(); return;
		} else if (sDay.val() == "") {
			alert("요일을 입력하세요."); sDay.focus(); return;
		} else if(evaluation.val() == "") {
			alert("평가를 입력하세요."); evaluation.focus(); return;
		}
		var tr = checkTR.clone();
		tr.find(".s_no").attr("name", "detailList["+i+"].s_no");
		tr.find(".ch_box").attr("name", "detailList["+i+"].ch_box");
		tr.find(".s_name").attr("name", "detailList["+i+"].s_name");
		tr.find(".s_date").attr("name", "detailList["+i+"].s_date");
		tr.find(".s_day").attr("name", "detailList["+i+"].s_day");
		tr.find(".s_content").attr("name", "detailList["+i+"].s_content");
		tr.find(".s_evaluation").attr("name", "detailList["+i+"].s_evaluation");
		tr.find(".s_comment").attr("name", "detailList["+i+"].s_comment");
		$(".updateTB").append(tr);
	}
}
