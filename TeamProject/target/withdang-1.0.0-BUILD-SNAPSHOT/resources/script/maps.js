var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),//기본 좌표
    level: 3//확대 레벨
};


navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);

var map = new kakao.maps.Map(container, options);//지도 생성
var mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 생성
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

var pin=null;
var lati = null;
var longi = null;
//버튼 누르면 string 값 변경
//ground,training,hospital,beauty,trail, kindergarten

$(function () {
    $(".main-pin").on("")
    $("#pin1").on("click", function () {
        pin = "ground";
        callPin();
    });
    $("#pin2").on("click", function () {
        pin = "training";
        alert("test");
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
        callPin1();
    });
    $("#pin6").on("click", function () {
        pin = "kinder";
        callPin2();
    });


});

function callPin() {
    $.ajax({
        url: `/dang/getMapPin`,
        data:{
            // pin: pin,
            lati:lati, longi: longi
        },
        dataType: "json",//받는 데이터 타입
        type:"post",
        contentType: "text",  //보내는 데이터 타입
        success: function (data) {
            console.log(data);
        },
    })
}

var markerArr=new Array();
function callPin1() {
    for (var i = 0; i < markerArr.length; i++) {
        markerArr[i].setMap(null);
    }

    var positions = [
        {
            title: '<div>서울역</div>',
            latlng: new kakao.maps.LatLng(37.55, 126.97)
        }, {
            title: '<div>서울특별시청</div>',
            latlng: new kakao.maps.LatLng(37.5668260, 126.86567)
        }, {
            title: '<div>을지로입구</div>',
            latlng: new kakao.maps.LatLng(37.566, 126.9821930)
        }
    ];
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    var imageSize = new kakao.maps.Size(24, 35);
    var markerImage= new kakao.maps.MarkerImage(imageSrc, imageSize);

    var infowindow=null;
    for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng,
            image: markerImage
        });
        // markerArr = new Array();
        markerArr[i] = marker;
        infowindow = new kakao.maps.InfoWindow({
            content:positions[i].title//인포 윈도우에 표시될 내용
        });
        //마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만든다
        //클로저 없으면 마지막 마커에만 표시 됨
        (function (marker, infowindow) {
            kakao.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
            kakao.maps.event.addListener(map, 'click', function () {
                infowindow.close();
            });
        })(marker, infowindow);
    }
    // marker.setMap(map);
}

function callPin2() {
    for (var i = 0; i < markerArr.length; i++) {
        markerArr[i].setMap(null);
    }
    var positions = [
        {
            title: '<div>서울역</div>',
            latlng: new kakao.maps.LatLng(36.3398175,127.3940486)
        }
    ];
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    var imageSize = new kakao.maps.Size(24, 35);
    var markerImage= new kakao.maps.MarkerImage(imageSrc, imageSize);
    var infowindow=null;
    for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng,
            image: markerImage
        });
        // markerArr = new Array();
        markerArr[i] = marker;
        infowindow = new kakao.maps.InfoWindow({
            content:positions[i].title//인포 윈도우에 표시될 내용
        });
        //마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만든다
        //클로저 없으면 마지막 마커에만 표시 됨
        (function (marker, infowindow) {
            kakao.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
            kakao.maps.event.addListener(map, 'click', function () {
                infowindow.close();
            });
        })(marker, infowindow);
    }
    // marker.setMap(map);
}





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