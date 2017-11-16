var flag = false;
var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
$(document).ready(function() {
	//	==============  달력표시  ===================
	var date = new Date();
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		defaultDate : /*'2017-11-08'*/date.getTime(),
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		events : schedule,
		eventClick : function(event) {
			//	행사일정을 클릭했을 때 모달창 출력(일정 상세정보)
			modalView(this);
			//	행사일정을 클릭 했을 때 등록버튼이 아닌 수정버튼을 보이게 한다.
			$("#wBtn").css("display", "none");
			$("#mBtn").css("display", "block");
			//	상세보기 모달창에 데이터를 표시해준다.
			reModal(event);
			/*
			$("#gisoo").val(event.gisoo);
			$("#loc").val(event.loc);
			$("#age").val(event.age);
			$("#title").val(event.title);
			$("#contents").val(event.contents);
			*/
			
			//	월을 숫자형태로 바꾸기 위해 영문으로된 월을 추출
			var startEvent = event.start.toString().split(" ");
			var endEvent = event.end.toString().split(" ");
			//	1번째 인덱스에서 영문 월을 추출해서 대문자로 변환
			var start = startEvent[1].toUpperCase();
			var end = endEvent[1].toUpperCase();
			for(var i=0; i < months.length; i++) {
				//	이벤트 시작일을 yyyy-mm-dd 형식으로 만들기
				if(start == months[i]) {
					$("#eventdate").val(startEvent[3]+"-"+(i+1)+"-"+startEvent[2]);
				} 
				//	이벤트 종료일을 yyyy-mm-dd 형식으로 만들기
				if(end == months[i]){
					$("#eventend").val(endEvent[3]+"-"+(i+1)+"-"+endEvent[2]);
				}
			} // 이벤트 시작일/종료일 파싱 반복문 종료
			
		} // 이벤트 클릭했을 때 작업 종료
	
	}); // 달력 생성 종료
	//	==============  달력표시  ===================
	
	//	달력이 만들어지고 나서 날짜를 클릭하면 모달창을 띄운다.
	$(".fc-day").attr("onclick", "modalView(this)");
	//	이전, 다음, today, month 버튼의 클래스명을 담은 배열
	var cName = ["fc-prev-button", "fc-next-button", "fc-today-button", "fc-month-button"];
	//	today, month, 이전, 다음 버튼을 클릭하면 달력이 다시 만들어지므로
	//	onclick 이벤트가 사라지므로 다시 넣어준다.
	$("button").click(function(){
		var btns = $("button");
		outer:
		for (var i = 0; i < btns.length; i++) {
			//	버튼들의 클래스명을 가져온다.
			var btn = $(btns[i]).attr("class");
			for (var j = 0; j < cName.length; j++) {
				//	버튼의 클래스명에 이전, 다음, today, month 버튼의 클래스명을 포함하고 있을 때 
				if(btn.indexOf(cName[j]) != -1) {
					// 해당 클래스명이 존재하는 버튼이면 onclick 이벤트를 넣어주고 모든 for문을 종료한다.
					$(".fc-day").attr("onclick", "modalView(this)");
					break outer;
				}
			}
		}
	});	//	버튼 클릭이벤트 종료
	
	//	행사 일정 등록
	$("#wBtn").click(function(){
		//	유효성 검사
		validation(this);
		$("#scheduleFrm").attr("action", "./writeProc.sun")
	});
});	// document 종료



//달력이 다시 만들어 질 경우 날짜를 클릭하면 모달창을 띄우기 위한 함수
function modalView(target) {
	//	날짜 클릭 시 모달창 출력(일정 상세정보)
	$(target).attr("data-toggle", "modal");
	$(target).attr("data-target", "#squarespaceModal");
	// 날짜 클릭시 등록버튼을 보이게 하고 수정버튼을 숨긴다.
	$("#mBtn").css("display", "none");
	$("#wBtn").css("display", "block");
//	날짜클릭 시 그 날짜를 모달창 상세보기에 이벤트 시작일을 자동으로 입력
	$("#gisoo").val("");
	$("#loc").val("");
	$("#age").val("");
	$("#title").val("");
	$("#contents").val("");
	$("#eventend").val("");
	$("#eventdate").val($(target).data("date"));
}

//	테스트 함수
function reModal(event, target) {
	$("#gisoo").val(event.gisoo);
	$("#loc").val(event.loc);
	$("#age").val(event.age);
	$("#title").val(event.title);
	$("#contents").val(event.contents);
	//	무결성 검사에 걸렸을때
	/*
	$(this).attr("data-toggle", "modal");
	$(this).attr("data-target", "#squarespaceModal");
	*/
}

//	무결성 검사 함수
function validation (target) {
	var gisoo = $("#gisoo");			// 기수
	var eventdate = $("#eventdate");	// 이벤트 시작일
	var eventend = $("#eventend");		//	이벤트 종료일
	var loc = $("#loc");				//	대상 거주지역
	var age = $("#age");				//	대상 연령대
	var title = $("#title");			//	제목
	var contents = $("#contents");		//	내용
	//	무결성 검사할 태그 배열생성
	var frmArr = [gisoo, eventdate, eventend, loc, age, title, contents];
	//	무결성 검사할 배열의 갯수만큼 반복
	for (var i = 0; i < frmArr.length; i++) {
		//	태그 (gisoo ~ contents)
		var vTag = frmArr[i];
		if(vTag.val() == "") {
			switch (vTag) {
			case gisoo: frmStr = "기수를 입력하세요."; break;
			case eventdate: frmStr = "시작일을 입력하세요."; break;
			case eventend: frmStr = "종료일을 입력하세요."; break;
			case loc: frmStr = "거주지역을 입력하세요."; break;
			case age: frmStr = "연령대를 입력하세요."; break;
			case title: frmStr = "제목을 입력하세요."; break;
			case title: contents = "내용을 입력하세요."; break;
			}
			//	입력안된 태그에 알럿창을 띄우고 해당 태그에 foucs를 준다.
			alertify.alert(frmStr, function() {vTag.focus(); return;});
			break;
		}
	} // 무결성 검사 반복문 종료
	flag = true;
} // 무결성 검사 함수 종료

