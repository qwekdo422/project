$(document).ready(function() {
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
		events : tEvent,
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
});
	
