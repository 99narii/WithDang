<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
    <script src="${pageContext.request.contextPath}/resources/script/login.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>로그인</title>
    

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
                    <input type="text" name="id" placeholder="Email">
                    <input type="password" name="pw" placeholder="비밀번호">
                    <c:if test = "${result == 0 }">
                        <div class = "login_warn">사용자 이메일 또는 비밀번호를 잘못 입력하셨습니다.</div>
                    </c:if>
                    <input type="submit" value="로그인">
                    <a href="#">비밀번호를 잊으셨습니까?</a>
                </form>
            </div>
            <div class="form signupform">
                <form id="join_form" method="post">
                    <h3>회원가입</h3>
                    <input type="text"  class="input_name" name="name" onkeyup="nameCheck" placeholder="이름">
                    <span class="final_name_ck">이름을 입력해 주세요</span>
                    <input type="email" class="input_email" name="id" onkeyup="emailCheck" placeholder="Email">
                    <span class="user_email_re_1">사용 가능한 이메일입니다</span>
                    <span class="user_email_re_2">이메일이 이미 존재합니다</span>
                    <span class="final_email_ck">이메일을 입력해 주세요</span>
                    <sapn class="mail_input_box_warn"></sapn>
                    <input type="password" class="input_pw"  name="pw" onkeyup="pwCheck" placeholder="비밀번호">
                    <span class="final_pw_ck">비밀번호를 입력해 주세요</span>
                    <input type="password" class="input_pwck" name="user_pw2" onkeyup="pwckCheck" placeholder="비밀번호 재확인" ><span id ="confirmMsg"></span>
                    <span class="final_pwck_ck">비밀번호 확인을 입력해 주세요</span>
                    <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                    <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                    <div class="user-pet">반려견 여부 
                        <input type="radio" id="radio" name="user-pet" value="T">있음
                        <input type="radio" id="radio" name="user-pet" value="F">없음</div>
                    <div id="register-policy"><input type="checkbox" id="register-check" name="register-check" value="T">회원가입 약관에 동의합니다.</div>
                    <input type="button" class="join_btn" value="가입하기">
                </form>
            </div>
        </div>
    </div>
    <div class="return-main"><a href="${pageContext.request.contextPath}/main">메인화면으로 돌아가기</a></div>
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
</script>
</body>

</html>