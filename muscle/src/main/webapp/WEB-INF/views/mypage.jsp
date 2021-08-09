<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="cpath" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>너의 수어가 들려</title>
    
    <!-- Styles -->
    <link href="${pageContext.request.contextPath}/resources/https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/swiper.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
	<style type="text/css">
	 <style type="text/css">
    *{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
  
}

body {
  background-color:#ffffff ;
}

.loginForm {
  position:absolute;
  width:350px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}

.bottomText {
  text-align: center;
}
.bt_mypage_up {
	background-color: skyblue;
}
.btn_mypage_del{
	background-color: orange;
}
    
    </style>
    <!-- 스크립트 부분 -->
    <script type="text/javascript">
    function goMain() {
    	location.href = "${cpath}/main.do";
	}
    function goLogin() {
    	location.href = "${cpath}/gologin.do";
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
    <!-- end of navigation -->
     <!-- Header -->
   <body width="100%" height="100%">
    <form method="post" class="loginForm"  action="${cpath}/userupdate.do">
      <h2>마이페이지</h2>
      <c:if test="${sessionScope.userVO.id!=null}"> 
      <div class="idForm">
        <input type="text" class="id" placeholder="아이디" value="${sessionScope.userVO.id}" readonly="readonly" name="id">
      </div>
      <div class="passForm">
        <input type="text" class="pw" placeholder="비밀번호" value="${sessionScope.userVO.pw}" name="pw">
      </div>
       <div class="passForm">
        <input type="text" class="pw" placeholder="이름" value="${sessionScope.userVO.name}" name="name" readonly="readonly" >
      </div>
      <div class="passForm">
        <input type="tel" class="pw" placeholder="전화번호" value="${sessionScope.userVO.tel}" name="tel" >
      </div>
       <button type="submit" class="btn">회원정보 수정</button>
       <button type="reset" class="btn">취소</button>
      </c:if>
      	<div class="column">
      	<br>
								<!-- 게시판 작성 내역 -->
								<div class="sh_group">
									<div class="sh_header">
										<h5>  ${sessionScope.userVO.name}님이 자유게시판에 작성한 내용</h5>
									</div>
									<br>
									<div class="mypage_content">
										<dl class="sh_lst2">
											<table>
												<tr>
												<th>선택</th>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>게시일</th>
													<th>조회수</th>
												</tr>
												<tr>
												    <th><input type="checkbox" /></th>
													<th>1</th>
													<td>안녕하세요</td>
													<td>관리자</td>
													<td>2021-08-07</td>
													<td>3</td>
												</tr>
												<tr>
													<th><input type="checkbox" /></th>
													<th>2</th>
													<td>수어에 대해서 알고싶어요</td>
													<td>관리자</td>
													<td>2021-08-08</td>
													<td>7</td>
												</tr>
											</table>
										</dl>
									</div>
									<div>
										<p class="btn_area_btm1">
											<button type="button" onclick="reviewUpdateFn()" value="수정"  class="bt_mypage_up">수정</button>
											<button type="button" onclick="reviewDeleteFn()" class="btn_mypage_del">삭제</button>
										</p>
									</div>
								</div>
							</div>
      </form>
       
      

     
</body>
      </html>