<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginout" value="${sessionScope.member==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink" value="${sessionScope.member==null ? '/login' : '/logout' }" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/script/toggle.js" defer></script>
    <script src="${pageContext.request.contextPath}/resources/script/html2canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/script/dangoffice.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <style type="text/css">
    #pwChange-Form {
    background-color: #9d8db3;
    padding: 40px;
    border-radius: 10px;
    color: #fff;
    text-align: center;
    width: 300px;
    }
    </style>
    <title>비밀번호 찾기</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    
<div id="Chk-form">

<!-- 입력한 정보가 일치하지 않을 때-->
	<c:if test="${check == 1}">
	<!-- <i class="fa-solid fa-circle-exclamation" style="color: #fffff; font-size: 35px;"></i> -->
	 <div>
	    <sapn><h2>입력하신 정보가 없거나 일치하지 않습니다.</h2></sapn>
	    <span><a href="/withdang/login">로그인으로 돌아가기</a></span> |
	    <span><a href="/withdang/pwdFind">다시 찾기</a></span>
	 </div>
	</c:if>
	
	<!-- 입력한 정보 일치 -->
	<c:if test="${check == 0 }">
	    <form id="pwChange-Form" method="post">
	    	    <h2>비밀번호 변경</h2>
	    
		    <input id="text-box" type="hidden" name="user_email" value="${pwd.user_email }">
		    <input id="text-box" type="hidden" name="user_name" value="${pwd.user_name }">
		    <input id="text-box" type="hidden" name="user_nickname" value="${pwd.user_nickname }">
		    <input id="text-box" type="password" class="input_pw" name="user_pw" placeholder="비밀번호를 입력해주세요"><br>
		    <input id="text-box" type="password" class="input_pwck" placeholder="비밀번호 확인">
		    <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
		    <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		    <span class="info_ck">비밀번호를 입력해주세요.</span>
			<br>
			<button type="button" class="pwd-submit-btn">비밀번호 변경</button>
			<div><a href="/withdang/login">로그인으로 돌아가기</a> |
		    <a href="/withdang/pwdFind">다시 찾기</a></div>
		</form>
	</c:if>
</div>

<script type="text/javascript">
	
	var pwCheck = false;            // 비번
	var pwckCheck = false;            // 비번 확인
	var pwckcorCheck = false;        // 비번 확인 일치 확인
	var pwdCheck = false;			// 비번 정규식 확인
	
	$(document).ready(function() {
		
		//비밀번호 변경 버튼(비밀번호 변경 기능 작동)
		$(".pwd-submit-btn").click(function() {
		
		/* 입력값 변수 */
		var pw = $('.input_pw').val();			// 비밀번호 입력란
		var pwck = $('.input_pwck').val();		// 비밀번호 확인 입력란
		var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;	// 비밀번호 정규식 변수
		
		/*	비밀번호 유효성 검사 */
        if(pw == "") {
            pwCheck = false;
            $('.info_ck').css('display','block');
         } else {
        	 $('.info_ck').css('display','none');
            pwCheck = true;
            
        /* 비밀번호 정규식 검사 */
        if(!pwdCheck.test(pw)) {
        	swal.fire({
     			text: '비밀번호는 최소 8 자, 최소 하나의 문자+하나의 숫자 및 하나의 특수 문자 조합으로 사용해야 합니다.',
     			icon: 'warning',
     			confirmButtonText: '확인',
     		});        
           pw.focus
           pwdCheck = false;
       } else {
          pwdCheck = true;
           }      
          }
                  
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == "") {
        	$('.info_ck').css('display','block');
            pwckCheck = false;
        } else {
        	$('.info_ck').css('display','none');
            pwckCheck = true;
        }

      if(pwckcorCheck&&pwdCheck&&pwCheck&&pwckCheck) {
         $("#pwChange-Form").attr("action", "/withdang/pwUpdate");
            $("#pwChange-Form").submit();
      }
         return false;
     });
         
   });
   
  	$('.input_pw').on("propertychange change keyup paste input", function() {
  		var pw = $('.input_pw').val();
  		
		if(pw != "") $('.info_ck').css('display','none');
	})
	
	 /* 비밀번호 확인 일치 유효성 검사 */
      $('.input_pwck').on("propertychange change keyup paste input", function(){
              
         var pw = $('.input_pw').val();
          var pwck = $('.input_pwck').val();
            
        	  if(pw == pwck){
                  $('.pwck_input_re_1').css('display','block');
                  $('.pwck_input_re_2').css('display','none');
                  pwckcorCheck = true;
              } else {
                 $('.pwck_input_re_1').css('display','none');
                  $('.pwck_input_re_2').css('display','block');
                  pwckcorCheck = false;             
              }                    
      });
</script>

</body>
</html>