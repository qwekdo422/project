$(document).ready(function(){
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
		// IE
		$('#top').children('a').empty().append("<img src='../img/common/header.jpg' class='headerImg'>");
	}
});
