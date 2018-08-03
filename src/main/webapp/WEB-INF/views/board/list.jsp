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
<title>게시글 목록</title>
<%@ include file="../include/member_header.jsp" %>
<script type="text/javascript">

    $(document).ready(function(){
        $("#btnWrite").click(function(){
        
            location.href = "${path}/board/write.do";
        });
        
       

    });
    
    function list(page){
    	
    	location.href="${path}/board/list.do?curPage="+page+"&searchOption=${map.seachOption}"+"&keyword=${map.keyword}";
    	//~~?변수명=값&변수값=값...
    }
    /*
    
    */
    

</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<div class="col-md-12">
    <h2>게시글 목록</h2>
    <form name="form1" method="post" action="${path}/board/list.do">
    <div class="6u$ 12u$(4)">
        <select name="searchOption"
        		style="width: 30%;">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+제목</option>
            <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select><br>
        </div>
        <div class="6u$ 12u$(4)">
        <input type="text" name="keyword" value="${map.keyword}"
        	style="width: 70%;"
         />
         </div>
        <div class="12u$">
					<ul class="actions">
								<li><input type="submit" value="조회"></li>
								
								
								 <c:if test="${sessionScope.userId !=null }">
           							<li><input type="button" id="btnWrite" value="글쓰기"></li>
       							 </c:if>
								</ul>
				</div>
       
    </form>
    
    
     ${map.count}개의 게시물이 있습니다.
       </div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
            			<th>제목</th>
           				 <th>이름</th>
            			<th>작성일</th>
            			<th>조회수</th>
					</tr>
				</thead>
				 <c:forEach var="row" items="${map.list}">
				<tbody>
        		<tr>
           		 <td>${row.bno}</td>
              <td>
            <!--   <a href="${path}/board/view.do?bno=${row.bno }"> ${row.title }</a> -->
               <a href="${path}/board/view.do?bno=${row.bno }&curPage=${map.boardPager.curPage }&searchOption=${map.searchOption }&keyword=${map.keyword }">
               ${row.title }
               <c:if test="${row.recnt >0}">
               	<span style="color:red;">
               	(${row.recnt})
               	</span>
               </c:if>
               </a> 
              </td>                    
         
            <td>${row.userName}</td>
            <td>
              <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
             <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>${row.viewcnt}</td>
        </tr>    
				</tbody>
				</c:forEach>
				
				
				
			</table>
			<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<c:if test="${map.boardPager.curBlock>1}"> 
              <a href="javascript:list('1')">[처음 ]</a>
             </c:if>
             
             <c:if test="${map.boardPager.curBlock>1 }">
               <a href="javascript:list('${map.boardPager.prevPage }')">[이전]</a>
               </c:if>
               
           <c:forEach var="num" begin="${map.boardPager.blockBegin}" 
        end="${map.boardPager.blockEnd}">
        <c:choose>
         <c:when test="${num==map.boardPager.curPage}">
           <span style="color:red"> ${num}</span> <!-- 색상변경 -->
         </c:when>
         <c:otherwise>
           <a href="javascript:list('${num}')"> |  ${num} | </a> &nbsp;
         </c:otherwise>        
        </c:choose>
        </c:forEach>  
           
           
           <!--  다음 페이지  -->
        <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
        <a href="javascript:list('${map.boardPager.nextPage}')"> [다음]
        </a>
        </c:if>
        
          <!--  끝 페이지  -->
        <c:if test="${map.boardPager.curPage<=map.boardPager.totPage}">
        <a href="javascript:list('${map.boardPager.totPage}')"> [끝]</a>
        </c:if>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
			
			
		</div>
	</div>
</div>
</body>
</html>
