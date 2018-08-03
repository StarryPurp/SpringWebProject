<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/skel.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-xlarge.css" />
<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
<title>회원등록 페이지</title>
<%@ include file="../include/member_header.jsp" %>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<div class="col-md-12">
    <h2>회원등록폼</h2>
    
    <form name="form1" method="post" action="${path}/member/insert.do">
								<div class="row uniform 50%">
									<div class="6u 12u$(4)">
										<input type="text" name="userId" id="id"  placeholder="아이디" />
									</div>
									<div class="6u$ 12u$(4)">
										<input type="password" name="userPw" id="pw"  placeholder="비밀번호" />
									</div>
									<div class="6u$ 12u$(4)">
										<input type="text" name="userName" id="name"  placeholder="이름" />
									</div>
									<div class="6u$ 12u$(4)">
										<input type="email" name="userEmail" id="email"  placeholder="이메일" />
									</div>
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="확인"></li>
											<li><input type="reset" value="취소"></li>
										</ul>
									</div>
								</div>
							</form>
    </div>
   
</body>
</html>
