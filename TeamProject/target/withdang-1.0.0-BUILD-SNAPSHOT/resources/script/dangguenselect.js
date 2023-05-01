function addressKindChange(e) {
    var seoul = ["강남구", "마포구", "용산구", ""];
    var gyeonggi = ["수원시", "평택시", "용인시"];
    var incheon = ["", "",];
    var target = document.getElementById("addressKindD");
    
    if(e.value == "1") var d = seoul;
    else if(e.value == "2") var d = gyeonggi;
    
    target.options.length = 0;
    
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }
    
}