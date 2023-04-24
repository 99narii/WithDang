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
