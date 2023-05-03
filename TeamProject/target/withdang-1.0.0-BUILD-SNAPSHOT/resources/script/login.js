
const contextPath = "/" + window.location.pathname.split("/")[1] ;

/* 유효성 검사 통과유무 변수 */
var emailCheck = true;            // 이메일
var emailckCheck = false;            // 이메일 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var pwdCheckb = false;			// 비번 정규식 확인

$(document).ready(function () {
    $(".btn").click(function () {

        //회원가입 버튼(회원가입 기능 작동)

        /* 입력값 변수 */
        var email = $('.input_email').val();          // 이메일 입력란
        var pw = $('.input_pw').val();                // 비밀번호 입력란
        var pwck = $('.input_pwck').val();            // 비밀번호 확인 입력란
        var name = $('.input_name').val();            // 이름 입력란
        var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글

        /* 이메일 유효성검사 */
        if (email == "") {
            $('.final_email_ck').css('display', 'block');
            emailCheck = false;
        } else {
            $('.final_email_ck').css('display', 'none');
            emailCheck = true;
        }

        //pw검사
        if (pw == "") {
            $('.final_pw_ck').css('display', 'block');
            pwCheck = false;
        } else {
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
            if (!pwdCheck.test(pw)) {
                alert("비밀번호는 최소 8 자, 최소 하나의 문자+하나의 숫자 및 하나의 특수 문자 조합으로 사용해야 합니다.");
                pw.focus();
                pwdCheckb = false;
            } else {
                pwdCheckb = true;
            }
        }

        /* 비밀번호 확인 유효성 검사 */
        if (pwck == "") {
            $('.final_pwck_ck').css('display', 'block');
            pwckCheck = false;
        } else {
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }

        /* 이름 유효성 검사 */
        if (name == "") {
            $('.final_name_ck').css('display', 'block');
            nameCheck = false;
        } else {
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }

        /* 최종 유효성 검사 */
        if (emailCheck && emailckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && pwdCheckb) {
            alert("회원가입이 완료 되었습니다.")
            $("#join_form").attr("action", contextPath+"/join/").submit();
        }else {
            //테스트용
            alert(emailCheck)
            alert(emailckCheck)
            alert(pwCheck)
            alert(pwckCheck)
            alert(pwckcorCheck)
            alert(nameCheck)
            alert(pwdCheckb)
        }
    });

});


//이메일 중복검사
$('.input_email'). change(function(){
    /* console.log("keyup 테스트"); */
    var user_email = $('.input_email').val();			// .id_input에 입력되는 값
    var data = {user_email : user_email}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    $.ajax({
        type : "post",
        url : contextPath+"/emailCheck/",
        data : data,
        success : function(result){
            if(result != 'fail'){
                $('.user_email_re_1').css("display","inline-block");
                $('.user_email_re_2').css("display", "none");
                emailckCheck = true;
            } else {
                $('.user_email_re_2').css("display","inline-block");
                $('.user_email_re_1').css("display", "none");
                emailckCheck = false;
            }

        }// success 종료
    }); // ajax 종료
});// function 종료

/* 비밀번호 확인 일치 유효성 검사 */

$('.input_pwck').on("propertychange change keyup paste input", function(){

    var pw = $('.input_pw').val();
    var pwck = $('.input_pwck').val();
    $('.final_pwck_ck').css('display', 'none');

    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }

});


$(document).ready(function(){
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", contextPath+"/login/").submit();

    });
});