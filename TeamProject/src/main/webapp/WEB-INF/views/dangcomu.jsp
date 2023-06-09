<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginout" value="${sessionScope.member==null ? 'Login' : 'Logout' }" />
<c:set var="loginoutlink" value="${sessionScope.member==null ? '/login' : '/logout' }" />

<!DOCTYPE html>
<html lang="ko">

<head>    <link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico" type="image/x-icon">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/comu2.css'>
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- SweetAlert CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- SweetAlert JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
	
	<style>
	  .selected {
	    background-color: yellow; /* 선택된 요소의 배경색 */
	  }
	</style>
	
	<title>댕댕커뮤</title>
</head>

<body>

    <jsp:include page="header.jsp"></jsp:include>

<div class="board_wrap">
    <div class="board_title">
        <strong>댕댕커뮤</strong>
        <p>우리 댕댕이 자랑부터 동네 소식까지!</p>
    </div>
  
    <script type="text/javascript">
	    $(document).ready(function() {
	        for (let i = 2; i <= 7; i++) {
	            $(".category" + i).on("click", function() {
	                location.href = "<c:url value='/dangcomu/list?post_ctgr_id=" + i + "'/>";
	            })
	        }
	        
	        $(".category1").on("click", function() {
	            location.href = "<c:url value='/dangcomu/list'/>";
	        });
	        
	    });
	</script>
    
    <div class="category-group">
        <button id="ctgr-btn" class="category1">전체</button>
        <button id="ctgr-btn" class="category2">반려소식</button>
        <button id="ctgr-btn" class="category3">반려일상</button>
        <button id="ctgr-btn" class="category4">반려질문</button>
        <button id="ctgr-btn" class="category5">펫과사전</button>
        <button id="ctgr-btn" class="category6">육아꿀팁</button>
        <button id="ctgr-btn" class="category7">기타</button>
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
                <div id="list-cont">
                    <div id="comu-list-num" class="num">${comuDTO.post_id}</div>
                    <div class="title"><a href="${pageContext.request.contextPath}/dangcomu/read${pr.sc.queryString}&post_id=${comuDTO.post_id}">${comuDTO.post_title}</a></div>
                    <div class="writer">${comuDTO.user_name}</div>
                    <div id="comu-list-date" class="date"><fmt:formatDate value="${comuDTO.post_created_time}" pattern="yyyy-MM-dd" type="date"/></div>
                    <div class="count">${comuDTO.post_view_count}</div>
                </div>
            </c:forEach>
        </div>

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
                        <a class="num" href="<c:url value="/dangcomu/list${pr.sc.getQueryString(i)}" />">
                    		  <strong onclick="changeBackground(this)">${i}</strong>
               			</a>
                    </c:forEach>
                    <c:if test="${pr.showNext}">
                        <a class="bt next" href="<c:url value="/dangcomu/list${pr.sc.getQueryString(pr.endPage + 1)}"></c:url>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
        
        <script>
		  function changeBackground(element) {
		    var selectedElements = document.querySelectorAll(".selected");
		    for (var i = 0; i < selectedElements.length; i++) {
		      selectedElements[i].classList.remove("selected");
		    }
		    element.classList.add("selected");
		  }
		</script>
		
        <div class="search-item">
        	<form action='<c:url value="/dangcomu/list"/>' method="get">
	            <select class="search-select" aria-label="category" name="option">
                    <option value="T" ${pr.sc.option == 'T' || pr.sc.option=='' ? "selected" : ""}>제목</option>
                    <option value="C" ${pr.sc.option == 'C' ? "selected" : ""}>내용</option>
                    <option value="W" ${pr.sc.option == 'W' ? "selected" : ""}>닉네임</option>
	            </select>
	            <input type="text" name="keyword" class="search-board" value="${param.keyword}"/>
	            <input type="hidden" name="post_ctgr_id" value="${param.post_ctgr_id}"/>
	            <button type="submit" id="btn-search"><i class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i></button>
            </form>
        </div>
		
      <div class="bt_wrap">
	    <button href="#" onclick="checkLogin(event)" class="on" id="bt-submit">등록</button>
	</div>
	
	<input type="hidden" value="${isLoggedIn}" id="isLoggedIn";>

	<script>
	function checkLogin(event) {
		  event.preventDefault(); // 링크로의 이동 방지

		  // 로그인 체크 로직... 로그인 확인을 어떻게 하지? 
		  var isLoggedIn = document.getElementById("isLoggedIn").value;
		  console.log("isLoggedIn" + isLoggedIn)
		  
		  if (isLoggedIn === 'true') {
		    // 로그인되어 있을 경우 등록 페이지로 이동
		    window.location.href = '${pageContext.request.contextPath}/dangcomu/post';
		  } else {
		    // 로그인되어 있지 않을 경우 알림 창 표시
		    showAlert();
		  }
		}

    function showAlert() {
        Swal.fire({
            title: '알림',
            text: '로그인이 필요합니다.',
            icon: 'info',
            confirmButtonText: '확인'
        }).then(function(result) {
            if (result.isConfirmed) {
                // 확인 버튼 클릭 시 로그인 화면으로 이동
                window.location.href = '${pageContext.request.contextPath}/login';
            }
        });
    }
	</script>
    </div>
</div>

</body>

</html>