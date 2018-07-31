<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<header>
<div class="icon"><img src="resources/images/caticon.png"></div>
<div class="title">고독한 교내 미식가</div>
</header>
<div class="nav">
<ul>
<li><a href="member/write.do"> 회원등록 </a></li>
<li><a href="board/write.do">게시판</a></li>
<li><a href="login/login.do">로그인</a></li>
<li><a href="member/list.do">목록</a></li>
</ul>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>