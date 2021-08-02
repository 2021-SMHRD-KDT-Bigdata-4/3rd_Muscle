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
<title>Insert title here</title>
<script type="text/javascript">
function resultHtml(data) { //data =>[{ }, { }....]
    //alert(data);
      var html="<table class='table'>";
       html+="<tr>";
       html+="<td>비디오</td>";
       html+="</tr>";
       //반복문
          $.each(data, (index, obj)=>{
          html+="<tr>";
          html+="<td>"+obj.video+"</td>";
          html+="</tr>";
       });
       html+="</table>";
       $("#list").html(html);
     }
</script>
</head>`
<body>
<table>
<%-- "${vo.video}" --%>
<c:forEach var="vo" items="${list}">
                  <div>
                  <tr>
                     <a href = "http://127.0.0.1:8081/muscle/views/${vo.video }">수어영상이지롱 헿</a>
                     <%-- <td><iframe><link rel="preload" href="${vo.video }" as="document"></iframe></td> --%>
                  </tr>
                  </div>
               </c:forEach>
            </table>
            
</body>
</html>