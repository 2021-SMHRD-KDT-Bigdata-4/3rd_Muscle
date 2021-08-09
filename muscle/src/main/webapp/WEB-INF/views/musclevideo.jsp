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
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SEO Meta Tags -->
<meta name="description" content="Your description">
<meta name="author" content="Your name">

<!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
<meta property="og:site_name" content="" />
<!-- website name -->
<meta property="og:site" content="" />
<!-- website link -->
<meta property="og:title" content="" />
<!-- title shown in the actual shared post -->
<meta property="og:description" content="" />
<!-- description shown in the actual shared post -->
<meta property="og:image" content="" />
<!-- image link, make sure it's jpg -->
<meta property="og:url" content="" />
<!-- where do you want your post to link to -->
<meta name="twitter:card" content="summary_large_image">
<!-- to have large image post format in Twitter -->

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
<script type="text/javascript">

   function logout() {
      $.ajax({
         url : "${cpath}/logout.do",
         type : "get",
         success : function() {
            alert("로그아웃되었습니다.")
            location.href = "${cpath}/main.do";
         },
         error : function() {
            alert("error");
         }
      });
   }

   // 백과사전 검색한 단어 가지고 컨트롤러로 간 후 단어이름과 영상을 반환
   function dic() {
      var word = $("#word").val();
      $.ajax({
         url : "${cpath}/musclevideoAjax.do",
         type : "get",
         data : {"word" : word},
         dataType : "json",
         success : resultHtml,
         error : function(error) {
            alert("에러다잉?");
         }
      });
   }

   // dic()함수가 성공하면 html을 띄워줌
   function resultHtml(obj) {
      //alert(JSON.stringify(data));   json 문자열로 출력
      //var html = "<h3>" + obj.word + "</h3>";
      var html = "<video width='800px' height='500px' autoplay controls src="+obj.video+">";
      html += "</video>";
      $("#list").html(html);
   }
</script>
<style type="text/css">
.inner {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
}
.button{
   background-color:#33bdef;
    width:102px;
    height:42px;
}


.inputv{
  height:40px;
  width: 400px;
  border: 1px solid;
  background:#ffffff;

}

</style>
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
               <li class="nav-item"><a class="nav-link active" aria-current="page" href="main.do">메인</a></li>
               <li class="nav-item"><a class="nav-link" href="index.do">수어 음성번역 서비스</a></li>
               <li class="nav-item"><a class="nav-link" href="musclevideo.do">수어 백과사전</a></li>
               <li class="nav-item"><a class="nav-link" href="muscleBoardList.do">자유게시판</a></li>
            </ul>
            <c:if test="${userVO == null}">
               <span class="nav-item">
                    <a class="btn-outline-sm" href="gologin.do">로그인</a>
                </span>   
                </c:if>
                <c:if test="${userVO != null }">
                <span class="nav-item">${userVO.name}님 환영합니다.
                    <a class="btn-outline-sm" href="mypage.do">마이페이지</a>
                    <button class="btn-outline-sm" onclick="logout()">로그아웃</button>
                </span>
                </c:if>
         </div> 
      </div>
   </nav>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>


   <!-- 검색버튼 여기임! -->

   <form method="post" class="inner">
   <div float="left" margin="30px">
      <input type="text" name="word" id="word" class="inputv">   
      <button type="button" onclick="dic()" class="button">검색</button>
   </div>
      <div id="list" float="left" margin="30px"></div>
   </form>
   



</body>
</html>