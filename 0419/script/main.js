
const toggleBtn = document.querySelector('.navbar__toggleBtn');
const menu = document.querySelector('.navbar__menu');
const icons = document.querySelector('.navbar__icons');

toggleBtn.addEventListener('click', () => {
  menu.classList.toggle('active')
  icons.classList.toggle('active')
})


var currentPos; // 현재 위치를 저장할 변수

navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);

function locationLoadSuccess(pos) {
  currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
  var container = document.getElementById('map');
  var options = {
    center: currentPos, // 현재 위치를 중심으로 지도를 생성
    level: 3
  };
  var map = new kakao.maps.Map(container, options);
  var mapTypeControl = new kakao.maps.MapTypeControl();
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
  var marker = new kakao.maps.Marker({
    position: currentPos
  });
  marker.setMap(map);
}

function locationLoadError(pos) {
    currentPos = new kakao.maps.LatLng(37.497946, 127.027636);
    var container = document.getElementById('map');
  var options = {
    center: currentPos,
    level: 3
  };
  var map = new kakao.maps.Map(container, options);
  var mapTypeControl = new kakao.maps.MapTypeControl();
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
  var zoomControl = new kakao.maps.ZoomControl();
  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
  var marker = new kakao.maps.Marker({
    position: currentPos
  });
  marker.setMap(map);
};




// /*지도*/

// navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);


// function locationLoadSuccess(pos){
//     //현재위치 받아오기
//     var container = document.getElementById('map');
//     var options = {
//         center: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude),//기본 좌표
//         level: 3//확대 레벨
//     };
//     var map = new kakao.maps.Map(container, options);//지도 생성
//     var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
//     map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//     var zoomControl = new kakao.maps.ZoomControl();
//     map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//     map.panTo(options);
//     var marker =new kakao.maps.Marker({
//         position: currentPos
//     });
//     marker.setMap(null);
//     marker.setMap(map);
// }
// function locationLoadError(pos){
//     var container = document.getElementById('map');
//     var options = {
//         center: new kakao.maps.LatLng(33.450701,  126.570667),//기본 좌표
//         level: 3//확대 레벨
//     };
//     var map = new kakao.maps.Map(container, options);//지도 생성
//     var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
//     map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//     var zoomControl = new kakao.maps.ZoomControl();
//     map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//     map.panTo(options);
//     var marker =new kakao.maps.Marker({
//         position: currentPos
//     });
//     marker.setMap(null);
//     marker.setMap(map);
// };

// // 위치 가져오기 버튼 클릭시
