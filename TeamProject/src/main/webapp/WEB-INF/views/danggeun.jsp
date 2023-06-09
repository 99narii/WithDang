<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginEmail" value="${sessionScope.email}" />
<c:set var="loginNickname" value="${sessionScope.nickname}" />
<c:set var="loginout" value="${sessionScope.email==null ? 'Login' : 'Logout'}" />
<c:set var="loginoutlink" value="${sessionScope.email==null ? '/login/login' : '/login/logout'}" />

<!DOCTYPE html>
<html lang="ko">
<head>    <link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico" type="image/x-icon">

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/resources/css/danggenn.css' />">
    <script src="https://kit.fontawesome.com/cac1ec65f4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <style type="text/css">

* {
    font-family: 'NanumSquareNeo-Variable';
    margin: 0;
}

a {
    text-decoration: none;
    color: #fff;
}

#card-list {
    width: 90%;
    text-align: center;
    margin: 0% 10% auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    
    
}

#list {
    width: 88%;
    display: flex;
    flex-wrap: wrap;
    justify-content: left;
    text-align: center;
}

.card {
    width: calc(25% - 20px);
    width: 230px;
    border: none;
    background-color: #d7e7e491;
    border-radius: 5px;
    padding: 10px;
    margin: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.card img {
	width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 12px;
}

.card h2 {
    margin-bottom: 10px;
    font-size: 18px;
    text-align: center;
}

.card li {
    margin-bottom: 3px;
    font-size: 10px;
    text-align: center;
    list-style-type: none;
    color: black;
}

.card {
    font-weight: bold;
    margin-bottom: 10px;
}

.buy-btn {
    width: 80px;
    height: 25px;
    border: none;
    background-color: #8e8bac;
    border-radius: 5px;
}
.buy-btn a {
    color: #fff;
}



.scrap-btn {
    width: 50px;
    height: 25px;
    border: none;
    border-radius: 5px;
    background-color: #736187;
    color: #fff;
    cursor: pointer;
}

.search-box {
    width: 300px;
    height: 35px;
    border: none;
    margin: 5px;
}


.dangguen-title {
    font-size: 44px;
    font-weight: bolder;
    color: black;
    font-family: 'Gaegu', cursive !important;
    padding-top: 30px;
    text-align: center;
}

.dangguen-sec {
    width: 100%;
    background-color: #d7e7e491;
}

.btn-write {
    border-radius: 10px;
    background-color: #ed8b9e;
    border: none;
    width: 120px;
    height: 35px;
    font-weight: 900;
    color: #fff;
    margin-right: 15px;
    flex: 0 0 auto;
}
.btn-write a {
	color: #fff;
}

.btn-search {
    border-radius: 10px;
    background-color: #8e8bac;
    border: none;
    width: 120px;
    height: 35px;
    font-weight: 900;
    color: #fff;
    margin: 5px;
    flex: 0 0 auto;
}

#dangguen-head {
    margin: 0%;
    text-align: center;
    width: 100%;
}

.form-select {
    width: 170px;
    border: none;
    padding: 0;
    margin: 10px;
    height: 35px;
    border-radius: 10px;
    font-weight: 600;
    font-size: 0.8rem;
}

.img-sec {
    height: 100px;
    background-color: tomato;
    margin: 3% 5% 1% 5%;
    padding: 5%;
    border: 1px solid #ffffffb0;
    display: inline-flex;
    width: 80%;
}


#imageinput {
    text-align: center;
    align-items: center;
    margin: 0% 15% 0%;
}

#preview {
    margin: 3% 2% 0% 4%;
}
        .paging-container {
        	width: 100%;
        	height: 70px;
        	display: flex;
        	margin: auto;
        }
        .paging {
        	color: black;
        	width: 100%;
        	text-align: center;
        	padding: 15px;
        }
        .page {
        	width: 20px;
        	height: 20px;
        	color: black;
        	padding: 6px;
        	margin-right: 10px;
        	cursor: pointer;
        }
