<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="col-md-12">
			<ul class="nav">
				<li class="nav-item">
					<a href="${path}/board/list.do">게시판</a>
				</li>
				<li class="nav-item">
					<a href="${path}/member/write.do">회원가입</a>
				</li>
				 <c:choose>
    				<c:when test="${sessionScope.userId == null}">
    				<li class="nav-item">
       				 <a href="${path}/login/login.do">로그인</a>
       				 </li>
   					 </c:when>
				<c:otherwise>
				<div style="
					float: right;
				">
				${sessionScope.userName}님이 로그인중입니다.
				</div>
				<li class="nav-item">
					
        			<a href="${path}/login/logout.do">로그아웃</a>
				</li>
				 </c:otherwise>
				 </c:choose>
			</ul>
		</div>
 <hr>
