<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>회원정보</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <div class="container">
        <h1>회원정보</h1>
        <p>이름 : ${data.name}</p>
        <p>닉네임 : ${data.nickname}</p>
        <p>아이디 : ${data.userid}</p>
        <p>비밀번호 : ${data.password}</p>
        <p>이메일 : ${data.usermail}</p>
        <p>전화번호 : ${data.tel}</p>
        <p>우편번호 : ${data.zipcode}</p>
        <p>주소 : ${data.addr1}</p>
        <p>상세주소 : ${data.addr2}</p>
        <p>생년월일 : ${data.birth}</p>
        <p>입력일 : <fmt:formatDate value="${data.join}"/></p>
        <p>
            <a href="update?userid=${userid}">수정</a>
        </p>
        <form method="POST" action="delete">
            <input type="hidden" name="id" value="${userid}" />
            <input type="submit" value="삭제" />
        </form>
        <p>
            <a href="list">목록</a>
        </p>
    </div>
</body>
</html>