 	$(document).ready(function(){
 			
 			/* 
 			// 일정그림 보여주기 부트스트랩 방식
 			$('.nav-tabs a').on('click', function (e) {
				  e.preventDefault();	// 클릭시 화면 위로 가는걸 방지
				  $(this).tab('show');
				});
			*/
				
 			// 일정그림 보여주기 jQuery 방식
			var day12=1;
			$('#day2').hide();
			$('#day1Btn').click(function(){
				if(day12==2) {
					$('#day2').hide();
					$("#day1Btn").addClass('active');
					$('#day1Btn').css('color', '#007bff');
					$('#day2Btn').css('color', '#212529');
					$('#day1Btn').css('cursor', 'Default');
					$('#day2Btn').css('cursor', 'Pointer');
					$("#day2Btn").removeClass('active');
					$('#day1').show();
					day12=1;
				}
			});

			$('#day2Btn').click(function(){
				if(day12==1) {
					$('#day1').hide();
					$("#day2Btn").addClass('active')
					$('#day2Btn').css('color', '#007bff');
					$('#day1Btn').css('color', '#212529');
					$('#day2Btn').css('cursor', 'Default');
					$('#day1Btn').css('cursor', 'Pointer');
					$("#day1Btn").removeClass('active');
					$('#day2').show();
					day12=2;
				}
			});
		});
	