<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <h1>로그인</h1>
    <form method="POST">
        <div class="form-group">
            <label for="userid">아이디</label>
            <input type="text" class="form-control" id="userid" name="userid" required>            
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <%-- hidden input으로 role 값을 전송 --%>
		<input type="hidden" id="role" name="role">

        <div class="form-group d-flex justify-content-between">
            <button type="submit" class="btn btn-primary" value="저장"><i class="fas fa-user-plus mr-1"></i>로그인</button>
        </div>
    </form>

    <%-- 로그인 실패 시 알림창 표시 --%>
    <% if (request.getAttribute("loginFailed") != null) { %>
    <script>
        alert("아이디 또는 비밀번호가 일치하지않습니다. 다시 시도해주세요.");
    </script>
    <% } %>
</body>
</html>