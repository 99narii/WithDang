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
                <li><a href="main.jsp">댕댕여지도</a></li>
                <li><a href="dangguen.html">댕근마켓</a></li>
                <li><a href="dangcare.html">댕댕케어</a></li>
                <li><a href="dangcomu.html">댕댕커뮤</a></li>
                <li><a href="dangoffice.jsp">댕사무소</a></li>
                <li><button class="btnLogin"><a href="login.jsp">login</a></button></li>
                <li><a href="mypage.html"><i class="fa fa-user-o" id="btnMypage" aria-hidden="true"></i></a></li>

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
                        <li><a href="#">내 정보</a></li>
                        <li><a href="mypage_chat.html">채팅</a></li>
                        <li><a href="">마이댕근</a></li>
                        <li><a href="">마이케어</a></li>
                    </ul>
                </div>
            </div>
        </aside>
            <form class="mypage-user">
                <h1 id="mypage-title">마이댕근</h1>

                <p class="money"> 댕근머니 : 50,000</p>
            <div id="btn_money">
                <a class="money_btn" href="#">충전하기</a>
                <a class="money_btn" href="#">충전하기</a>
            </div>

            </form>

    </article>




    <br><br><br><br>
</body>

</html>