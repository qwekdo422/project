//alert 돌아가면 제대로된 안내창으로 바꿔
$(document).ready(function(){
	
	alert(1);
	
	if(a == 'true') {
		alert("안내 메일을 발송했습니다");
	}

	$("[data-toggle='tooltip']").tooltip({
	    placement: 'left',
	});
	 
	$("#edate").change(function(){
		$("#edateFrm").submit();
	});

	if(len==5) {
		alert("더는 승인하실 수 없습니다");
	}
	
	
	

	/*
	$(".comeBtnM").click(function(){
		alert(1);
		if(${fn:length(okMan)}==5) {
			alert("더는 승인하실 수 없습니다");
		} else {
			//$(this).parent().attr('action', '../applicantList/denyProc.do').submit();
		}
	});
	$(".comeBtnW").click(function(){
		alert(1);
		if(${fn:length(okMan)}==5) {
			alert("더는 승인하실 수 없습니다");
		} else {
			//$(this).parent().attr('action', '../applicantList/denyProc.do').submit();
		}
	});
	
	
*/	
	$(".denyBtn").click(function(){
		alert(2);
		//$(this).parent().attr('action', '../applicantList/denyProc.do').submit();
	});
	
});