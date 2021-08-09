<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="cpath" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>자유게시판 글쓰기</title>
    
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
	
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
  
    </script>
  </head>
	
	
	<!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
</head>
<body>
    
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar logo-image" href="main.do"><img src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG" alt="alternative"></a> 
	
            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="main.do">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.do">수어 음성번역 서비스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="musclevideo.do">수어 백과사전</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="muscleBoardList.do">자유게시판</a>
                    </li>
                </ul>
                <c:if test="${userVO == null}">
	            <span class="nav-item">
                    <a class="btn-outline-sm" onclick="goLogin()">로그인</a>
                </span>   
         	    </c:if>
         	    <c:if test="${userVO != null }">
         	    <span class="nav-item">
         	    	${userVO.name}님 환영합니다.
                    <a class="btn-outline-sm" href="mypage.do">마이페이지</a>
                    <button class="btn-outline-sm" onclick="logout()">로그아웃</button>
                </span>
         	    </c:if>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<article>

		<div class="container" role="main">

			<h4>자유게시판 글쓰기</h4>

                <form id="frm" method="post" action="${cpath}/boardInsert.do">
		   

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" name="title"  id = title placeholder="제목을 입력해 주세요">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

				    <textarea class="form-control" rows="1" readonly="readonly" id="title" name="id">${userVO.name}</textarea>

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" name="content" placeholder="내용을 입력해 주세요" ></textarea>

				</div>

			<div>

				<input type="submit" class="btn btn-primary btn-sm" value="저장"> 
                <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="goboard()">글쓰기 취소</button>

			</div>

			</form>
			
			

		</div>

	</article>

</body>

</html>