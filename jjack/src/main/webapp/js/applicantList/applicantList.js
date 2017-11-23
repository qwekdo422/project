//alert 돌아가면 제대로된 안내창으로 바꿔
$(document).ready(function(){
	
	if(mail==true) {
		alertify.alert("안내 메일을 발송했습니다");
	}
	
	$("[data-toggle='tooltip']").tooltip({
	    placement: 'left',
	});
	 
	$("#edate").change(function(){
		$("#edateFrm").submit();
	});
	


	// 입소대기자 승인 버튼
	$(".comeBtnM").click(function(){
		if(manCount==5) {
			alertify.alert("더는 승인하실 수 없습니다");
		} else {
			$(this).siblings(".ns").attr('value', 2).parent().submit();
		}
	});
	$(".comeBtnF").click(function(){
		if(womanCount==5) {
			alertify.alert("더는 승인하실 수 없습니다");
		} else {
			$(this).siblings(".ns").attr('value', 2).parent().submit();
		}
	});
	// 입소대기자 거부 버튼
	$(".denyBtn").click(function(){
		$(this).siblings(".ns").attr('value', 5).parent().submit();
	});
	
	// 입소승인/거부자 대기로 복귀 버튼
	$(".toWaitBtn").click(function(){
		$(this).parent().attr('action', '../applicantList/changeCond.do').submit();
	});
	
	// 입금 확인 버튼
	$(".moneyOkBtn").click(function(){
		$(this).siblings(".ns").attr('value', 4).parent().submit();
	});
	
	// 취소 버튼
	$(".cancelBtn").click(function(){
		$(this).siblings(".ns").attr('value', 7).parent().attr('action', '../applicantList/changeCond.do').submit();
	});
	
	// 추가합격 버튼
	$(".toOkMBtn").click(function(){
		if(manCount==5) {
			alertify.alert("더는 승인하실 수 없습니다");
		} else {
			$(this).parent().submit();
		}
	});
	$(".toOkFBtn").click(function(){
		if(womanCount==5) {
			alertify.alert("더는 승인하실 수 없습니다");
		} else {
			$(this).parent().submit();
		}
	});
	
	
});

