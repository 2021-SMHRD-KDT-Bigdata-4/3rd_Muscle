<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
    <meta charset="utf-8">
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
   <link
   href="${pageContext.request.contextPath}https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap"
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

<!-- Favicon  -->
<link rel="icon"
   href="${pageContext.request.contextPath}/resources/images/favicon.png">
   <!-- login css-->
<style type="text/css">
.btn {
   position: relative;
   left: 40%;
   transform: translateX(-50%);
   margin-bottom: 40px;
   width: 80%;
   height: 40px;
   background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
   background-position: left;
   background-size: 200%;
   color: white;
   font-weight: bold;
   border: none;
   cursor: pointer;
   transition: 0.4s;
   display: inline;
}

.btn:hover {
   background-position: right;
}	
</style>
<!-- login css-->  
   <script type="text/javascript">
   function muscleBoardForm() {
	   location.href = "${cpath}/muscleBoardForm.do";
	}
   </script>
</head>
<body>
    
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="alternative"></a> 

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#header">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#details">수어음성번역서비스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">수어사전</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#projects">자유게시판</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="article.html">Article Details</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="terms.html">Terms Conditions</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="privacy.html">Privacy Policy</a></li>
                        </ul>
                    </li>
                </ul>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="gologin.do">로그인</a>
                </span>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

      
    <!-- Header -->
    <header id="header" class="header">
        <img class="decoration-star" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <img class="decoration-star-2" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-xl-5">
                    <div class="text-container">
                        <h1 align="center">수어, 또 하나의 언어</h1>
                  <p class="p-large" align="right">보이는 언어, 수어로 통하는 세상</p>

                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
                <div class="col-lg-5 col-xl-7">
                    <div class="image-container">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/thisis.png" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of header -->
    <!-- end of header -->


 

    <!-- Details 1 -->
    <div id="details" class="basic-2">
       <div class="wrapper1">
      <div class="video-container">
         <div class="video-item">
            <h2>촬영</h2>
            <video autoplay muted id="preview"></video>
         </div>
      </div>
      
      <div class="video-container">
         <div class="video-item">
            <h2>녹화확인</h2>
            <video id="recording"></video>
         </div>
      </div>
   </div>
   <div class="wrapper2">
      <div class="video-container2" style="margin-right: 190;">
         <button class="record-button" onclick="a()" style="">녹화</button>
         <button class="stop-button">중지</button>
      </div>
      <div class="video-container2" style="margin-left: 190;">
         <button class="play-button">확인</button>
         <button><a class="download-button"  style="text-decoration-line : none;" >보내기</a></button>
      </div>
   </div>
   
   <script src="/muscle/resources/js/camera.js"></script>
    </div> <!-- end of basic-2 -->
    <!-- end of details 1 -->


    <!-- Services -->
    <div id="services" class="cards-1 bg-gray">
        <div class="container">
            <form method="post" class="inner" style="position: absolute; left: 50%; transform: translateX(-50%);">
      <div>
         <input type="text" name="word" id="word" style=" border-radius: 28px; height: 40px; width: 400px; background: #ffffff;">
         <a onclick="dic()" class="btn-outline-sm">
    검색</a>
         <div id="list"></div>
      </div>
   </form>
   </div>
