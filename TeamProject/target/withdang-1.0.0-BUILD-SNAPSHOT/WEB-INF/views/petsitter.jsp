<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/care.css">
    <script src="./script/toggle.js" defer></script>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>



    <title>펫시터 지원하기</title>
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

    <div class="form-sec">
        <form id="form-pet">
            <h1 id="title-pet">펫시터 지원하기</h1><br>
            <section id="user-form">
                <p>1. 필수정보</p>
                <p></p>
                <p name="user-name">●이름
                <p></p><input type="text" class="input-form" placeholder="실명 입력"></p>
                <p name="user-birth">●생일
                <p></p><input type="number" class="input-form" placeholder="생년월일 8자리로 입력">
                <p>
                    <input type="radio" name="user-gender" value="man">남
                    <input type="radio" name="user-gender" value="woman">여</p>
                </p>

                <p name="user-phone">●연락처
                <p></p><input type="tel" class="input-form" placeholder="숫자로 입력"></p>
                <p name="user-phone">●거주지 주소
                <p></p><input type="text" class="input-form" placeholder="시/군/구까지 입력"></p>
                <p>●거주지 유형</p>
                
                    <input type="radio" name="user-residence" value="S">20평 이하
                    <input type="radio" name="user-residence" value="M">20평 이상
                    <input type="radio" name="user-residence" value="L">마당 있음
                
                <p>●본인/가족구성원 흡연 여부</p>

                <input type="radio" name="user-smoke" value="smoker">예
                <input type="radio" name="user-smoke" value="non-smoker">아니오
                </label>
                <br>
                <hr> <br>
                <p class="cureer">2. 반려동물 경험 및 경력</p>
                <p></p>
                <p>●현재 반려동물이 있습니까?</p>
                <label>
                    <input type="radio" name="user-dogperson" value="Y">있음
                    <input type="radio" name="user-dogperson" value="N">없음
                </label>
                <p>●강아지 반려 경험 유무</p>
                <label>
                    <input type="radio" name="user-doglife" value="Y">있음
                    <input type="radio" name="user-doglife" value="N">없음
                </label>
                <p>●기타 반려 경험 유무(상세히 적어주세요.)</p>
                <textarea style="width:80%; height:100px" class="textarea-form"></textarea>

            </section>
            <button class="sumit-btn" onclick="showAlert()" ><a href="dangcare.html">제출하기</a></button>

        </form>
    </div>
    <script>
		function showAlert() {
			alert("제출이 완료되었습니다.!");
		}
	</script>


</body>

</html>