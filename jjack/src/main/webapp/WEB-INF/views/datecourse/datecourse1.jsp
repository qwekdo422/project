<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>짝 게스트하우스</title>
<%-- ====================== 필수  ======================  --%>
<link rel="stylesheet" href="../css/common/header.css" />
<link rel="stylesheet" href="../css/common/footer.css" />
<link rel="stylesheet" href="../css/alert/alertify.core.css" />
<link rel="stylesheet" href="../css/alert/alertify.default.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../js/alert/alertify.min.js"></script>
<%-- ====================== 필수  ======================  --%>

<%-- 캘린더  --%>
<link rel="stylesheet" href="../css/houseApply/calendar.css" />
<%-- 입서신청 폼 --%>
<link rel="stylesheet" href="../css/houseApply/applyForm.css" />

<%-- 구글 지도 API 연동 --%>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDf9GelktpFgbFUFJfVrJlhl05wjrn6s1E&callback=initMap"
    async defer></script>
 <script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(33.502343, 126.943348); // y, x좌표값
  var mapOptions = { 
        zoom: 15, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  
  var marker = new google.maps.Marker({ 
            position: myLatlng, 
            map: map,
            
           <!--  title: "회사이름"--> 
  }); 
  
  var contentString ='<h3>◈서빈 해수욕장 </h3>'+
	                 '<h4>에메랄드빛으로 부서지는 햇살 아래 하얗다 못해 푸른빛이 감도는 홍조단괴 백사장이다. </h4> '+ 
	                 '<h4>수심에 따라 바다 빛깔이 달라 남태평양이나 지중해의 어느 바다와 비교해도 손색이 없다. </h4><br> '+ 
	  	             '<img src=udo.jpg>'; 
  				  	
  var infowindow = new google.maps.InfoWindow( 
          { 
        	<!--  content: 	 <IMG BORDER="0" SRC="file:///C:/Java/WebPlace/tutoring/WebContent/API/first.png" > -->
          content: contentString,     
          maxWidth:800
          }
  ); 

  google.maps.event.addListener(marker, 'click', function() { 
	  infowindow.open(map, marker); 
  }); 
  } 
 </script> 

</head>

<body style="margin: 0 auto;" onload="initialize()">
	
	<div id="wrap">
		<div id="header">
			<jsp:include page="../common/header.jsp" />
		</div>

		<div id="main">
		
			<div id="map_canvas" style="width:600px; height:400px;"></div> 

		</div>


		<div id="footer">
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
</body>
</html>