<%@page import="com.earth.domain.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.earth.domain.ComuDTO" %>

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
    <link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Nanum+Gothic:wght@400;700;800&display=swap"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<!-- SweetAlert JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
	<!-- SweetAlert CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
    <style type="text/css">
    	#comment-box {
    		background-color: #fff;
    		margin: 15px;
    		border-radius: 20px;
    		padding: 8px;
    	}
    	#cmt_delete {
    		border: none;
    		background-color: #9d8db3;
    		color: #fff;
    		border-radius: 5px;
    		margin-top: 5px;
    	}
    	.cmt_created_time {
    		font-size: 12px;
    	}
    	#cmt-user {
    		font-size: 15px;
    		margin-bottom: 7px;
    	}
    	
    	
    </style>
    
    <title>댕댕커뮤</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function() {
		let login_user = getUserEmail();
		let writer = document.getElementById("user_email")
		
		if (login_user === writer.value) {
			$("#modifyBtn").attr('style', 'display:block;')
			$("#deleteBtn").attr('style', 'display:block;')
		}
		
		let post_id = $("input[name=post_id]").val()
		
		$("#deleteBtn").click(function() {
		    Swal.fire({
		        title: '삭제하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonText: '삭제',
		        cancelButtonText: '취소'
		    }).then((result) => {
		        if (result.isConfirmed) {
		            $.ajax({
		                url: "delete?post_id=" + post_id,
		                method: "POST",
		                dataType: "text",
		                success: function() {
		                    Swal.fire("성공적으로 삭제되었습니다.").then(function() {
		                        location.href = 'list';
		                    });
		                }
		            });
		        }
		    });
		});
		
		$("#commentButton").click(function() {
		    let cmt_content = $("textarea[name=comment]").val().trim();

		    if (login_user == 'Not Login') {
		        showAlert();
		        
		        return false; // 함수가 작동된 후 다시 작동이 되지 않게 함.
		    }
		    
		    if ($('#commentInput').val() == '') {
		        Swal.fire('내용을 입력하세요');
		        $('#commentInput').focus();
		        
		        return false;
		    }
		    
		    $.ajax({
		        type: 'post',
		        url: '/withdang/dangcomu/comments/' + post_id,
		        headers: { "content-type" : "application/json" },
		        data: JSON.stringify({post_id: post_id, cmt_content: cmt_content}),
		        success: function(result) {
		            showList(post_id);
		            $('#commentInput').val('');
		            
		            Swal.fire('댓글이 등록됐습니다!');
		        },
		        error: function(jqXHR, textStauts, errorThrown) {}
		    });
		});

		$("#commentList").on("click", "#cmt_delete", function() {
		    Swal.fire({
		        title: '삭제하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonText: '삭제',
		        cancelButtonText: '취소'
		    }).then((result) => {
		        if (result.isConfirmed) {
		            let cmt_id = $(this).parent().attr("cmt_id");
		            let post_id = $(this).parent().attr("post_id");

		            $.ajax({
		                type: 'DELETE',
		                url: '/withdang/dangcomu/comments/' + post_id + "/" + cmt_id,
		                success: function(result) {
		                    Swal.fire('댓글이 삭제됐습니다!').then(function() {
		                        showList(post_id);
		                    });
		                },
		                error: function() {
		                    Swal.fire('오류가 발생했습니다.');
		                }
		            });
		        }
		    });
		});
		
		$("#commentList").on("click", "#cmt_modify", function() {
			let cmt_id = $(this).parent().attr("cmt_id");
			let cmt_content = $(this).parent().children(".cmt_content").text();

			$(this).parent().html("<li><textarea id='modifyComment' placeholder='댓글 내용' name='comment' required></textarea></li>");
			$("textarea#modifyComment").text(cmt_content);	//6.19
			$("textarea#modifyComment").parent().append("<button id='cmt_modify_confirm' name='modifyComment'>확인</button>");
			
			$("#cmt_modify_confirm").click(function() {
				cmt_content = $("textarea#modifyComment").val();
				
				if ($('#modifyComment').val() == '') {
			        Swal.fire('내용을 입력하세요');
			        $('#modifyComment').focus();
			        
			        return false;
			    }
						
				$.ajax({
	                type: 'POST',
	                url: '/withdang/dangcomu/comments/update/' + post_id + '/' + cmt_id,
	                headers: { "content-type" : "application/json" },
			        data: JSON.stringify({ cmt_content: cmt_content }),
			        success: function(result) {
			            showList(post_id);
			            Swal.fire('댓글이 등록됐습니다!');
			        },
			        error: function(jqXHR, textStauts, errorThrown) {}
	            });
			});
		});
		
    	let showList = function(post_id) {
    		$.ajax({
    			type: 'GET',					
    			url: '/withdang/dangcomu/comments/' + post_id,	
				success: function(result) {
					$("#commentList").html(toHtml(result))	
				},
				error: function() { alert("error") }		 
    		})
    	}
		
		let toHtml = function(comments) {
		    let tmp = '';
		    let user_email = getUserEmail();

		    comments.forEach(function(comment) {
		        let date = new Date(comment.cmt_created_time)
		        tmp += '<div id="comment-box" >'
		        tmp += '<li';
		        tmp += ' cmt_id=' + comment.cmt_id;
		        tmp += ' post_id=' + comment.post_id;
		        tmp += ' cmt_user_email=' + comment.user_email + '>';
		        tmp += ' <span id="cmt-user"><strong>' + comment.user_nickname + '</strong></span><br>';  // 닉네임 줄바꿈 추가
		        tmp += ' 내용 : <strong><span class="cmt_content">' + comment.cmt_content + '</strong></span><br>';  // 댓글 내용 줄바꿈 추가
		        tmp += ' <span class="cmt_created_time">' + dateFormat(date) + '</span><br>';  // 작성 날짜 줄바꿈 추가
		        
		        if (comment.user_email == user_email) {
		        	tmp += ' <button id="cmt_modify">수정</button>';
		        	tmp += ' <button id="cmt_delete">삭제</button>';
		        }
				
		        tmp += '</li>';
		    });

		    return tmp;
		}
		
		function dateFormat(date) {
			let month = date.getMonth() + 1
			let day = date.getDate()
			let hour = date.getHours()
			let minute = date.getMinutes()
			
			month = month >= 10 ? month : '0' + month;
			day = day >= 10 ? day : '0' + day;
			hour = hour >= 10 ? hour : '0' + hour;
			minute = minute >= 10 ? minute : '0' + minute;
			
			return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute
		}
		
		function getUserEmail() {
			let user_email;
			
			$.ajax({
				url: '/withdang/dangcomu/comments/getUserEmail',
				method: 'GET',
				async: false, // 이게 뭘까? ajax는 원래 비동기, async를 주면 동기방식으로 변함.
				success: function(response) {
					user_email = response;
				},
				error: function() {}
			})

			return user_email;
		}

		showList(post_id);
		
		// SweetAlert JS 로그인 화면으로 이동
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
	        })
	    }
	})
	
