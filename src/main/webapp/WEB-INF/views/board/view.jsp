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
<title>게시글 작성</title>
<%@ include file="../include/member_header.jsp" %>
<script>
    $(document).ready(function(){
    	 listReply();
    	//댓글 관련, 댓글 등록이 되지 않는다...
    	$("#btnReply").click(function(){
    		
            var replytext=$("#replytext").val();
            var bno="${dto.bno}"
            var param="replytext="+replytext+"&bno="+bno;
            $.ajax({                
                type: "post",
                url: "${path}/reply/insert.do",
                data: param,
                success: function(){
                    alert("댓글이 등록되었습니다.");
                    //listReply2();
                    listReply();
                }
            });
        });
    	
    	
    	$("#btnList").click(function(){
    		
    		location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
    	})
    	
        
        // 게시글 삭제 버튼 클릭이벤트
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = 
                	"${path}/board/delete.do";
                document.form1.submit();
            }
            
        });
        
        // 게시글 수정 버튼 클릭이벤트
        $("#btnUpdete").click(function(){
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
            document.form1.action="${path}/board/update.do";
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
            
        });
    })
    	
    
    
    
    
    
    function listReply2(){
    	$.ajax({
    		
    		type:"post",
    		url:"${path}/reply/listJson.do?bno=${dto.bno}",
    		success:function(result)
    		{
    			var output="<table>";
    			for(var i in result){
    				output +="<tr>";
    				output +="<td>"+ result[i].userName;
    				output +="("+changeDate(result[i].regdate)+")<br>";
    				output += result[i].replytext+"</td>";
    				output += "</tr>";
    			}
    			output += "</table>";
    			$("#listReply").html(output);
    		}
    	});
    	
    	
    }

    
    function listReply(){
    	$.ajax({
    		type:"post",
    		url:"${path}/reply/list.do?bno=${dto.bno}",
    				success:function(result){
    					$("#listReply").html(result);
    				}
    		
    	})
    }
    
    function changeDate(date){
    	date=new Date(parseInt(date));
    	year=date.getFullYear();
    	month=date.getMonth();
    	day=date.getDate();
    	hour=date.getHours();
    	minute=date.getMinutes();
    	second=date.getSeconds();
    	strDate=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
    	return strDate;
    }
    
    
    function showReplyModify(rno){
    	$.ajax({
    		type:"get",
    		url:"${path}/reply/detail/"+rno,
    		success: function(result){
    			$("#modifyReply").html(result);
    			//태그,css("속성",값)
    			$("#modifyReply").css("visibility","visible");
    		}
    	})
    }
</script>
<style>
	#modifyReply{
		width:600px;
		height:130px;
		background-color: #9EFFFF;
		padding: 10px;
		z-index: 10;
		visibility: hidden;
	}
</style>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<div class="col-md-12">
<h2>게시글 보기</h2>
<form name="form1" method="post">
    <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
        작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
    </div>
    <div>
    </div>
        조회수 : ${dto.viewcnt}
    </div>
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" name="form1" method="post">
				<div class="form-group">
					<label>
						제목
					</label>
					<input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
				</div>
				<div class="form-group">
					 
					<label>
						내용
					</label>
					<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.content}</textarea>
				</div>
				<input type="hidden" name="writer" id="writer" value="${dto.bno}">
    <div style="width:650px; text-align: center;">
        <!-- 게시물번호를 hidden으로 처리 -->
        <input type="hidden" name="bno" value="${dto.bno}">
    <c:if test="${sessionScope.userId==dto.writer }">
        <button type="button" id="btnUpdate">수정</button>
        <button type="button" id="btnDelete">삭제</button>
        
      </c:if>
      <button type="button" id="btnList">목록</button>
    </div>
			</form>
		</div>
	</div>
 <div style="width:600px; text-align:center;">
    	<c:if test="${sessionScope.userId !=null }">
    		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea><br>
    		<button type="button" id="btnReply">댓글 쓰기</button>
    	
    	</c:if>
    
    </div>
    
    
    <div id="listReply">
    
    
    </div>
    
    
</div>
    
    
</body>
</html>