</div>


    <!-- Projects -->
    <div id="projects" class="cards-2">
        <div class="container">
      <h4>자유게시판</h4>
      <br>
      <table class="table" id="list"  >
         <thead>
            <tr>
               <th>번호</th>
               <th>제목</th>
               <th>작성자</th>
            </tr>
         </thead>
         <tbody>
            <%-- <c:forEach var="vo" items="${list}" >
               <tr>
                  <td>${vo.idx_b}</td>
                  <td><a href="${cpath}/commentListAjax.do?idx_b=${vo.idx_b}">${vo.title}</a></td>
                  <td>${vo.id}</td>
               </tr>
            </c:forEach> --%>
            
               <tr>
                  <td>1</td>
                  <td>근조직</td>
                  <td>coco</td>
               </tr>
                <tr>
                  <td>2</td>
                  <td>수어</td>
                  <td>coco</td>
               </tr>
                <tr>
                  <td>3</td>
                  <td>근조직</td>
                  <td>coco</td>
               </tr> <tr>
                  <td>4</td>
                  <td>근조직</td>
                  <td>coco</td>
               </tr> <tr>
                  <td>5</td>
                  <td>근조직</td>
                  <td>coco</td>
               </tr>
            
         </tbody>
      </table>
      <br>
      <a class="btn-outline-sm" href="muscleBoardForm.do">글쓰기</a>
      </div>


    

    <!-- Contact -->
  <%--   <div id="contact" class="form-1">
        <form action="${cpath}/login.do" method="post" style="position: absolute; width: 300px; height: 400px; padding: 30px, 20px; background-color: #FFFFFF; text-align: center; top: 50%; left: 50%; transform: translate(-50%, -50%); border-radius: 15px;">
      <h2 style="text-align: center; margin: 30px;">Login</h2>
      <div style="border-bottom: 2px solid #adadad; margin: 30px; padding: 10px 10px;">
         <input type="text" placeholder="ID" name="id" style="width: 100%; border: none; outline: none; color: #636e72; font-size: 16px; height: 25px; background: none;">
      </div>
      <div style="border-bottom: 2px solid #adadad; margin: 30px; padding: 10px 10px;">
         <input type="password" placeholder="PW" name="pw" style="width: 100%; border: none; outline: none; color: #636e72; font-size: 16px; height: 25px; background: none;">
      </div>
      <button type="submit" class = "btn">
      로그인</button>
      <div style="text-align: center;">
         계정이 없으신가요? <a href="join.do">회원가입</a>
      </div>
   </form>
    </div> <!-- end of form-1 -->
    <!-- end of contact --> --%>


    <!-- Footer -->
    <div class="footer bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer-col first">
                        <h6>About Website</h6>
                        <p class="p-small">He oppose at thrown desire of no. Announcing impression unaffected day his are unreserved indulgence. Him hard find read are you</p>
                    </div> <!-- end of footer-col -->
                    <div class="footer-col second">
                        <h6>Links</h6>
                        <ul class="list-unstyled li-space-lg p-small">
                            <li>Important: <a href="terms.html">Terms & Conditions</a>, <a href="privacy.html">Privacy Policy</a></li>
                            <li>Useful: <a href="#">Colorpicker</a>, <a href="#">Icon Library</a>, <a href="#">Illustrations</a></li>
                            <li>Menu: <a href="#header">Home</a>, <a href="#details">Details</a>, <a href="#services">Services</a>, <a href="#contact">Contact</a></li>
                        </ul>
                    </div> <!-- end of footer-col -->
                    <div class="footer-col third">
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-facebook-f fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-twitter fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-pinterest-p fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-instagram fa-stack-1x"></i>
                            </a>
                        </span>
                        <p class="p-small">We would love to hear from you <a href="mailto:contact@site.com"><strong>contact@site.com</strong></a></p>
                    </div> <!-- end of footer-col -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of footer -->  
    <!-- end of footer -->


    <!-- Copyright -->
    <div class="copyright bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="p-small">Copyright © <a href="#your-link">Your name</a></p>
                </div> <!-- end of col -->
            </div> <!-- enf of row -->

            <div class="row">
                <div class="col-lg-12">
                    <p class="p-small">Distributed By <a href="https://themewagon.com/">Themewagon</a></p>
                </div> <!-- end of col -->
            </div> <!-- enf of row -->
        </div> <!-- end of container -->
    </div> <!-- end of copyright --> 
    <!-- end of copyright -->
    

    <!-- Back To Top Button -->
    <button onclick="topFunction()" id="myBtn">
        <img src="${pageContext.request.contextPath}/resources/images/up-arrow.png" alt="alternative">
    </button>
    <!-- end of back to top button -->
    	
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="${pageContext.request.contextPath}/resources/js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
    <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script> <!-- Custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/camera.js"></script>
</body>
</html>