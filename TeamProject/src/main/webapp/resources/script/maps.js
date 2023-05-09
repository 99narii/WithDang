var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),//기본 좌표
    level: 3//확대 레벨
};

var positions = new Array();
var coor = new Array();
// var markerArr=new Array();

var lati = null;
var type=null;
var longi = null;

const contextPath = "/" + window.location.pathname.split("/")[1] ;

var map = new kakao.maps.Map(container, options);//지도 생성
//현재위치 불러오기

navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();

map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//ground,training,hospital,beauty,trail, kinder
//핀 클릭시 반환되는 값들
$(function () {
    $(".main-pin").on("")
    $("#pin1").on("click", function () {
        type = "ground";
        callPin();
    });
    $("#pin2").on("click", function () {
        type = "training";
        callPin();
    });
    $("#pin3").on("click", function () {
        type = "hospital";
        callPin();
    });
    $("#pin4").on("click", function () {
        type = "beauty";
        callPin();
    });
    $("#pin5").on("click", function () {
        type = "trail";
        callPin();
    });
    $("#pin6").on("click", function () {
        type = "kinder";
        callPin();
    });
});




function callPin() {
    var json = {"name":"","type": type, "latitude": lati, "longitude": longi};
    $.ajax({
        url: contextPath + '/getMapPin',
        data: JSON.stringify(json),
        // dataType: "json",//받는 데이터 타입
        type: "post",
        contentType: "application/json",  //보내는 데이터 타입
        success: function (data) {
            // for (var i = 0; i < markerArr.length; i++) {
            //     markerArr[i].setMap(null);
            // }
            for (var i = 0; i <data.length; i++) {
                coor[i]=data[i]["latitude"]+','+data[i]["longitude"];
                positions[i] = {
                    title: data[i]["name"],
                    latlng: new kakao.maps.LatLng(coor[i])
                };

            }
            //마커 커스텀
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            var imageSize = new kakao.maps.Size(24, 35);
            var markerImage= new kakao.maps.MarkerImage(imageSrc, imageSize);

            var infowindow=null;
            var bounds = new kakao.maps.LatLngBounds();

            for (var i = 0; i < positions.length; i++) {
                displayMarker(positions);
                bounds.extend(positions[i].latlng);


                //   var infowindow= new kakao.maps.InfoWindow({
                //      content:iwContent,//인포 윈도우에 표시될 내용
                //      position: iwPosition,
                //  });

                //마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만든다
                //클로저 없으면 마지막 마커에만 표시 됨

                kakao.maps.event.addListener(marker, 'click', function () {
                    overlay.setMap(null);
                    // infowindow.setMap(map);
                    overlay.setMap(map);
                });
                kakao.maps.event.addListener(map, 'click', function () {
                    overlay.setMap(null);
                    // infowindow.setMap(null);
                });
            }

            function displayMarker(positions) {
                var iwContent = '<div class="info-title">' +positions[i].title+ '<br><a href="https://map.kakao.com/link/roadview/'+coor[i]+'" style="color:blue" target="_blank">로드뷰</a> <a href="https://map.kakao.com/link/to/' + positions[i].title + ',' + coor[i]+ '" style="color:#db6e84; font-size: 1em; font-family: sans-serif;" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = positions[i].latlng;
                //마커 생성
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: positions[i].latlng,
                    image: markerImage
                });
                // markerArr = new Array();
                // markerArr[i] = marker;
                var overlay = new kakao.maps.CustomOverlay({
                    // clickable:true,
                    content:iwContent,//인포 윈도우에 표시될 내용
                    position: iwPosition
                });
            }






            setBound();

            function setBound() {
                map.setBounds(bounds);
            }

        },//success end
    });
}



//기본적으로 표시되는 맵임
function locationLoadSuccess(pos){
    lati= pos.coords.latitude;
    longi= pos.coords.longitude;
    //현재위치 받아오기
    var currentPos=new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
    map.panTo(currentPos);
    var marker =new kakao.maps.Marker({
        position: currentPos
    });
    // marker.setMap(null);
    marker.setMap(map);
}
function locationLoadError(pos){
    alert('위치 정보를 가져오는데 실패했습니다.');
};