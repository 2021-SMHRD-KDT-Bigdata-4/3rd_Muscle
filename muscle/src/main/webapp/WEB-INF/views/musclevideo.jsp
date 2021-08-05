<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Webpage Title -->
    <title>너의 수어가 들려</title>
    
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
	
	<!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<script type="text/javascript">
	function dic() {
		var word = $("#word").val();
		$.ajax({
			url : "${cpath}/musclevideoAjax.do",
			//url : "${cpath}/musclevideoAjax.do?word="+word,
			//url : "musclevideoAjax.do?word="+word,
			type : "get",
			data : {"word" : word},
			dataType : "json",
			success : resultHtml,
			error : function(error) {alert("에러다잉?");}
		//error : function(error){alert("에러다잉?");console.log(error);}
		});
	}
	

	function resultHtml(obj) {
		//alert(JSON.stringify(data));   json 문자열로 출력
		var html = "<h3>" + obj.word +"</h3>";
		html += "<video width='500px' height='500px' controls src="+obj.video+">";
		html += "</video>";
		$("#list").html(html);
	}
	
</script>
</head>
<body>

 <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar logo-image" href="main.jsp"><img src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG" alt="alternative"></a> 
	
            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="main.jsp">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="muscleBoardList.jsp">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#projects">수어 음성번역 서비스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="musclevideo.do">수어 백과사전</a>
                    </li>
                </ul>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="login.jsp">로그인</a>
                </span>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

      
    <!-- Header -->
    <header id="header" class="header">
        <img class="decoration-star" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <img class="decoration-star-2" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        </header>
		<form method="post">
		<input type="text" name="word" id="word">
		<button type="button" onclick="dic()">검색</button>
		<div id="list"></div>
		</form>


	<!-- value="${vo.word}" -->

	<%-- <h3>${vo.word }</h3>
	--%>
	<!-- <video width="500px" height="500px" controls
		src= "http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0001_REAL01_F.mp4">
	</video> -->


</body>
</html>