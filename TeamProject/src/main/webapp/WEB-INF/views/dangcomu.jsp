<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/comu.css'>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <script src='${pageContext.request.contextPath}/resources/script/toggle.js' defer></script>

    <title>댕댕커뮤</title>
</head>

<body>
    <header>
        <nav class="navbar">

            <div class="navbar__logo">
                <a href="main.html">with DANG</a>
            </div>

            <ul class="navbar__menu">
                <li><a href="main.html">댕댕여지도</a></li>
                <li><a href="dangguen.html">댕근마켓</a></li>
                <li><a href="dangcare.html">댕댕케어</a></li>
                <li><a href="dangcomu.html">댕댕커뮤</a></li>
                <li><a href="dangoffice.html">댕사무소</a></li>
                <li><button class="btnLogin"><a href="login.html">login</a></button></li>
                <li><a href="mypage.html"><i class="fa fa-user-o" id="btnMypage" aria-hidden="true"></i></a></li>

            </ul>
            <a href="#" class="navbar__toggleBtn">
                <i class="fas fa-bars" aria-hidden="true"></i>
            </a>
        </nav>

    </header>
    <div class="board_wrap">
        <div class="board_title">
            <strong>댕댕커뮤</strong>
            <p>우리 댕댕이 자랑부터 동네 소식까지!</p>
        </div>
        <div class="category-group">
            <button class="category1">전체</button>
            <button class="category2">반려소식</button>
            <button class="category3">반려일상</button>
            <button class="category4">반려질문</button>
            <button class="category5">펫과사전</button>
            <button class="category6">육아꿀팁</button>
            <button class="category7">기타</button>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">닉네임</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                <c:forEach var="comuDTO" items="${list}">
                	<div>
                    <div class="num">${comuDTO.post_id}</div>
                    <div class="title"><a href="${pageContext.request.contextPath}/dangcomu/read${pr.sc.queryString}&post_id=${comuDTO.post_id}">${comuDTO.post_title}</a></div>
                    <div class="writer">${comuDTO.user_name}</div>
                    <div class="date">${comuDTO.post_created_time}</div>
                    <div class="count">${comuDTO.post_view_count}</div>
                </div>
                </c:forEach>
            </div>
            <!-- <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div> -->
            
            <div class="board_page">
             <div class="paging">
                <c:if test="${totalCnt == null || totalCnt == 0}">
                   <div>게시물이 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt != null || totalCnt != 0}">
                   <c:if test="${pr.showPrev}">
                      <a class="bt prev" href="<c:url value="/dangcomu/list${pr.sc.getQueryString(pr.beginPage - 1)}"></c:url>">&lt;</a>
                   </c:if>
                   <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage }">
                      <a class="num" href="<c:url value="/dangcomu/list${pr.sc.getQueryString(i)}" />">${i}</a>
                   </c:forEach>
                   <c:if test="${pr.showNext}">
                      <a class="bt next" href="<c:url value="/dangcomu/list${pr.sc.getQueryString(pr.endPage + 1)}"></c:url>">&gt;</a>
                   </c:if>
                </c:if>
             </div>
          </div>
            
            
            <div class="search-item">
                <select class="search-select" aria-label="category">
                    <optgroup label="제목">
                        <option selected>제목</option>
                        <option value="1">내용</option>
                        <option value="2">닉네임</option>
                </select>
                <input type="text" class="search-board" />
                <button id="btn-search">검색</button>
            </div>

            <div class="bt_wrap">
                <a href="write.html" class="on">등록</a>
            </div>
        </div>
    </div>

</body>

</html>