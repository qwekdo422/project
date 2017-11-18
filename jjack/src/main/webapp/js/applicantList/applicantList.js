$(document).ready(function(){
	alert(1);
	
	$("[data-toggle='tooltip']").tooltip({
	    placement: 'left',
	});
	 
	$("#edate").change(function(){
		$("#edateFrm").submit();
	});


	
	$("#comeBtn").click(function(){
		alert(1);
		//$(this).parent().attr('action', '../applicantList/denyProc.do').submit();
	});	
	
	$(".denyBtn").click(function(){
		alert(2);
		//$(this).parent().attr('action', '../applicantList/denyProc.do').submit();
	});
	
});