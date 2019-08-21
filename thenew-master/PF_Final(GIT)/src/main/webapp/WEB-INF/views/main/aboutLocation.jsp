<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style>
#locationWarp{
width: auto;
height: auto;
padding: 20px;
}
#map {
width: 600px;
height: 500px;
margin-top : 150px;
border: 1px solid black;
padding: 20px;
}

#locationInfo {
width: 620px;
height: 650px;
margin-top : 50px;
border-left: 1px solid black;
float: left;
}

#locationInfo h1 {
text-align: center;
font-weight: bold;
}

#locationInfo li {
list-style-type: none;
font-size: 16px;
}

#locationInfo b {
font-size: 18px;
}

</style>
<div id="locationWarp">
	<div id="locationInfo">
		<h1>오시는 길</h1>
		<hr>
		<ul>
			<li><b>주소</b> : 서울시 마포구 신촌로 176 중앙빌딩 5층 <i
				class="fas fa-building"></i><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(대흥동
				12-20 중앙빌딩 5층)<br>
			<br></li>
			<li><b>교통</b> :
				<ul>
					<li><i class="fas fa-bus"></i>&nbsp;버스 :<br> *이대역 정류장<br>
						간선 - 171, 172, 270, 271, 273, 472, 602, 603, 721, 751, N26, N62<br>
						지선 - 7011, 7017, 7611<br> 직행 - 1004<br> 광역 - 1000, 1100,
						1101, 1200, 1300, 1301, 1302, 1400, 1500, 1601, 1800<br> 공항 -
						6002<br>
					<br> *이대전철역 정류장<br> 마을 - 마포07, 서대문05<br>
					<br> *이화여대입구 정류장<br> 간선 - 173<br> 지선 - 5714<br>
						지선 - 6712<br> 직행 - G6000<br>
					<br></li>
					<li><i class="fas fa-subway"></i>&nbsp;지하철 : 2호선 이대역 6번출구 신촌방향
						10m 전방 중앙빌딩 5층 <br>
					<br></li>
				</ul></li>
			<li><b>주차안내</b> : 건물내 유료 주차장 이용이 가능합니다.</li>
		</ul>
	</div>
	<div id="map"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c64d94edcda8e1c9581122021c00a9d3&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 마포구 대흥동 12-20', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">중앙24</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

<%@include file="../includes/footer.jsp"%>