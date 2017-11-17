$(document).ready(function(){
			
	$("[data-toggle='tooltip']").tooltip({
	    placement: 'left',
	});
	 
	$("#edate").change(function(){
		$("#edateFrm").submit();
	});
});