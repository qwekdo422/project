$(document).ready(function(){
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
		// IE
		$('#top').children('a').empty().append("<img src='../img/common/header.jpg' class='headerImg'>");
	}
	var pn = $(location).attr('pathname');
	if(pn.match(/intro/)) {
		$('#mIntro').addClass('active');
	} else if(pn.match(/applicantList/)){
		$('#mManageList').addClass('active');
	} else if(pn.match(/scheduler/)){
		$('#mScheduler').addClass('active');
		$('#mSchedulerA').addClass('active');
	} else if(pn.match(/mating/)){
		$('#mMating').addClass('active');
	} else if(pn.match(/datecourse/)){
		$('#mDatecourse').addClass('active');
	} else if(pn.match(/Rboard/)){
		$('#mReview').addClass('active');
	} else if(pn.match(/Nboard/)){
		$('#mNotice').addClass('active');
	} else if(pn.match(/SignUp/)){
		$('#mSignUp').addClass('active');
	} else if(pn.match(/LogIn/)){
		$('#mLogIn').addClass('active');
	}
	
});
