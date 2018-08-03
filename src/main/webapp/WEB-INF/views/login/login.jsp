<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/skel.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-xlarge.css" />
<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
<title>로그인페이지</title>
<%@ include file="../include/member_header.jsp" %>
<script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("아이디를 입력하세요.");
                $("#userPw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/login/loginCheck.do"
            // 제출
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>

   <div class="col-md-12">
    <h2>로그인</h2>
    <form name="form1" method="post">
								<div class="row uniform 50%">
									<div class="6u 12u$(4)">
										<input type="text" name="userId" id="userId" placeholder="아이디" />
									</div>
									<div class="6u$ 12u$(4)">
										<input input type="password" name="userPw" id="userPw" placeholder="비밀번호" />
									</div>
									<div class="12u$">
										<ul class="actions">
											<li><input type="button" id="btnLogin" value="로그인"></li>
										</ul>
									</div>
									<div class="12u$">
									<c:if test="${msg == 'failure'}">
									<div style="color: red">
										 아이디 또는 비밀번호가 일치하지 않습니다.
									</div>
									</c:if>
								 <c:if test="${msg == 'logout'}">
								 <div style="color: red">
									 로그아웃되었습니다.
								 </div>
								</c:if>
									</div>
								</div>
							</form>
							</div>
</body>
</html>
