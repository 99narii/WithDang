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
            <form class="mypage-chat">
                <div class="chat-list">
                    <div class="chat-listheader">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M21 19.9997C21 20.552 20.5523 20.9997 20 20.9997H4C3.44772 20.9997 3 20.552 3 19.9997V9.48882C3 9.18023 3.14247 8.88893 3.38606 8.69947L11.3861 2.47725C11.7472 2.19639 12.2528 2.19639 12.6139 2.47725L20.6139 8.69947C20.8575 8.88893 21 9.18023 21 9.48882V19.9997ZM19 18.9997V9.97791L12 4.53346L5 9.97791V18.9997H19Z" fill="#000"></path></svg>
                        </div>
                        <form action="">
                            <input type="text">
                            <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M18.031 16.6168L22.3137 20.8995L20.8995 22.3137L16.6168 18.031C15.0769 19.263 13.124 20 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20 13.124 19.263 15.0769 18.031 16.6168ZM16.0247 15.8748C17.2475 14.6146 18 12.8956 18 11C18 7.1325 14.8675 4 11 4C7.1325 4 4 7.1325 4 11C4 14.8675 7.1325 18 11 18C12.8956 18 14.6146 17.2475 15.8748 16.0247L16.0247 15.8748Z" fill="#000"></path></svg></button>
                        </form>
                    </div>
        
                    <div class="chat-listbody">
                        <section class="chat-detail">
                            <div class="chat-leftprofile">
                                <img src="" alt="">
                            </div>
                            <div class="chat-rightprofile">
                                <span class="chat-userid">쫑이사랑</span>
                                <span class="chat-lastchat">넵 이따 만나요!</span>
                            </div>
                        </section>
                        <section class="chat-detail">
                            <div class="chat-leftprofile">
                                <img src="" alt="">
                            </div>
                            <div class="chat-rightprofile">
                                <span class="chat-userid">쫑이사랑</span>
                                <span class="chat-lastchat">넵 이!</span>
                            </div>
                        </section>
                        <section class="chat-detail">
                            <div class="chat-leftprofile">
                                <img src="" alt="">
                            </div>
                            <div class="chat-rightprofile">
                                <span class="chat-userid">쫑이사랑</span>
                                <span class="chat-lastchat">넵 이!</span>
                            </div>
                        </section>
                        <section class="chat-detail">
                            <div class="chat-leftprofile">
                                <img src="" alt="">
                            </div>
                            <div class="chat-rightprofile">
                                <span class="chat-userid">쫑이사랑</span>
                                <span class="chat-lastchat">넵 이!</span>
                            </div>
                        </section>
                        <section class="chat-detail">
                            <div class="chat-leftprofile">
                                <img src="" alt="">
                            </div>
                            <div class="chat-rightprofile">
                                <span class="chat-userid">쫑이사랑</span>
                                <span class="chat-lastchat">넵 이!</span>
                            </div>
                        </section>
                    </div>
        
                    <div class="chat-listfooter">
                        <img src="./image/ad.PNG" alt="">
                    </div>
    
                    <div class="chat-wrapper">
                        <div class="chat-header">
                            <h2>[쫑이사랑]님과의 채팅방</h2>
                            <!-- <div class="chat-header-icons">
                                <span class="icon icon-search"></span>
                                <span class="icon icon-menu"></span>
                            </div> -->
                        </div>
                        <div class="chat-body">
                            <div class="message-bubble received">
                                <div class="message-info">
                                    <div class="message-sender">쫑이사랑</div>
                                    <div class="message-timestamp">오후 2:30</div>
                                </div>
                                <div class="message-content">안녕하세요! 구매 원합니다!</div>
                            </div>
                            <div class="message-bubble sent">
                                <div class="message-info">
                                    <div class="message-timestamp">오후 2:35</div>
                                </div>
                                <div class="message-content">직거래 가능하신가요?</div>
                            </div>
                            <div class="message-bubble received">
                                <div class="message-info">
                                    <div class="message-sender">쫑이사랑</div>
                                    <div class="message-timestamp">오후 2:37</div>
                                </div>
                                <div class="message-content">네! 오늘 저녁 퇴근 후 폴리텍대학교 앞에서 봅시다!</div>
                            </div>
                            <div class="message-bubble sent">
                                <div class="message-info">
                                    <div class="message-timestamp">오후 2:35</div>
                                </div>
                                <div class="message-content">넵 이따 만나요~</div>
                            </div>
                        </div>
                        <div class="chat-footer">
                            <span class="icon icon-plus"></span>
                            <input type="text" placeholder="메시지를 입력하세요...">
                            <span class="icon icon-smile"></span>
                            <button>보내기</button>
                        </div>
                    </div>
                        
                </form>

    </article>

        

</body>

</html>