window.onscroll = function () {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        const toAdd = document.createElement("div");
        const box = document.getElementsByClassName('container');
        const clonedBox = box[0].cloneNode(true); // 첫 번째 card 엘리먼트를 복사
        toAdd.appendChild(clonedBox); // toAdd 내부에 복사된 card를 추가
        document.querySelector('article').appendChild(toAdd);
    }
}

// 댕댕등록증 이미지 미리보기
function previewImage(input) {
    var image = document.getElementById('preview')
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            image.src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
        image.style.width = '220px';
        image.style.height = 'auto';
    } else {
        document.getElementById('preview').src = "";
    }
}


  /*html2canvas*/

  