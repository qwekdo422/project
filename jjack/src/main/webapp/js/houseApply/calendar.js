var date = new Date();

/* 이벤트 날짜 등록 */
var totalEvent = 
	{
		title:'20대 청년모임', 
		start:'2017-11-11', 
		end:'2017-11-13',
		url: 'https://google.com/'
	}
var test = $('#calendar').fullCalendar({
	header : {
		left : 'prev,next today',
		center : 'title',
		right : 'month,agendaWeek,agendaDay'
	},
	defaultDate : /*'2017-11-08'*/date.getTime(),
	editable : false,
	eventLimit : true, // allow "more" link when too many events
	events : [ totalEvent ],
/*
$('#calendar').fullCalendar({
	header : {
		left : 'prev,next today',
		center : 'title',
		right : 'month,agendaWeek,agendaDay'
	},
	defaultDate : '2014-09-12',
	editable : false,
	eventLimit : true, // allow "more" link when too many events
	events : [ {
		title : 'Long Event',
		start : '2014-09-07',
		end : '2014-09-10',
		url : 'https://google.com/'
	}, {
		id : 999,
		title : 'Repeating Event',
		start : '2014-09-09T16:00:00'
	}, {
		id : 999,
		title : 'Repeating Event',
		start : '2014-09-16T16:00:00'
	}, {
		title : 'Conference',
		start : '2014-09-11',
		end : '2014-09-13'
	}, {
		title : 'Meeting',
		start : '2014-09-12T10:30:00',
		end : '2014-09-12T12:30:00'
	}, {
		title : 'Lunch',
		start : '2014-09-12T12:00:00'
	}, {
		title : 'Meeting',
		start : '2014-09-12T14:30:00'
	}, {
		title : 'Happy Hour',
		start : '2014-09-12T17:30:00'
	}, {
		title : 'Dinner',
		start : '2014-09-12T20:00:00'
	}, {
		title : 'Birthday Party',
		start : '2014-09-13T07:00:00'
	} ],
*/
	eventClick : function(event) {
		if (event.url) {
			$.magnificPopup.open({
				items : {
					iframe : event.url,
					type : 'iframe'
				}

			});
		}
	}

});

