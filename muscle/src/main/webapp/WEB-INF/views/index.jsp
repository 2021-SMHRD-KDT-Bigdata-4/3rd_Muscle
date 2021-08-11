<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="/muscle" />
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>cam-recording</title>
    <link href="/muscle/resources/css/camera.css" rel="stylesheet">
  </head>
  <body>
  
    <div class="wrapper">
      <div class="button-container">
        <button class="record-button" onclick="a()">녹화</button>
        <button class="stop-button">중지</button>
        <button class="play-button">녹화보기</button>
        <a class="download-button" name = "coco" value = "http://127.0.0.1:8081/muscle/coco/">다운로드</a>
      </div>
      <div class="video-container">
        <div class="video-item">
          <h2>촬영</h2>
          <video autoplay muted id="preview" ></video>
        </div>
        <div class="video-item">
          <h2>미리보기</h2>
          <video id="recording"></video>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    	
    </script>
    <script src="/muscle/resources/js/camera.js"></script>
    <script async src="https://docs.opencv.org/3.4.0/opencv.js"
		onload="onOpenCvReady()" type="text/javascript"></script>
    <!-- <script src="script.js"></script> -->
  </body>
</html> 