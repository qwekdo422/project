var flag = false;	//	무결성 검사에 걸렸는지 안걸렸는지를  판단할 변수
$(document).ready(function() {
	//	==============  달력표시  ===================
	var date = new Date();
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		defaultDate : date.getTime(),
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		events : schedule,
		eventClick : function(event) {
			//	관리자 일경우
			if(status == 'ADMIN'){
				//	행사일정을 클릭했을 때 모달창 출력(일정 상세정보)
				modalView(this, event);
			} else {
				//	사용자일 경우
				var eventView = $("#eventView"); 
				eventView.css("position", "absolute");
				eventView.css("opacity", "0");
				var tableTop = $(eventView).parent().position().top;
				eventView.css("top", "-200px").animate({
					top : tableTop,
					opacity: 1,
					backgroundColor: "rgba(0, 114, 212, 0.22)",
				}, 1000, function() {
					eventView.css("position", "");
				});
				
				$("#eventdate").val(event.start._i);
				$(".gisoo").text(event.gisoo);	
				$(".eventDay").text(event.start._i+"~"+event.end._i);	
				$(".loc").text(event.loc);	
				$(".age").text(event.age);	
				$(".title").text(event.title);	
				$(".contents").text(event.contents);	
			}
			
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
	
	//	행사 일정 등록버튼 이벤트
	$("#wBtn").click(function(){
		//	무결성 검사
		validation();
		//	무결성 검사에 걸렸을 겅우 다음을 수행하지 않고 리턴
		if(isFlag()) return;
		//	등록완료 alert창을 띄우고 서브밋을 한다.
		completAlert("등록");
	});
	
	//	행사 일정 수정버튼 이벤트
	$("#mBtn").click(function(){
		//	무결성 검사
		validation();
		//	무결성 검사에 걸렸을 겅우 다음을 수행하지 않고 리턴
		if(isFlag()) return;
		//	수정완료 alert창을 띄우고 서브밋을 한다.
		completAlert("수정");
	});
	
	//	행사 일정 삭제버튼 이벤트
	$("#dBtn").click(function(){
		//	수정완료 alert창을 띄우고 서브밋을 한다.
		completAlert("삭제");
	});
	
	//	사용자 입소신청 클릭 이벤트
	$(".applyBtn").click(function(){
		$("#applyFrm").attr("action", "./applyProc.do").submit();
	});
	
	//	사용자 입소신청시 사진업로드
  	$('#imageUpload').change(function(){
  		console.log($(this));
  		readImgUrlAndPreview(this);
  		function readImgUrlAndPreview(input){
  			 if (input.files && input.files[0]) {
  		            var reader = new FileReader();
  		            reader.onload = function (e) {			            	
  		                $('#imagePreview').attr('src', e.target.result);
  							}
  			          };
  			          reader.readAsDataURL(input.files[0]);
  			     }	
  		});
	
	//	기수 중복체크 (키보드 누를때 마다)
	$("#gisoo").keyup(function() {
		var gisoo = $("#gisoo").val();
		if(gisoo != "" && gisoo.length < 9) {
			$.ajax({
				url: './gisooCheck.do',
				data: {'gisoo': gisoo},	
				success: function(data) {
					//	data가 1이면  데이터베이스에 기수가 존재한다.
					if(data == 1 && gisoo != eGisoo) {
						$("#gisoo").css("color", "red");
						$("#gisoo").siblings().text("기수: 중복된 기수는 사용할 수 없습니다.").css("color", "red");
					} else {
						$("#gisoo").css("color", "black");
						$("#gisoo").siblings().text("기수:").css("color", "black");
					}
				},
				error: function(e) {
					alert(e+"에러");
				}
			})
		}
	}); // 기수종복체크 종료
	
});	// document 종료

//	완료알림창을 띄우고 서브밋처리하는 함수
function completAlert(msg) {
	alertify.alert(msg+"이(가) 완료되었습니다.", function(){
		if(msg == '등록') {
			$("#scheduleFrm").attr("action", "./writeProc.do").submit();
		} else if (msg == '수정') {
			$("#scheduleFrm").attr("action", "./modifyProc.do").submit();
		} else if (msg == '삭제') {
			$(location).attr("href", "./delete.do?eventdate="+$(eventdate).val());
		}
	});
}

var eGisoo;	//	행사일정을 클릭했을 때 그 행사일정의 기수를 저장할 변수
var eStatus = false;	//	일반날짜, 이벤트 일정을 클랙했을 때의 상태값
// 달력을 클릭 했을때 모달창 처리 함수 (관리자일 경우만)
function modalView(target, event) {
	//	모달창을 띄운다.
	$(target).attr("data-toggle", "modal");
	$(target).attr("data-target", "#squarespaceModal");
	$("#gisoo").css("color", "black");
	$("#gisoo").siblings().text("기수:").css("color", "black");
	//	행사일정이 존재 할때
	if(event != null) {
		//	상세 모달창에 행사관련 정보를 넣어준다.
		eGisoo = event.gisoo;
		$("#gisoo").val(event.gisoo);
		$("#loc").val(event.loc);
		$("#age").val(event.age);
		$("#title").val(event.title);
		$("#contents").val(event.contents);
		$("#eventdate").val(event.start._i);
		$("#eventend").val(event.end._i);
		//	행사일정을 클릭 했을 때 등록버튼이 아닌 수정버튼을 보이게 한다.
		$("#wBtn").css("display", "none");
		$("#mBtn").css("display", "block");
		$("#dBtn").css("display", "block");
		//	이벤트 일정을 클릭했을 때의 상태값
		eStatus = true;
	} 
	
	//	행사일정이 없을 때
	if(event == null) {
		//	숨겨진 모달의 정보를 초기화 해준다.
		$("#gisoo").val("");
		$("#loc").val("");
		$("#age").val("");
		$("#title").val("");
		$("#contents").val("");
		$("#eventend").val("");
		//	날짜클릭 시 그 날짜를 모달창 상세보기에 이벤트 시작일을 자동으로 입력
		$("#eventdate").val($(target).data("date"));
		// 행사일정이 없을때 등록버튼을 보이게 하고 수정버튼을 숨긴다.
		$("#mBtn").css("display", "none");
		$("#dBtn").css("display", "none");
		$("#wBtn").css("display", "block");
		//	일반 날자를 클릭했을 때의 상태값
		eStatus = false;
	}
}

//	무결성 검사 산태체크 함수
function isFlag() {
	//	무결성 검사에 걸렸을 겅우
	if(flag == true) {
		//	무결성검사 상태변수를 초기값으로 바꿔주고 리턴해준다.
		flag == false;
		//	무결성검사 걸린상태일 때 true 반환
		return true;
	}
	//	무결성검사 안걸린 상태일 때 false 반환
	return false;
}

//	무결성 검사 함수
function validation () {
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
		var frmStr;
		if(vTag.val() == "") {
			flag = true;	//	무결성 검사에 걸렸을 때 true로 변환
			switch (vTag) {
			case gisoo: frmStr = "기수"; break;
			case eventdate: frmStr = "시작일"; break;
			case eventend: frmStr = "종료일"; break;
			case loc: frmStr = "거주지역"; break;
			case age: frmStr = "연령대"; break;
			case title: frmStr = "제목"; break;
			case contents: frmStr = "내용"; break;
			}
			frmStr += "을(를) 입력하세요."; 
			//	입력안된 태그에 알럿창을 띄우고 해당 태그에 foucs를 준다.
			alertify.alert(frmStr, function() {vTag.focus(); return;});
			break;
		}
	} // 무결성 검사 반복문 종료
} // 무결성 검사 함수 종료

