
const toggleBtn = document.querySelector('.navbar__toggleBtn');
const menu = document.querySelector('.navbar__menu');
const icons = document.querySelector('.navbar__icons');

toggleBtn.addEventListener('click', () => {
  menu.classList.toggle('active')
  icons.classList.toggle('active')
})



/*지도*/

navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);



function locationLoadSuccess(pos) {
    //현재위치 받아오기
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude),//기본 좌표
        level: 3//확대 레벨
    };

    //현재위치
    var currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
    //지도 생성
    var map = new kakao.maps.Map(container, options);

//컨트롤러 생성
    var mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    var ps = new kakao.maps.services.Places();
    var searchOption = {
        location: currentPos,
        radius: 1000,
        size: 5
    };
    ps.keywordSearch('운동장', placesSearchCB, searchOption);


    //
    // var marker = new kakao.maps.Marker({
    //     position: currentPos
    // });
    // marker.setMap(null);
    // marker.setMap(map);


    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            for (var i = 0; i < data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
    }

// 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {

        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function () {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
        });
        marker.setMap(map);
    }


}
function locationLoadError(pos){
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701,  126.570667),//기본 좌표
        level: 3//확대 레벨
    };
    var map = new kakao.maps.Map(container, options);//지도 생성
    var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    map.panTo(options);
    var marker =new kakao.maps.Marker({
        position: currentPos
    });
    marker.setMap(null);
    marker.setMap(map);
};