</script>

<div class="board_wrap">
        <div class="board_title">
            <strong>댕댕커뮤</strong>
            <p>우리 댕댕이 자랑부터 동네 소식까지!</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
            	<input type="hidden" name="post_id" value="${comuDTO.post_id}"/>
            	<input type="hidden" id="user_email" value="${comuDTO.user_email}"/>
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
                        <dd><fmt:formatDate value="${comuDTO.post_created_time}" pattern="yyyy-MM-dd" type="date"/></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>${comuDTO.post_view_count}</dd>
                    </dl>
                    
                    <dl>
			      <%
				// 카테고리 ID와 문자열 매핑을 위한 맵 생성
				Map<Integer, String> categoryMap = new HashMap<>();
				categoryMap.put(1, "전체");
				categoryMap.put(2, "반려소식");
				categoryMap.put(3, "반려일상");
				categoryMap.put(4, "반려질문");
				categoryMap.put(5, "펫과사전");
				categoryMap.put(6, "육아꿀팁");
				categoryMap.put(7, "기타");
				
				// 요청 속성에서 comuDTO 객체 가져오기
				ComuDTO comuDTO = (ComuDTO) request.getAttribute("comuDTO");
				
				// comuDTO 객체가 null이 아닌 경우에만 카테고리 ID에 해당하는 문자열 값 가져오기
				String categoryName = "";
				if (comuDTO != null) {
				    int categoryId = comuDTO.getPost_ctgr_id();
				    categoryName = categoryMap.get(categoryId);
				}
				%>
				
				<dl>
				    <dt>카테고리</dt>
				    <dd><%= categoryName %></dd>
				</dl>

			    </dl>
                </div>
                <div id="comu_photo">
                	<c:forEach var="image" items="${images}">
                		<img alt="comu_image" src='${image.pt_adres}' style="width: auto; height: 100px; margin-right: 10px;">
                	</c:forEach>
                </div>
                <div class="cont">
                   ${comuDTO.post_content}
                </div>
            </div>

            <!-- 댓글 기능 -->
            <br>
           <div class="comment-form">
			  <textarea id="commentInput" placeholder="댓글 내용" name="comment" required></textarea>
			  <button type="button" id="commentButton">댓글 달기</button>
			</div>
          
            <ul class="comment-list" id="commentList">
                <!-- 댓글 리스트 -->
            </ul>

            <div class="bt_wrap">  
                <button id="modifyBtn" style="display:none;" class="on"><a href="${pageContext.request.contextPath}/dangcomu/update?post_id=${comuDTO.post_id}" >수정</a></button> 
                <button class="on" id="deleteBtn" style="display:none;">삭제</button>
                <button><a href="${pageContext.request.contextPath}/dangcomu/list">목록</a></button>
            </div>
            <br>
        </div>
    </div>

</body>

</html>