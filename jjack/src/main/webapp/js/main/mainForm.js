$(document).ready(function(){
	if(come == "here") {
		alertify.alert("짝을 만나고 싶다면 <짝 게스트하우스>로 오세요!");
	} else if(come == "please") {
		alertify.alert("입소자가 없습니다");
	} else if(come== "welcome"){
		alertify.alert(uid+ "님 환영합니다.");
	}
	
	
});