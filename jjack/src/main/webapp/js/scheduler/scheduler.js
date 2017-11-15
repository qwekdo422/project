
$(document).ready(function() {
	//	==============  달력표시  ===================
	var tevent = {};
	var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
	var date = new Date();
	$('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		defaultDate : /*'2017-11-08'*/date.getTime(),
		editable : false,
		eventLimit : true, // allow "more" link when too many events
		/*events : tEvent,*/
		eventClick : function(event) {
			
			alert("이벤트 클릭");
			
			/*
			$.magnificPopup.open({
				items : {
					type : 'iframe'
				}

			});
			*/
			
			
			//	월을 숫자형태로 바꾸위해 영문으로된 월을 추출
			var inDay = event.start.toString().split(" ");
			//	1번째 인덱스에서 영문 월을 추출해서 대문자로 변환
			var month = inDay[1].toUpperCase();
			for(var i=0; i < months.length; i++) {
				if(month == months[i]) {
					$("#inDay").val(inDay[3]+"-"+(i+1)+"-"+inDay[2]);
				}
			}
		}
	
	});
	//	==============  달력표시  ===================
	
	
	//	달력이 만들어지고 나서 날짜를 클릭하면 상세정보를 띄운다.
	$(".fc-day").click(function() {
		//	날짜 클릭 시 모달창 출력
		$(this).attr("data-toggle", "modal");
		$(this).attr("data-target", "#squarespaceModal");
		//	모달창에 이벤트 시작일을 입력
		$("#startEvent").val($(this).data("date"));
	});
	//	이전/다음달을 클릭하면 달력이 세로 만들어지기 때문에 다시 onclick 이벤트를 걸어준다.
	/*
	$("button").click(function() {
		$(".fc-day").attr("onclick", "modalView(this)");
	});
	*/
	
	//생일 폼에 달력뜨게끔 해주는 코드 
	$("#endEvent").datepicker({
       dateFormat: 'yyyy-mm-dd', //텍스트 필드에 입력되는 날짜 형식 
       prevText: '이전 달',
       nextText:'다음 달',
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        changeMonth:true,
        changeYear:true, 
        showMonthAfterYear:true, //월, 년 순의 셀렉트 박스를 년, 월 순으로 바꿔준다. 
        yearRange: 'c-100:c'
          
       });
	
});
	
//	달력이 다시 만들어 질 경우 날짜를 클릭하면 모달창을 띄우기 위함.
function modalView(target) {
	//	날짜 클릭 시 모달창 출력
	$(target).attr("data-toggle", "modal");
	$(target).attr("data-target", "#squarespaceModal");
	//	모달창에 이벤트 시작일을 입력
	$("#startEvent").val($(target).data("date"));
}
