<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>

<!-- Styles -->
<link
	href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/swiper.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">

<!-- 스크립트 부분 -->
<script type="text/javascript">
    function goMain() {
    	location.href = "${cpath}/main.do";
	}
    function goLogin() {
    	location.href = "${cpath}/gologin.do";
	}
    function goboard() {
    	location.href = "${cpath}/muscleBoardList.do";
	}
    function goMypage() {
    	location.href = "${cpath}/gomypage.do";
	}
    function logout() {
 	   $.ajax({
 	      url : "${cpath}/logout.do",
 	      type:"get",
 	      success : function(){
 	         alert("로그아웃되었습니다.")
 	         location.href="${cpath}/main.do";
 	      },
 	      error : function(){alert("error");}
 	   });
 	}
    
    
    function insertFn() {
  	   $.ajax({
  	      url : "${cpath}/commentInsert.do",
  	      type:"get",
  	      success : function(){
  	         alert("댓글이 입력됨.")
  	         location.href="${cpath}/muscleBoardContent.do";
  	      },
  	      error : function(){alert("error");}
  	   });
  	}
   /*  $("#cmtCnt-btn").click(function(){
    	 
         } */
       function goJson() {
       	  $.ajax({
       		  url: "${cpath}/commentList.do",
       		  type: "get",
       		  dataType: "json",
       		  success: resultHtml, // callback 함수
       		  error: function() { alert("error");}
       	  });
       	 alert("ajax통과 함")
       	} 
    function resultHtml(data) { // data안에 json형식으로 {(),(),(),()} 데이터 리스트가 있음
    	// alert(data); 동적으로 게시판을 만들어줘야함
    	var html ="<table class ='table'>";
    	html+="<thead>";
    	html+="<tr>";
    	html+="<td>번호</td>";
    	html+="<td>내용</td>";
    	html+="<td>작성자</td>";
    	html+="</tr>";
    	// 반복문 ($.each)
    	$.each(data, (index,obj)=>{
    		html+="<tr>";
    		html+="<td>"+obj.idx_c+"</td>";
    		html+="<td>"+obj.comment+"</td>";
    		html+="<td>"+obj.id+"</td>";
  			html+="</tbody>"
    		html+="</tr>";
    	});
    	html+="</table>";
    	$("#list").html(html);
    	}
    
    
    
    
    
    </script>
<style type="text/css">
.reply_button {
	width: 100px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 4px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}
</style>
</head>


<!-- Favicon  -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.png">
</head>
<body>

	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<a class="navbar logo-image" href="main.do"><img
				src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG"
				alt="alternative"></a>

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

			<button class="navbar-toggler p-0 border-0" type="button"
				id="navbarSideCollapse" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse offcanvas-collapse"
				id="navbarsExampleDefault">
				<ul class="navbar-nav ms-auto navbar-nav-scroll">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="main.do">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="index.do">수어
							음성번역 서비스</a></li>
					<li class="nav-item"><a class="nav-link" href="musclevideo.do">수어 사전</a></li>
					<li class="nav-item"><a class="nav-link"
						href="muscleBoardList.do">자유게시판</a></li>
				</ul>
				<c:if test="${userVO == null}">
					<span class="nav-item"> <a class="btn-outline-sm"
						onclick="goLogin()">로그인</a>
					</span>
				</c:if>
				<c:if test="${userVO != null }">
					<span class="nav-item"> ${userVO.name}님 환영합니다. <a
						class="btn-outline-sm" href="mypage.do">마이페이지</a>
						<button class="btn-outline-sm" onclick="logout()">로그아웃</button>
					</span>
				</c:if>
			</div>
			<!-- end of navbar-collapse -->
		</div>
		<!-- end of container -->
	</nav>
	<!-- end of navbar -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<article>

		<div class="container" role="main">

			<h4>게시글 상세조회</h4>
			<form name="form" id="form" role="form" method="post"
				action="${cpath}/boardInsert.do">
				<div class="mb-3">
					<label for="idx_b">번호</label>
					<textarea class="form-control" rows="1" name="idx_b"
						readonly="readonly">${vo.idx_b}</textarea>
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<textarea class="form-control" rows="1" name="title"
						readonly="readonly">${vo.title}</textarea>
				</div>
				<div class="mb-3">
					<label for="id">작성자</label>
					<textarea class="form-control" rows="1" name="id"
						readonly="readonly">${vo.id}</textarea>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content"
						readonly="readonly">${vo.content}</textarea>
				</div>
			</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnList"
					onclick="goboard()">게시판으로 이동</button>
			</div>
			<br> <br>
			
			<!-- 댓글 -->
              <form id="frm" method="post" action="${cpath}/muscleBoardContent.do"> 
              <input type="hidden" id="idx_b" name="idx_b" value="${vo.idx_b}"> 
              <input type="hidden" id="id" name="id" value="${vo.id}">
			<div>
			
				<div class="mb-3">
					<textarea class="form-control" name="comment" rows="1"
						placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
				</div>
				<div class="comment-button">
					<input type="submit" class="btn btn-primary btn-sm" value="댓글 쓰기"> 
                <button type="reset" class="btn btn-sm btn-primary">댓글쓰기 취소</button>
				</div>
			</div>
			</form>
			<br>
			<!-- 댓글 목록 -->
			<button class="btn btn-success btn-sm" onclick="goJson()">댓글목록 보기</button>
<%-- 			<div class="container">
				<h4>댓글목록</h4>
				<br>
		<table class="table">
    <thead>
      <tr>
        <th>게시판 번호</th>
        <th>댓글 번호</th>
        <th>댓글내용</th>
        <th>작성자</th>
      </tr>
    </thead>
    <tbody>
      
      <c:forEach var="vo" items="${list}" >
      <tr>
        <td>${vo.idx_b}</td>
        <td>${vo.idx_c}</td>
        <td>${vo.comment}</td>
         <td>${vo.id}</td> 
      </tr>
      </c:forEach>
    </tbody> 
  </table>
			</div> --%>
			<div id="list"></div>
		</div>


	</article>

</body>

</html>