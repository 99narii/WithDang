var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),//기본 좌표
    level: 3//확대 레벨
};

var positions = new Array();
var coor = new Array();
var markerArr=new Array();
var overlayArr=new Array();
var iwContentArr = new Array();
var overlay = null;
var lati = null;
var type=null;
var longi = null;
var imageSrc = null;




const contextPath = "/" + window.location.pathname.split("/")[1] ;

//지도 생성
var map = new kakao.maps.Map(container, options);

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
        imageSrc = document.getElementById("mappin1").src;
        hideWindow()
        hideMarker();
        callPin();
    });
    $("#pin2").on("click", function () {
        type = "training";
        imageSrc = document.getElementById("mappin2").src;
        hideMarker();
        hideWindow()
        callPin();
    });
    $("#pin3").on("click", function () {
        type = "hospital";
        imageSrc = document.getElementById("mappin3").src;
        hideMarker();
        hideWindow()
        callPin();
    });
    $("#pin4").on("click", function () {
        type = "beauty";
        imageSrc = document.getElementById("mappin4").src;

        hideMarker();
        hideWindow()
        callPin();
    });
    // $("#pin5").on("click", function () {
    //     type = "trail";
    //     hideMarker();
    //     hideWindow()
    //     callPin();
    // });
    $("#pin6").on("click", function () {
        type = "kinder";
        imageSrc = document.getElementById("mappin6").src;
        hideMarker();
        hideWindow()
        callPin();
    });
});


function callPin() {
    var json = {"name":"","type": type, "latitude": lati, "longitude": longi};
    $.ajax({
        url: contextPath + '/getMapPin',
        data: JSON.stringify(json),
        type: "post",
        contentType: "application/json",
        success: function (data) {
            if (data.length == 0) {
                alert("주변에 해당 시설이 없습니다")
                return;
            }
            //이전 데이터 날리기
            positions = new Array();
            //데이터 받아와서 꺼내기
            for (var i = 0; i < data.length; i++) {
                coor[i] = data[i]["latitude"] + ',' + data[i]["longitude"];
                positions[i] = {
                    title: data[i]["name"],
                    latlng: new kakao.maps.LatLng(data[i]["latitude"],data[i]["longitude"])
                };
            }
            var roadviewClient = new kakao.maps.RoadviewClient();
            //마커 커스텀
            var imageSize = new kakao.maps.Size(24, 35);
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            var bounds = new kakao.maps.LatLngBounds();

            for (var i = 0; i < positions.length; i++) {
                var iwContent = '<div class="info-title">' + positions[i].title
                    + '<br><a href="https://map.kakao.com/link/roadview/'
                    + coor[i] + 'class="info-title-view" target="_blank"\n>로드뷰</a> <a href="https://map.kakao.com/link/to/' + positions[i].title + ',' + coor[i] +  '" class="info-title-info" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                //마커 생성
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: positions[i].latlng,
                    image: markerImage
                });
                // markerArr = new Array();
                overlay = new kakao.maps.CustomOverlay({
                    clickable:true,
                    content: iwContent,//인포 윈도우에 표시될 내용
                    // map:map,
                    position: positions[i].latlng,
                });
                overlayArr[i] = overlay;
                markerArr[i] = marker;
                iwContentArr[i] = iwContent;
                bounds.extend(positions[i].latlng);
            }

            for (let i = 0; i < markerArr.length; i++) {
                kakao.maps.event.addListener(markerArr[i], 'click', function () {
                    overlay.setContent(iwContentArr[i]);
                    overlay.setPosition(positions[i].latlng);
                    overlay.setMap(map);
                });
                kakao.maps.event.addListener(map, 'click', function () {
                    overlay.setMap(null);
                });

            }





            setBound();

            function setBound() {
                map.setBounds(bounds);
            }

        },//success end
    });
}
//마커 어레이 초기화 전에 윈도우 지우기
function hideWindow(){
    for (let i = 0; i < markerArr.length; i++) {
        overlay.setMap(null);
    }
}


function hideMarker() {
    if (markerArr.length > 1) {
        for (let i = 0; i < markerArr.length; i++) {
            markerArr[i].setMap(null);
        }
    }
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




map.kakao.com/link/roadview/37.5113096,127.1051525

