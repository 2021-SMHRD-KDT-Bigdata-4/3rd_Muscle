<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
    <link href="${pageContext.request.contextPath}https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
	
	<!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
    <!-- 스크립트 부분 -->
    <script type="text/javascript">
    function goLogin() {
    	location.href = "${cpath}/gologin.do";
	}
    function goMain() {
    	location.href = "${cpath}/main.do";
	}
    function goBoard() {
    	location.href = "${cpath}/goboard.do";
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
    function fail() {
		if(uservo == null){
			alert("로그인 실패")
		}
	}
    
    </script>

</head>
<body>
    
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar logo-image" onclick="goMain()"><img src="${pageContext.request.contextPath}/resources/images/logogeunjo.PNG" alt="alternative"></a> 
	
            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="index.html">Yavin</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
         	
            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" onclick="goMain()">메인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">수어 음성번역 서비스</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"  href="musclevideo.do">수어 백과사전</a>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link" onclick="goBoard()">자유게시판</a>
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
                    <a class="btn-outline-sm" onclick="goMypage()">마이페이지</a>
                    <button class="btn-outline-sm" onclick="logout()">로그아웃</button>
                </span>
         	    </c:if>
                
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

      
    <!-- Header -->
    <header id="header" class="header">
        <img class="decoration-star" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        <img class="decoration-star-2" src="${pageContext.request.contextPath}/resources/images/decoration-star.svg" alt="alternative">
        </header>
	<!-- Navigation-->
	
	<section class="page-section cta">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<div class="cta-inner bg-faded text-center rounded">
						<!-- mypage 내용 들어갈 곳 -->

						<div id="container">
							<!-- CONTENTS -->
							<!-- CONTENTS -->
							<div id="content" class="section_home">
								<div class="column">
									<!-- 프로필 설정 -->
									<div class="sh_group">
										<br>
										<form>
											<div>
												<div class="sh_header" method="post">
													<h2>내정보 수정</h2>
													<br>
												</div>
												<div class="mypage_content">
													<dl class="sh_lst">
													<dt class="nic_tit">아이디 :
															${sessionScope.userVO.id}
														<dt>
															<br>
														</dt>
														<input class="change1" type="hidden"
															value="${sessionScope.userVO.id}"
															readonly="readonly">
														<dt class="nic_tit">
															<label for="fname">이   름 : </label> <input class="change1"
																type="text" value="${sessionScope.userVO.name}">
															<br>
														</dt>

														<dt>
															<br>
														</dt>

														<dt class="nic_tit">
															<label for="fname">비밀번호 :</label> <input class="change1"
																type="text" value="${sessionScope.userVO.pw}">
															<br>
														</dt>
														<dt class="nic_tit">
															<label for="fname">전화번호 :</label> <input class="change1"
																type="text" value="${sessionScope.userVO.tel}">
															<br>
														</dt>
													</dl>
												</div>
												<div>
													<p class="btn_area_btm1">
														<button type="button" onclick="updateFn()" value="수정"
															style="background-color: #e6a756; color: rgba(47, 23, 15, 0.9); border-radius: 15px; margin-left: -50px;">수정</button>
														<button type="reset" class="btn_model" id="bt_mypage_jun">
															<b class="btn_jun2">취소</b>
														</button>
													</p>
												</div>
											</div>
										</form>

									</div>
								</div>
							</div>
							<div class="column">
								<!-- 게시판 작성 내역 -->
								<div class="sh_group">
									<div class="sh_header">
										<h2>${sessionScope.userVO.name}님이 자유게시판에 작성한 내용</h2>
									</div>
									<div class="mypage_content">
										<dl class="sh_lst2">
											<table class=recommendTable>
												<tr class=recommendTr>
													<th>선택</th>
													<th>제목</th>
													<th>작성자</th>
												</tr>
												<tr>
													<th><input type="checkbox"></th>
													<td>안녕하세요</td>
													<td>이대교</td>
												</tr>
											</table>
										</dl>
									</div>
									<div>
										<p class="btn_area_btm1">
											<button type="button" onclick="reviewUpdateFn()" value="수정"
													style="background-color: #e6a756; color: rgba(47, 23, 15, 0.9); border-radius: 15px; margin-left: -50px;">수정</button>
											<button type="button" onclick="reviewDeleteFn()" class="btn_model" id="bt_mypage_jun">
													<b class="btn_jun2">삭제</b>
											</button>
										</p>
									</div>
								</div>
							</div>
							<p class="desc_sub">
								저희 서비스를 더 이상 이용하지 않는다면 <a href="" onclick="" class="more">회원탈퇴
									바로가기</a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./Resources/js/scripts.js"></script>
</body>
</html>