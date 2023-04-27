<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginout" value="${member==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink" value="${member==null ? '/login' : '/logout' }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="<c:url value="/resources/image/favicon.ico"/>" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/care.css"/>">
    <script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/js/main.js"/>" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>

    <title>댕댕케어</title>
</head>

<body>
    <header>
        <nav class="navbar">

            <div class="navbar__logo">
                <a href="">with DANG</a>
            </div>
            <ul class="navbar__menu">
                <li><a href="<c:url value="/main"/>">댕댕여지도</a></li>
                <li><a href="<c:url value="/dangguen"/>">댕근마켓</a></li>
                <li><a href="<c:url value="/dangcare"/>">댕댕케어</a></li>
                <li><a href="<c:url value="/dangcomu"/>">댕댕커뮤</a></li>
                <li><a href="<c:url value="/dangoffice"/>">댕사무소</a></li>
                <c:if test="${ member != null }">
                    <li><a href="<c:url value="/mypage"/>"><i class="fa fa-user-o" id="mypage" aria-hidden="true"></i></a></li>
                </c:if>
                <li><button class="btnLogin"><a href="<c:url value='${loginoutlink }' />">${loginout}</a></button></li>



            </ul>
            <a href="#" class="navbar__toggleBtn">
                <i class="fas fa-bars" aria-hidden="true"></i>
            </a>
        </nav>
    </header>

    <section class="caremain">
        <p></p>
        <img src="<c:url value="/resources/image/caremain.png"/>"  class="care-img" width="80%" height="auto" />
        <p></p>
        <div class="petbtn">
            <button type="button" id="petbtn" name="petsitter"><a href="petsitter.html">펫시터 지원합니다.</a></button>
            <button type="button" id="petbtn" name="pet"><a href="petsitter.html">펫시터 구합니다.</a></button>
        </div>
        <div id="care-text" classW="typewriter-effect">
            <div class="text" id="typewriter-text"></div>
        </div>
        <p></p>
        <img src="<c:url value="/resources/image/process.png"/>" class="care-img" width="80%" height="auto"/>



    </section>
    <footer>
    </footer>



</body>

</html>