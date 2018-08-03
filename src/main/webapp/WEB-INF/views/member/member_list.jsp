<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
  
  <%@ include file="../include/member_header.jsp" %> 
<title>회원 목록</title>

	
			<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/skel.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
			<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style-xlarge.css" />
			<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
	
</head>
<style>

h2{
	text-align: center;

}

</style>

<body>
 <%@ include file="../include/member_menu.jsp" %>  
   <div class="col-md-12">
 <h2> 회원 목록</h2>
 						<a href="${path}/member/write.do" class="button alt">회원등록</a>
			
									<div class="table-wrapper">
								<table class="alt">
									<thead>
					<tr>
						<th> 아이디 </th>
      					<th> 이름 </th>
      					<th> 이메일 </th>
      					<th> 회원 가입 일자 </th>
					</tr>
				</thead>
									
										<c:forEach var="row"  items="${list}">
										<tbody>
   <tr>
       <td> ${row.userId}</td>
       <td><a href="${path}/member/view.do?userId=${row.userId}"> ${row.userName }</a></td>
       <td> ${row.userEmail}</td>
       <td> ${row.userRegdate}</td>
    </tr>
    </tbody>
    </c:forEach>
									
								</table>
							</div>
							</div>
</body>
</html>