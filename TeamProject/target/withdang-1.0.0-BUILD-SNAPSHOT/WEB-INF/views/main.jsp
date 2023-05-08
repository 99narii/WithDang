<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loginout" value="${sessionScope.user==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink" value="${sessionScope.user==null ? '/login' : '/logout' }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="${pageContext.request.contextPath}/resources/script/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/resources/script/maps.js" defer></script>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eb28aa20d7222d5529f51952b8be3c3&libraries=services&"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap"
        rel="stylesheet">

    <title>위드댕</title>
</head>

<body>
    <header>
        <nav class="navbar">

            <div class="navbar__logo">
                <a href="${pageContext.request.contextPath}/main">with DANG</a>
            </div>

            <ul class="navbar__menu">
                <li><a href="${pageContext.request.contextPath}/main">댕댕여지도</a></li>
                <li><a href="${pageContext.request.contextPath}/dangguen">댕근마켓</a></li>
                <li><a href="${pageContext.request.contextPath}/dangcare">댕댕케어</a></li>
                <li><a href="${pageContext.request.contextPath}/dangcomu">댕댕커뮤</a></li>
                <li><a href="${pageContext.request.contextPath}/dangoffice">댕사무소</a></li>
                <li><a href="${pageContext.request.contextPath}/mypage"><i class="fa fa-user-o" id="mypage" aria-hidden="true"></i></a></li>
                <li><button class="btnLogin"><a href="<c:url value='${loginoutlink }' />">${loginout}</a></button></li>
                <c:if test="${ user != null }">
                <li><a href="${pageContext.request.contextPath}/mypage"><i class="fa fa-user-o" id="btnMypage" aria-hidden="true"></i></a></li>
                </c:if>

            </ul>

            <a href="#" class="navbar__toggleBtn">
                <i class="fas fa-bars" aria-hidden="true"></i>
            </a>
        </nav>
    </header>

    <section id="main">
        <div class="main-map">
            <a class="dogicon" style="height: 150px; z-index: 2"><img src="${pageContext.request.contextPath}/resources/image/dogicon.png" /></a>
            <br><br>
            <p class="main-title"> 댕댕여지도</p>

            <div id="map" class="map" style="width: auto; height: 500px;z-index: 1">

            </div>



            <div class="main-side">
                <div class="main-pin">
                    <a href="#" id="pin1"><img src="${pageContext.request.contextPath}/resources/image/pin1.png" alt="핀1"></a>
                </div>
                <div class="main-pin">
                    <a href="#" id="pin2"><img src="${pageContext.request.contextPath}/resources/image/pin2.png" alt="핀2"></a>
                </div>
                <div class="main-pin">
                    <a href="#" id="pin3"><img src="${pageContext.request.contextPath}/resources/image/pin3.png" alt="핀3"></a>
                </div>
                <div class="main-pin">
                    <a href="#" id="pin4"><img src="${pageContext.request.contextPath}/resources/image/pin4.png" alt="핀4"></a>
                </div>
                <div class="main-pin">
                    <a href="#" id="pin5"><img src="${pageContext.request.contextPath}/resources/image/pin5.png" alt="핀5"></a>
                </div>
                <div class="main-pin">
                    <a href="#" id="pin6"><img src="${pageContext.request.contextPath}/resources/image/pin6.png" alt="핀6"></a>
                </div>
            </div>
        </div>

    </section>
    <br><br>
    <article class="main-about">
        <div class="main-btn" width="80%" height="auto">
            <button type="button" id="main-btn" name="petsitter"><a href="dangguen.html">댕근마켓 바로가기▶</a></button>
            <button type="button" id="main-btn" name="pet"><a href="dangcare.html">댕댕케어 바로가기▶</a></button>
        </div>
        <br>
    </article>
    <br><br>
    <footer class="main-about-img">
        <img src="${pageContext.request.contextPath}/resources/image/about.png" width="100%" height="auto">
    </footer>
    <br><br><br><br>






</body>

</html>