<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html>  
<head>  
<title>회원 목록</title>  
</head>  
<body>  
	<h1>회원 목록</h1>  
	<p>  
<form>  
<input type="text" placeholder="검색" name="keyword" value="${keyword}" />  
<input type="submit" value="검색" />  
</form>  
  
	<table>  
		<thead>  
			<tr>  
				<td>아이디</td>  
				<td>이름</td>  
				<td>전화번호</td>  
			</tr>  
		</thead>  
		<tbody>  
		<c:forEach var="row" items="${data}">  
		<tr>  
			<td>  
			<a href="detail?userid=${row.userid}">  
					${row.userid}  
			</a>  
			</td>  
			<td>${row.username}</td>  
				<td>${row.usertel}</td>  
			</tr>  
			</c:forEach>  
		</tbody>  
	</table>  
	<p>  
	<a href="join">회원가입</a>  
	</p>  
</body>  
</html> 