@media (max-width: 786px) {
  #dangguen-img {
    margin: 1% 5%;
  }

  #imageinput {
      text-align: center;
      align-items: center;
      
  }
  
  #list {
  	margin: 0px;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  }
 
  #card-list {
  width: 100%;
  text-align: center;
  margin: 0% 1% auto;
    display: flex;
    flex-direction: column;
  justify-content: center;
    align-items: center;


}

  .btn-search {
    border-radius: 10px;
    background-color: #8e8bac;
    border: none;
    width: 65px;
    height: 35px;
    font-weight: 900;
    color: #fff;
    margin: 2px;
  }
  
    .btn-write {
    width: 65%;
    color: #fff;
    text-decoration: none;
   	margin: 1px;
  }
  #search-select {
  	width: 90px;
  	margin: 5px;
  }
  .search-box {
  	width: 160px;
  }
  
  .form-select {
  	margin: 5px;
  }

}
#card-title {
	color: black;
}

#user-name {
  padding-top: 2%;
  font-size: 14px;
  font-weight: bold;
  color: black;
}
#user-adress {
  font-size: 12px;
  margin: 2%;
}
.price {
	font-size: 14px;
}


.type_name {
	margin: 2px;
	font-size: 11px;
	padding:3px;
	background-color: #3e3e3e;
	border-radius: 5px;
	color: #fff;
	font-weight: normal;

}

#search-set {
	width: 100%;
}
#select-set {
	width: 100%;
	position: inherit;
}
.user-name {

}

		  
    </style>


    <title>댕근마켓</title>
</head>

