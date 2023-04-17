<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="./favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/login1.css" />
    <script src="/resources/js/login.js"></script>
    <title>Login</title>
    <script
		  src="https://code.jquery.com/jquery-3.4.1.js"
		  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		  crossorigin="anonymous">
	</script>  

</head>

<body>
    <div class="container">
        <div class="orangeBg">
            <div class="box signin">
                <h2>이미 계정이 있습니다.</h2>
                <button class="signinbtn">로그인</button>
            </div>
            <div class="box signup">
                <h2>간편 회원 가입</h2>
                <button class="signupbtn">회원가입</button>
            </div>
        </div>
        <div class="form-box">
            <div class="form signinform">
                <form id="login_form" method="post">
                    <h3>로그인</h3>
                    <input type="text" name="user_email" placeholder="Email">
                    <input type="password" name="user_pw" placeholder="비밀번호">
                    <c:if test = "${result == 0 }">
                    	<div class = "login_warn">사용자 이메일 또는 비밀번호를 잘못 입력하셨습니다.</div>
                    </c:if>
                    	<input type="button" class="login_button" value="로그인">
                    <a href="#">비밀번호를 잊으셨습니까?</a>
                </form>
            </div>
            <div class="form signupform">
                <form id="join_form" method="post">
                    <h3>회원가입</h3>
                    <input type="text"  class="input_name" name="user_name" onkeyup="nameCheck" placeholder="이름">
                    <span class="final_name_ck">이름을 입력해 주세요</span>
                    <input type="email" class="input_email" name="user_email" onkeyup="emailCheck" placeholder="Email">
                    <span class="user_email_re_1">사용 가능한 이메일입니다</span>
					<span class="user_email_re_2">이메일이 이미 존재합니다</span>
					<span class="final_email_ck">이메일을 입력해 주세요</span>
					<sapn class="mail_input_box_warn"></sapn>
                    <input type="password" class="input_pw"  name="user_pw" onkeyup="pwCheck" placeholder="비밀번호">
                    <span class="final_pw_ck">비밀번호를 입력해 주세요</span>
                    <input type="password" class="input_pwck" name="user_pw2" onkeyup="pwckCheck" placeholder="비밀번호 재확인" ><span id ="confirmMsg"></span>
                    <span class="final_pwck_ck">비밀번호 확인을 입력해 주세요</span>
                    <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                	<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                	<input type="button" class="btn" value="가입하기">
                    </form>
            </div>
        </div>
    </div>
    <div class="return-main"><a href="/withdang/">메인화면으로 돌아가기</a></div>
    <script>
    	const signin = document.querySelector(".signinbtn");
        const signup = document.querySelector(".signupbtn");
        const formbox = document.querySelector(".form-box");
        const body = document.querySelector("body");
        signup.onclick = function(){
            formbox.classList.add("active")
            body.classList.add("active")
        }
        signin.onclick = function(){
            formbox.classList.remove("active")
            body.classList.remove("active")
        }
        
        /* 유효성 검사 통과유무 변수 */
	    var emailCheck = false;            // 이메일
	    var emailckCheck = false;            // 이메일 중복 검사
	    var pwCheck = false;            // 비번
	    var pwckCheck = false;            // 비번 확인
	    var pwckcorCheck = false;        // 비번 확인 일치 확인
	    var nameCheck = false;            // 이름
        var pwdCheck = false;			// 비번 정규식 확인	
      	
        $(document).ready(function(){
        	//회원가입 버튼(회원가입 기능 작동)
        	$(".btn").click(function(){
        		
        /* 입력값 변수 */
        var email = $('.input_email').val();          // 이메일 입력란
        var pw = $('.input_pw').val();                // 비밀번호 입력란
        var pwck = $('.input_pwck').val();            // 비밀번호 확인 입력란
        var name = $('.input_name').val();            // 이름 입력란
        var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
               
           /* 이메일 유효성검사 */
           if(email == ""){
               $('.final_email_ck').css('display','block');
               emailCheck = false;
           }else{
               $('.final_email_ck').css('display', 'none');
               emailCheck = true;
           }
        
         
          if(pw == ""){
              $('.final_pw_ck').css('display','block');
              pwCheck = false;
          }else{
              $('.final_pw_ck').css('display', 'none');
              pwCheck = true;
          
              if (!pwdCheck.test(pw)) {
          	    alert("비밀번호는 최소 8 자, 최소 하나의 문자+하나의 숫자 및 하나의 특수 문자 조합으로 사용해야 합니다.");
          	    pw.focus
          	    pwdCheck = false;
          	  } else {
          		  pwdCheck = true;
          	  }
          
          }
        
          
          
          
          
          /* 비밀번호 확인 유효성 검사 */
          if(pwck == ""){
              $('.final_pwck_ck').css('display','block');
              pwckCheck = false;
          }else{
              $('.final_pwck_ck').css('display', 'none');
              pwckCheck = true;
          }
          
          /* 이름 유효성 검사 */
          if(name == ""){
              $('.final_name_ck').css('display','block');
              nameCheck = false;
          }else{
              $('.final_name_ck').css('display', 'none');
              nameCheck = true;
          }
          
          /* 최종 유효성 검사 */
          if(emailCheck&&emailckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&pwdCheck){
   		
          	$("#join_form").attr("action", "/withdang/join");
      		$("#join_form").submit();
          	alert("회원가입이 완료 되었습니다.")
          }    
          
          	return false;
        		
      });
 });
      		
   		//이메일 중복검사
		$('.input_email').on("propertychange change keyup paste input", function(){

		/* console.log("keyup 테스트"); */ 	
		var user_email = $('.input_email').val();			// .id_input에 입력되는 값
		var data = {user_email : user_email}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

		$.ajax({
		type : "post",
		url : "/withdang/emailCheck",
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
 
   	
   	/* $(document).ready(function(){ */
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
    	
    	/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/withdang/login");
        $("#login_form").submit(); 
        
    });
  /*  }); */

        
        </script>
        
</body>

</html>