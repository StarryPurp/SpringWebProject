<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/others.css" rel="stylesheet">
<title>댓글</title>
<%@ include file="../include/member_header.jsp" %>
</head>
<script>
	$("#btnReplyUpdate").click(function(){
		var detailReplytext=$("#detailReplytext").val();
		$.ajax({
			type:"put",
			url:"${path}/reply/update/${vo.rno}",
			headers:{
				"Content-type":"application/json"
			},
			data:JSON.stringify({
				replytext:detailReplytext
			}),
			dataType:"text",
			success:function(result){
				if(result=="success"){
					$("#modifyReply").css("visibility","hidden");
					//업데이트한 댓글 목록 제시
					//
					listReply();
					
				}
			}
			
		});
		
		$("#btnReplyDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"delete",
					url:"${path}/reply/delete/${vo.rno}",
					success:function(result){
						if(result=="success"){
							alert("삭제되었습니다.");
							$("modifyReply").css("visibility","hidden");
							listReply();
						}
					}
					
				});
			}
			
		});
		
		
	})
	

</script>
<body>
댓글 번호:${vo.rno }<br>
<textarea id="detailReplytext" rows="5" cols="20">
${vo.replytext}
</textarea>
<div style="text-align: center;">
	<c:if test="${sessionScope.userId==vo.replyer }">
		<button type="button" id="btnReplyUpdate">수정</button>
		<button type="button" id="btnReplyDelete">삭제</button>
	</c:if>
	<button type="button" id="btnReplyClose">닫기</button>
</div>
</body>
</html>