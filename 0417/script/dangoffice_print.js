/*프린트*/

// html2canvas.min.js 파일 로드
let script = document.createElement('script');
script.src = './script/html2canvas.js';
script.onload = function() {
  document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault(); // 폼 제출 이벤트 중단
    downImg(); // downImg 함수 호출
  });
};

document.head.appendChild(script);

function downImg() {

  // 사용자 입력 값
  let result1 = document.querySelector("#견종값");
  let result2 = document.querySelector("#등록번호값");
  let result3 = document.querySelector("#이름값");
  let result4 = document.querySelector("#생일값");
  let result5 = document.querySelector("#수컷값");
  let result6 = document.querySelector("#암컷값");
  let result7 = document.querySelector("#중성화함값");
  let result8 = document.querySelector("#중성화안함값");
  let result9 = document.querySelector("#주소값");
  let result10 = document.querySelector("#특징값");


  let 견종 = document.getElementById("견종").value
  let 등록번호 = document.getElementById("등록번호").value;
  let 이름 = document.getElementById("이름").value;
  let 생일 = document.getElementById("생일").value;
  let 수컷 = document.getElementById("수컷").checked ? "수컷<br/>" : "";
  let 암컷 = document.getElementById("암컷").checked ? "암컷<br/>" : "";
  let 중성화함 = document.getElementById("중성화함").checked ? "O<br/>" : "";
  let 중성화안함 = document.getElementById("중성화안함").checked ? "X<br/>" : "";
  let 주소 = document.getElementById("주소").value;
  let 특징 = document.getElementById("특징").value;

  result1.textContent = 견종;
  result2.textContent = 등록번호;
  result3.textContent = 이름;
  result4.textContent = 생일;
  result5.innerHTML = 수컷;
  result6.innerHTML = 암컷;
  result7.innerHTML = 중성화함;
  result8.innerHTML = 중성화안함;
  result9.textContent = 주소;
  result10.textContent = 특징;

  document.querySelector("#imagediv").style.borderWidth = "0px";
  document.getElementById("imageinput").remove();

  document.getElementById("견종").replaceWith(result1);
  document.getElementById("등록번호").replaceWith(result2);
  document.getElementById("이름").replaceWith(result3);
  document.getElementById("생일").replaceWith(result4);

  document.getElementById("주소").replaceWith(result9);
  document.getElementById("특징").replaceWith(result10);

  // 선택된 값이 선택창 자리에 들어감
  if (수컷) {
      document.getElementById("성별").replaceWith(result5);
  } else {
      document.getElementById("성별").replaceWith(result6);
  }

  if (중성화함) {
      document.getElementById("중성화여부").replaceWith(result7);
  } else {
      document.getElementById("중성화여부").replaceWith(result8);
  }

  if (!견종 || !등록번호 || !이름 || !생일 || !주소) {
    return;
  }

  // 입력값이 모두 입력되었을 때 html2canvas 함수와 downloadURI 함수 호출
  html2canvas($(".idcard")[0]).then(function(canvas){
      var 댕댕등록증 = canvas.toDataURL();
      downloadURI(댕댕등록증, "댕댕등록증.png");
  });
}

// png 파일을 image uri로 변환
function downloadURI(uri, name) {
    var link = document.createElement("a");
    link.download = name;
    link.href = uri;
    document.body.appendChild(link);
    link.click();
}

document.querySelector('#').addEventListener('submit', function(event) {
    event.preventDefault(); // 폼 제출 이벤트 중단
    downImg(); // downImg 함수 호출
  });
