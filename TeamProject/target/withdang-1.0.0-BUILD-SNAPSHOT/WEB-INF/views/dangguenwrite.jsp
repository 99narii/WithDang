<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/dangguenwrite.css">
    <script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="./script/main.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>

    <title>댕근마켓 게시글쓰기</title>
</head>

<body>
    <header>
        <nav class="navbar">

            <div class="navbar__logo">
                <a href="">with DANG</a>
            </div>

            <ul class="navbar__menu">
                <li><a href="main.html">댕댕여지도</a></li>
                <li><a href="dangguen.html">댕근마켓</a></li>
                <li><a href="dangcare.html">댕댕케어</a></li>
                <li><a href="dangcomu.html">댕댕커뮤</a></li>
                <li><a href="dangoffice.html">댕사무소</a></li>
                <li><button class="btnLogin"><a href="login.html">login</a></button></li>
                <li><a href="mypage.html"><i class="fa fa-user-o" id="mypage" aria-hidden="true"></i></a></li>

            </ul>
            <a href="#" class="navbar__toggleBtn">
                <i class="fas fa-bars" aria-hidden="true"></i>
            </a>
        </nav>
    </header>

    <div class="board_wrap">
        <div class="board_title">
            <strong>댕근마켓</strong>
            <p>우리 댕댕이 용품 중고거래</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <section class="dangguen-sec">
                    <div class="info">
                        <dl>
                            <dt>글쓴이</dt>
                            <dd><input type="text" placeholder="글쓴이 입력"></dd>
                        </dl>
                     
                        <div id="dangguen-img">
                            <input id="imageinput" type="file" accept=".jpg, .jpeg, .png" onchange="previewImage(this)" required>
                            <img id="preview" />
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
                                <select class="form-select" aria-label="adress">
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
    
                          
                            
                        </div>
        

                        </div>
                        <div class="cont">
                            <textarea placeholder="내용 입력"></textarea>
                        </div>
                    </div>
                    <div class="bt_wrap">
                        <a href="view.html" class="on">등록</a>
                        <a href="dangcomu.html">취소</a>
                    </div>
            </div>
        </div>

</body>

</html>