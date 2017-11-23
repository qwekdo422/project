$(document).ready(function(){
	
	$('figure img, figcaption').click(function(){
		if($("#myLove").val()=="") {
			who = $("figure").index($(this).parent())+1;
			lgno = $(".gno").eq(who-1).val();
			$('#myLove').val(lgno);
			$('figure').not($(this).parent()).css('filter', 'grayscale(100%)');
			$('#btns').delay(700).slideDown(400);
		}
	});
	
	$('#noBtn').click(function(){
		$('#myLove').val("");
		who=0;
		$('figure').css('filter', 'grayscale(0%)');
		$('#btns').slideUp(400);
	});
	
	$('#chooseBtn').click(function(){
		$('figure').not($('figure')[who-1]).css('transform', 'rotate3d(1,1,0,90deg)').delay(1000).queue(function(){
			$('figure').not($('figure')[who-1]).dequeue();
			$('figure').eq(who-1).css('transform', 'scale(1.2, 1.2)').delay(2000).queue(function(){
				$('form').submit();
			});
		});
	});
});
