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
    <script src='${pageContext.request.contextPath}/resources/script/toggle.js' defer></script>
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
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    ${comuDTO.post_title}  
                </div>  
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${comuDTO.post_id}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${comuDTO.user_name}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${comuDTO.post_created_time}</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${comuDTO.post_view_count}</dd>
                    </dl>
                </div>
                <div class="cont">
                   ${comuDTO.post_content}
                </div>
            </div>

            <!-- 댓글 기능 -->
            <br>
            <div class="comment-form">
                <input type="text" id="nameInput" placeholder="닉네임" >
                <textarea id="commentInput" placeholder="댓글 내용"></textarea>
                <button onclick="submitComment()">댓글 달기</button>
            </div>
            <ul class="comment-list" id="commentList">
                <!-- 여기에 댓글 리스트를 동적으로 추가하거나, 서버에서 댓글 데이터를 받아와서 출력하는 로직을 추가합니다. -->
            </ul>

            </form> 
            <div class="bt_wrap">  
                <a href="${pageContext.request.contextPath}/dangcomu/update?post_id=${comuDTO.post_id}" class="on">수정</a>  
                <a href="${pageContext.request.contextPath}/dangcomu/list">목록</a>  
            </div>
            <br>
        </div>
    </div>
    
    <script>
        // 댓글 입력 폼 제출 스크립트, 하지만 DB 연동 위해서 JSP로 다시 수정해야할 거 같아서
        // 입력 후 css는 만지지 않음
        function submitComment() {
            var name = document.getElementById('nameInput').value;
            var comment = document.getElementById('commentInput').value;

            // 댓글 데이터를 가지고 처리하는 로직
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