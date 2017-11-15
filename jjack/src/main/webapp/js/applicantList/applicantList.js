$(document).ready(function(){
			
	$("[data-toggle='tooltip']").tooltip({
	    placement: 'left',
	});
	 
	$("#slctGisoo").change(function(){
		$("#gisooFrm").submit();
	});
});