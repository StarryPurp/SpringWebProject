<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:if test="${sessionScope.userId ==null }">
    	<script>
    		alert("�α��� �Ͻ� �Ŀ� ������ּ���!");
    		location.href="${path}/login/login.do";
    	
    	</script>
    
    </c:if>