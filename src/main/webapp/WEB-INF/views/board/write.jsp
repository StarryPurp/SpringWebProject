<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
<title>게시글 작성</title>
<%@ include file="../include/member_header.jsp" %>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            
            var title = $("#title").val();
            var content = $("#content").val();
            var writer = $("#writer").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<%@ include file="../login/sessionCheck.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">
				게시글 작성
			</h2>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" name="form1" method="post" action="${path}/board/insert.do">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						제목
					</label>
					<input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						내용
					</label>
					<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<div style="width:650px; text-align: center;">
        		<button type="button" id="btnSave" >확인</button>
        		<button type="reset">취소</button>
    			</div>
			</form>
		</div>
	</div>
</div>



</body>
</html>
