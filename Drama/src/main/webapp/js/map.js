// js/map.js

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { // 지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 
    
// 지도를 생성 및 객체 리턴
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

function displayResults(results) {
    var mapContainer = document.getElementById('map');
    var mapOption = { 
        center: new kakao.maps.LatLng(results[0].위도, results[0].경도),
        level: 3 
    }; 
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    results.forEach(result => {
        var markerPosition = new kakao.maps.LatLng(result.위도, result.경도);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);
    });
}

