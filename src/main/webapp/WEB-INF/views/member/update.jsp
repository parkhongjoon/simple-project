<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<html>

 <head>
  <title>회원정보 수정</title>
 </head>
 <body>
  <h1>회원정보 수정</h1>
  <form method="POST">
   <p>비밀번호 : <input type="text" name="password" value="${data.password }" /></p>
   <p>닉네임 : <input type="text" name="nickname" value="${data.nickname }" /></p>
   <p>전화번호 : <input type="text" name="tel" value="${data.tel }" /></p>
   <p>우편번호 : <input type="text" name="zipcode" value="${data.zipcode }" /></p>
   <p>주소 : <input type="text" name="addr1" value="${data.addr1 }" /></p>
   <p>상세주소 : <input type="text" name="addr2" value="${data.addr2 }" /></p>
   <p><input type="submit" value="저장" />
  </form>
 </body>
</html>
