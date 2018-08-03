<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<ul class="nav">
				<li class="nav-item">
					<a href="member/write.do"> 회원등록 </a>
				</li>
				<li class="nav-item">
					<a href="board/write.do">게시판</a>
				</li>
				<li class="nav-item">
					<a href="login/login.do">로그인</a>
				</li>
				<li class="nav-item">
					<a href="member/list.do">목록</a>
				</li>
			</ul>
			<div>
			<h3 class="text-center text-primary">
				고독한 교내 미식가
			</h3>
			</div>
			<div style="background-image:url('resources/images/bgmeal.jpg');
						background-repeat:no-repeat;
						background-size:cover;
						height:500px;
						z-index: 20;	">
			</div>
			<div>
			<p class="text-center">
				학교 어딘가에서 홀로 급식을 맛보고 있는 고독한 사람들을 위해.
			</p>
			</div>
		</div>
	</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>