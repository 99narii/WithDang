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
    <link rel="stylesheet" href="./css/care.css">
    <script src="./script/toggle.js" defer></script>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>



    <title>펫시터 구하기</title>
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

    <div class="form-sec">
        <form id="form-pet">
            <h1 id="title-pet">펫시터 구하기</h1>
            <section id="user-form">
                <p>1. 강아지 정보</p>
                <p></p>
                <p name="pet-name">●이름 </p><input type="text" class="input-form" placeholder="실명 입력"></p>
                <p>●성별</p>
                    <input type="radio" name="dog-gender" value="man">남
                    <input type="radio" name="dog-gender" value="woman">여
                <p>●중성화 여부</p>
                    <input type="radio" name="dog-neuter" value="Y">했음
                    <input type="radio" name="dog-neuter" value="N">안했음
                
                <p name="pet-age">●나이
                <p><input type="number" class="input-form" name="dog-age" placeholder="숫자로 입력"></p>
                <p>●질병 여부(해당된다면 요청사항란에 상세 기제)</p><input type="radio" name="user-gender" value="man">있음
                <input type="radio" name="dog-sickness" value="Y">없음</p>
                <input type="radio" name="dog-sickness" value="N">없음</p>

                <p>●약 복용 여부</p>
                <input type="radio" name="dog-medicine" value="Y">있음
                <input type="radio" name="dog-medicine" value="N">없음</p>
                <p name="adress">●거주지역
                <p></p><input type="text" class="input-form" placeholder="시/군/구까지 입력"></p>
                <hr>
                <p class="cureer">2. 원하는 유형을 골라주세요.</p>
                <p></p>
                <p>●펫시터 유형</p>
                <input type="radio" name="petsitter-type" value="athome">방문 펫시터
                <input type="radio" name="petsitter-type" value="consign">위탁 펫시터
                <input type="radio" name="petsitter-type" value="discussion">상의 후 결정
                <p>●펫시팅 기간</p>
                    <P id="date-type"><input type="date" class="date-type" name="start" value="start">시작일<br>
                <input type="date" class="date-type" name="start" value="start">종료일</P>

                <p>●펫시팅을 원하는 반려동물 수</p>
                <input type="radio" name="dog-object" value="1">1마리
                <input type="radio" name="dog-object" value="2">2마리
                <input type="radio" name="dog-object" value="3">3마리
                <input type="radio" name="dog-object" value="over4">4마리이상


                <p>●펫시팅 경험 유무</p>
                <input type="radio" name="user-experience" value="Y">있음
                <input type="radio" name="user-experience" value="N">없음
                <p>●요청사항(상세히 기제)</p>
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