var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),//기본 좌표
    level: 3//확대 레벨
};


var map = new kakao.maps.Map(container, options);//지도 생성


var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
function locationLoadSuccess(pos){
    //현재위치 받아오기
    var currentPos=new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
    map.panTo(currentPos);
    var marker =new kakao.maps.Marker({
        position: currentPos
    });
    marker.setMap(null);
    marker.setMap(map);
}
function locationLoadError(pos){
    alert('위치 정보를 가져오는데 실패했습니다.');
};

// 위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};
