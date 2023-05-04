<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mypage.css">
    <script src="./script/toggle.js" defer></script>

    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>

    <title>마이페이지</title>
</head>

<body>
    <header>
        <nav class="navbar">

            <div class="navbar__logo">
                <a href="main.jsp">with DANG</a>
            </div>

            <ul class="navbar__menu">
                <li><a href="${pageContext.request.contextPath}/main">댕댕여지도</a></li>
                <li><a href="${pageContext.request.contextPath}/dangguen">댕근마켓</a></li>
                <li><a href="${pageContext.request.contextPath}/dangcare">댕댕케어</a></li>
                <li><a href="${pageContext.request.contextPath}/dangcomu">댕댕커뮤</a></li>
                <li><a href="${pageContext.request.contextPath}/dangoffice">댕사무소</a></li>
                <li><button class="btnLogin"><a href="${pageContext.request.contextPath}/login">login</a></button></li>
                <li><a href="${pageContext.request.contextPath}/mypage"><i class="fa fa-user-o" id="btnMypage" aria-hidden="true"></i></a></li>

            </ul>
            <a href="#" class="navbar__toggleBtn">
                <i class="fas fa-bars" aria-hidden="true"></i>
            </a>
        </nav>
    </header>
    <br>
    <article id="mypage">
        <aside class="mypage_aside">
            <div class="mypage__profile">
                <div>
                    <img src="./image/profile.png" alt="프로필사진">
                </div>
                <p>쫑이님 안녕하세요</p>
                <hr class="profile-line">
                <div class="mypage__list">
                    <ul>
                        <li><a href="">내 정보</a></li>
                        <li><a href="">강아지 정보</a></li>
                        <li><a href="mypage_chat.html">채팅</a></li>
                        <li><a href="">판매 목록</a></li>
                        <li><a href="">찜 목록</a></li>
                    </ul>
                </div>
            </div>
        </aside>
        <form class="mypage-user">
            <ul>
                <p class="user-info"> 내 정보</p>
                <div><span>이름 : </span> 위드댕 </div>
                <div>
                    <p>이메일 : withdang@gmail.com</p>
                </div>
                <p>비밀번호 변경 : <input></p>
                <p>비밀번호 확인 : <input></p>
                <div>
                    <p>닉네임 : <input></p>
                </div>
                <div>
                    <p>연락처 : <input></p>
                </div>
                <div>
                    <p>생일 : <input type="date"></p>
                </div>
                <div>
                    <p>성별 : 여</p>
                </div>
                <div>
                    <p>주소 : <input></p>
                </div>

            </ul>
            <hr />

            <div class="mypage-dog">
                <ul>
                    <p class="dog-info">강아지 정보</p>
                    <p>이름 : <input></p>
                    <p>생일 : <input type="date"></p>
                    <p>성별 : <input type="radio">수컷<input type="radio">암컷</p>
                    <p>중성화 : <input type="radio">O<input type="radio">X</p>
                    <p>견종 : <input></p>
                    <p>동물등록번호 : <input> </p>
                    <p>주소 : <input></p>
                    <p>특징 : </p><textarea></textarea>

                </ul>
            </div>
        </form>
    </article>

    <footer>
        <div class="mypage__update">
            <br>
            <a class="update_btn" href="mypage.html">수정하기</a>
        </div>
    </footer>
    <br><br><br><br>
</body>

</html>