<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dangguen.css">

    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/script/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/resources/script/dangguenselect.js"></script>
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
            <a href="">with DANG</a>
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

<section class="dangguen-sec">
    <h2 class="dangguen-title">댕근마켓</h2>
    <div class="alert alert-light" id="dangguen-head" role="alert">


        <select class="form-select" aria-label="category">
            <optgroup label="카테고리">
                <option selected>카테고리</option>
                <option value="1">사료/간식</option>
                <option value="2">영양제</option>
                <option value="3">산책 용품</option>
                <option value="4">집/방석</option>
                <option value="5">옷/악세사리</option>
                <option value="6">위생 용품</option>
                <option value="7">기타 용품</option>
        </select>
        <select class="form-select" id="addressKindU" aria-label="adress"
                name="addressKindU" onchange="addressKindChange(this)">
            <optgroup selected label="지역 설정">
                <option selected disabled>지역 설정</option>
                <option value="1">서울특별시</option>
                <option value="2">경기도</option>
                <option value="3">인천광역시</option>
                <option value="4">부산광역시</option>
                <option value="5">대구광역시</option>
                <option value="6">광주광역시</option>
                <option value="7">대전광역시</option>
                <option value="8">울산광역시</option>
                <option value="9">세종특별자치시</option>
                <option value="10">제주도</option>
                <option value="11">강원도</option>
                <option value="12">충청북도</option>
                <option value="13">충청남도</option>
                <option value="14">전라북도</option>
                <option value="15">전라남도</option>
                <option value="16">경상북도</option>
                <option value="17">경상남도</option>
        </select>

        <select class="form-select" id="addressKindD" name="addressKindD" aria-label="adress">
            <optgroup label="동네 설정">
                <option>선택</option>
            </optgroup>
        </select>
        <select class="form-select" aria-label="adress">
            <optgroup label="동네 설정">
                <option value="0">전체보기</option>
                <option value="1">개포1동</option>
                <option value="2">개포2동</option>
                <option value="3">개포4동</option>
                <option value="4">논현1동</option>
                <option value="5">논현2동</option>
                <option value="6">도곡1동</option>
                <option value="7">도곡2동</option>
                <option value="8">대치1동</option>
                <option value="9">대치2동</option>
                <option value="10">대치4동</option>
                <option value="11">삼성1동</option>
                <option value="12">삼성2동</option>
                <option value="13">신사동</option>
                <option value="14">압구정동</option>
                <option value="15">역삼1동</option>
                <option value="16">역삼2동</option>
                <option value="17">청담동</option>
            </optgroup>
            <optgroup label="">

            </optgroup>
        </select>
        <button type="button" class="dangguen-writing"><a href="dangguenwrite.jsp">글쓰기</a></button>

    </div>

</section>


<!-- Section-->
<article class="dangguen-list">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 양말</a></h5>
                            <!-- Product price-->
                            4,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">발 크림</a></h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">20,000원</span>
                            15,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 우비</a></h5>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">12,000원</span>
                            10,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">배변패드</a></h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                            </div>
                            <!-- Product price-->
                            8,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 리드줄</a></h5>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">6,000원</span>
                            4,500원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 옷</a></h5>
                            <!-- Product price-->
                            3,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 방석</a></h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">20,000원</span>
                            18,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><a href="dangguenView.jsp">강아지 옷걸이</a></h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                            </div>
                            <!-- Product price-->
                            5,000원
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="chat.html">구매하기</a>
                            <a class="btnscrap" href="">찜♥</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
<!--무한스크롤 스크립트-->
<script>
    window.onscroll = function () {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            const toAdd = document.createElement("div");
            const box = document.getElementsByClassName('container');
            const clonedBox = box[0].cloneNode(true); // 첫 번째 card 엘리먼트를 클론합니다.
            toAdd.appendChild(clonedBox); // toAdd 내부에 클론된 card를 추가합니다.
            document.querySelector('article').appendChild(toAdd);
        }
    }
</script>



</body>

</html>