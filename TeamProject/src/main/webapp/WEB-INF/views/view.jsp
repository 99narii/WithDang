<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/comu.css">
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="./script/toggle.js" defer></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>

    <title>댕댕커뮤</title>
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
    <div class="board_wrap">
        <div class="board_title">
            <strong>댕댕커뮤</strong>
            <p>우리 댕댕이 자랑부터 동네 소식까지!</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    글 제목이 들어갑니다.
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>김이름</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2023.04.14</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont">
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다
                </div>
            </div>

            <!-- 댓글 기능 -->
            <br>
            <div class="comment-form">
                <input type="text" id="nameInput" placeholder="닉네임" disabled>
                <textarea id="commentInput" placeholder="댓글 내용"></textarea>
                <button onclick="submitComment()">댓글 달기</button>
            </div>
            <ul class="comment-list" id="commentList">
                <!-- 여기에 댓글 리스트를 동적으로 추가하거나, 서버에서 댓글 데이터를 받아와서 출력하는 로직을 추가합니다. -->
            </ul>




            </form>
            <div class="bt_wrap">
                <a href="edit.jsp" class="on">수정</a>
                <a href="dangcomu.html">목록</a>
            </div>
            <br>
        </div>
    </div>

    <script>
        // 댓글 입력 폼 제출
        function submitComment() {
            var name = document.getElementById('nameInput').value;
            var comment = document.getElementById('commentInput').value;

            // 댓글 데이터를 가지고 처리하는 로직을 추가합니다.
            // 예를 들어, 댓글 데이터를 서버로 전송하거나, 로컬 스토리지에 저장하는 등의 작업을 수행할 수 있습니다.

            // 댓글 리스트에 댓글을 동적으로 추가합니다.
            var commentList = document.getElementById('commentList');
            var li = document.createElement('li');
            li.innerHTML = '<strong>' + name + '</strong><em>' + comment + '</em>';
            commentList.appendChild(li);

            // 댓글 입력 폼 초기화
            document.getElementById('nameInput').value = '';
            document.getElementById('commentInput').value = '';
        }
    </script>






</body>

</html>