<body>

    <script>
    	let msg = "${msg}"
    	if(msg == "DEL_OK") alert("성공적으로 삭제되었습니다.")
    	if(msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.")
    	if(msg == "WRT_OK") alert("성공적으로 등록되었습니다.")
    	if(msg == "MOD_OK") alert("성공적으로 수정되었습니다.")
    	if(msg == "SCR_ERR") alert("찜 실패했습니다.")
    	if(msg == "CAN_ERR") alert("찜 취소에 실패했습니다.")
    </script>
    <jsp:include page="websocket.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>


<!-- 댕근 헤더 부분 -->
    <section class="dangguen-sec">
        <h2 class="dangguen-title">댕근마켓</h2>
        <div class="alert alert-light" id="dangguen-head" role="alert">
			<form action="<c:url value='/danggeun/list' />" method="get">
			<div id="select-set">
	            <select class="form-select" aria-label="category" name="type_id">
	                    <c:forEach var="DanggeunTypeDTO" items="${typeList}">
	                    	<option value="${DanggeunTypeDTO.id}" ${dpr.dsc.type_id == DanggeunTypeDTO.id ? "selected" : ""}>${DanggeunTypeDTO.name}</option>
	                    </c:forEach>
	            </select>
	            <select class="form-select" aria-label="category" id="sido_code" name="sido_code">
					<option value="0">전체</option>
				</select>
				<select class="form-select" aria-label="category" id="sigoon_code" name="sigoon_code">
					<option value="0">전체</option>
				</select>
				<select class="form-select" aria-label="category" id="dong_code" name="dong_code">
					<option value="0">전체</option>
				</select><br>
				</div>
				<div id="search-set">
				<select class="form-select" id="search-select" aria-label="category"  name="option">
	            	<option value="A" ${dpr.dsc.option=='A' ? "selected" : ""}>제목+내용</option>
	            	<option value="T" ${dpr.dsc.option=='T' ? "selected" : ""}>제목</option>
	            	<option value="W" ${dpr.dsc.option=='W' ? "selected" : ""}>작성자</option>
	            </select>
	            <!-- 검색박스 추가 -->
	            <input type="text" class="search-box" name="keyword" value="${dpr.dsc.keyword}" placeholder="검색어를 입력해주세요">
	            <button type="submit" class="btn-search">검색</button>
	        
	            <button type="button" class="btn-write"><a href="<c:url value='/danggeun/write' />">글쓰기</a></button>
	        </div>
	        </form>
        </div>
    </section>
<!-- 댕근 헤더 끝 -->


    
    <!-- 상품 리스트 시작 card-list가 전체 -->
    <div id="card-list">
    	<div id="list">
    		<c:forEach var="DanggeunInfoDTO" items="${list}">
    			<div class="card">
    				<div class="img">
		           		<img src="${DanggeunInfoDTO.photo_address}" alt="Product Image">
		           	</div>
		           	<h2><a id="card-title" href="<c:url value='/danggeun/view${dpr.dsc.queryString}&id=${DanggeunInfoDTO.id}' />">${DanggeunInfoDTO.title}</a></h2>
		           	<p class="price">${DanggeunInfoDTO.price}원
		           	<span class="type_name">${DanggeunInfoDTO.type_name}</span></p>
		           	<li id="user-name">${DanggeunInfoDTO.writer_nickname}</li>
		           	<li id="user-adress">${DanggeunInfoDTO.sido_name} ${DanggeunInfoDTO.sigoon_name} ${DanggeunInfoDTO.dong_name}</li>
		           	<div>
		           		<c:if test="${DanggeunInfoDTO.zzimed == true}">
		           			<button class="scrap-btn" data-isScrap="1" data-id="${DanggeunInfoDTO.id}" data-writerNickname="${DanggeunInfoDTO.writer_nickname}" style="background-color: #ed8b9e;">찜♥</button>
		           		</c:if>
		           		<c:if test="${DanggeunInfoDTO.zzimed == false}">
		           			<button class="scrap-btn" data-isScrap="0" data-id="${DanggeunInfoDTO.id}" data-writerNickname="${DanggeunInfoDTO.writer_nickname}" sytle="background-color: #736187;">찜♥</button>
		           		</c:if>
		           	</div>
	       		</div>
    		</c:forEach>
       	</div>
    </div>
    
    <div class="paging-container">
    	<div class="paging">
    		<c:if test="${totalCnt == null || totalCnt == 0}">
    			<div>게시물이 없습니다.</div>
    		</c:if>
    		<c:if test="${totalCnt != null && totalCnt != 0}">
    			<c:if test="${dpr.showPrev}">
    				<a class="page" href="<c:url value='/danggeun/list${dpr.dsc.getQueryString(dpr.beginPage-1)}' />">&lt;</a>
    			</c:if>
    			<c:forEach var="i" begin="${dpr.beginPage}" end="${dpr.endPage}">
    				<a class="page" href="<c:url value='/danggeun/list${dpr.dsc.getQueryString(i)}' />" style="${dpr.dsc.page == i ? 'text-decoration: 2px underline; text-underline-offset : 3px;' : ''}">${i}</a>
    			</c:forEach>
    			<c:if test="${dpr.showNext}">
    				<a class="page" href="<c:url value='/danggeun/list${dpr.dsc.getQueryString(dpr.endPage+1)}' />">&gt;</a>
    			</c:if>
    		</c:if>
    	</div>
    </div>
    
<script type="text/javascript">
    $(document).ready(function(){
    	let loginNickname = '${loginNickname}'
        let sido_code = '${dpr.dsc.sido_code}'
        let sigoon_code = '${dpr.dsc.sigoon_code}'
        let dong_code = '${dpr.dsc.dong_code}'
      	
    	$.ajax({
        	type: 'get',
    		url: '/withdang/danggeun/sido',
    		async: false,
    		headers: { "content-type" : "application/json" },  //요청헤더
    		success: function(result) {
    			let html = "<option value='0'>전체</option>";
    			
    			result.forEach(function(c){
    				let code = c.code 
    				let name = c.name
    			    if (code === sido_code) {
    			        html += '<option value="' + code + '" selected>' + name + '</option>';
    			    } 
    			    else {
    			        html += '<option value="' + code + '">' + name + '</option>';
    			    }
    			})

    			$('#sido_code').html(html);
            },
            error: function() {alert('error')}
        })
        
        $('#sido_code').on('change', function(){
        	let thisVal = $(this).val()
        	if(thisVal === '0') {
        		$('#sigoon_code').html("<option value='0'>전체</option>");
        		$('#dong_code').html("<option value='0'>전체</option>");
        		return
        	}
        	
    		$('#dong_code').html("<option value='0'>전체</option>");
        	
    		$.ajax({
	        	type: 'get',
	    		url: '/withdang/danggeun/sigoon?ctprvn_cd=' + thisVal,
	    		async: false,
	    		headers: { "content-type" : "application/json" },  //요청헤더
	    		success: function(result) {
	    			let html = "<option value='0'>전체</option>";
	    			
	    			result.forEach(function(c){
	    				let code = c.code 
	    				let name = c.name
	    			    if (code === sigoon_code) {
	    			        html += '<option value="' + code + '" selected>' + name + '</option>';
	    			    } 
	    			    else {
	    			        html += '<option value="' + code + '">' + name + '</option>';
	    			    }
	    			})
	
	    			$('#sigoon_code').html(html);
	            },
	            error: function() {alert('error')}
        	})
        })
        
        $('#sigoon_code').on('change', function(){
        	let thisVal = $(this).val()
        	if(thisVal === '0') {
        		$('#dong_code').html("<option value='0'>전체</option>");
        		return
        	}
        	$.ajax({
	        	type: 'get',
	    		url: '/withdang/danggeun/dong?sig_cd=' + thisVal,
	    		async: false,
	    		headers: { "content-type" : "application/json" },  //요청헤더
	    		success: function(result) {
	    			let html = "<option value='0'>전체</option>";
	    			
	    			result.forEach(function(c){
	    				let code = c.code 
	    				let name = c.name
	    			    if (code === dong_code) {
	    			        html += '<option value="' + code + '" selected>' + name + '</option>';
	    			    } 
	    			    else {
	    			        html += '<option value="' + code + '">' + name + '</option>';
	    			    }
	    			})
	
	    			$('#dong_code').html(html);
	            },
	            error: function() {alert('error')}
        	})
        })
        
		if (sido_code !== '0') {
		    $('#sido_code').val(sido_code);
		    $('#sido_code').trigger('change');
		    $('#sigoon_code').val(sigoon_code);
			$('#sigoon_code').trigger('change');
		}
        
        $(".scrap-btn").on('click', function() {
            let button = $(this); // 버튼 객체를 저장
            let id = $(this).attr("data-id")
            let writerNickname = $(this).attr("data-writerNickname")
            let isScrap = $(this).attr("data-isScrap")
            
            if(loginNickname === writerNickname) {
            	return alert("본인 상품을 찜할 수 없습니다.")
            }
            
            if(isScrap === "1"){
	            $.ajax({
	                type: 'POST',
	                url: '/withdang/danggeun/cancelzzim',
	                data: {
	                    'danggeun_id': id,
	                    'user_nickname': loginNickname
	                },
	                success: function(response) {
	                	button.attr("data-isScrap", "0")
	                	button.css('background-color', '#736187')
	                },
	                error: function(error) {
	                    alert("error")
	                }
	            })            	
            }
            else {
	            $.ajax({
	                type: 'POST',
	                url: '/withdang/danggeun/pushzzim',
	                data: {
	                    'danggeun_id': id,
	                    'user_nickname': loginNickname
	                },
	                success: function(response) {
	                	button.attr("data-isScrap", "1")
	                	button.css('background-color', '#ed8b9e')
	                },
	                error: function(error) {
	                    alert("error")
	                }
	            })
            }
        })
    })
</script>

</body>

</html>