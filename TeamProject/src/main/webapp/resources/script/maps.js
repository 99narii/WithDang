var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),//기본 좌표
    level: 3//확대 레벨
};

var positions = new Array();
var map = new kakao.maps.Map(container, options);//지도 생성

var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

var lati = null;
var longi = null;
//ground,training,hospital,beauty,trail, kinder
navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
var pin=null;

$(function () {
    $(".main-pin").on("")
    $("#pin1").on("click", function () {
        pin = "ground";
        callPin();
    });
    $("#pin2").on("click", function () {
        pin = "training";
        callPin();
    });
    $("#pin3").on("click", function () {
        pin = "hospital";
        callPin();
    });
    $("#pin4").on("click", function () {
        pin = "beauty";
        callPin();
    });
    $("#pin5").on("click", function () {
        pin = "trail";
        callPin();
    });
    $("#pin6").on("click", function () {
        pin = "kinder";
        callPin();
    });


});



const contextPath = "/" + window.location.pathname.split("/")[1] ;

function callPin() {
    var json = {"pin": pin, "latitude": lati, "longitude": longi};
    $.ajax({
        url: contextPath + '/getMapPin',
        data: JSON.stringify(json),
        // dataType: "json",//받는 데이터 타입
        type: "post",
        contentType: "application/json",  //보내는 데이터 타입
        success: function (data) {
            for (var i = 0; i < markerArr.length; i++) {
                markerArr[i].setMap(null);
            }
            for (var i = 0; i <data.length; i++) {
                positions[i] = {
                    title: data[i]["name"],
                    latlng: new kakao.maps.LatLng(data[i]["latitude"], data[i]["longitude"])
                };
            }
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            var imageSize = new kakao.maps.Size(24, 35);
            var markerImage= new kakao.maps.MarkerImage(imageSrc, imageSize);
            var infowindow=null;
            var bounds = new kakao.maps.LatLngBounds();

            for (var i = 0; i < positions.length; i++) {
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: positions[i].latlng,
                    image: markerImage
                });
                bounds.extend(positions[i].latlng);
                // markerArr = new Array();
                markerArr[i] = marker;
                infowindow = new kakao.maps.InfoWindow({
                    content:positions[i].title//인포 윈도우에 표시될 내용
                });
                //마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만든다
                //클로저 없으면 마지막 마커에만 표시 됨
                (function (marker, infowindow) {
                    kakao.maps.event.addListener(marker, 'click', function () {
                        infowindow.close();
                        infowindow.open(map, marker);
                    });
                    kakao.maps.event.addListener(map, 'click', function () {
                        infowindow.close();
                    });
                })(marker, infowindow);
            }
            setBound();

            function setBound() {
                map.setBounds(bounds);
            }

        },//success end
    });
}

var markerArr=new Array();


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