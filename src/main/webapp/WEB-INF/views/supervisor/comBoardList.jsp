
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.zoomin.common.ZoominUtils"%>
<%@page import="com.kh.zoomin.supervisor.model.dto.CompanyReview"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/supervisorLoginHeader.jsp" %>
<%
 List<CompanyReview> comList = (List<CompanyReview>) request.getAttribute("comList"); 
%>

</head>
<body>
<input type="button" class="btn" id="salBoard" value="연봉" onclick="location.href='<%= request.getContextPath()%>/supervisor/salBoardList';"/>
<input type="button" class="btn" id="comBoard" value="회사" onclick="location.href='<%= request.getContextPath()%>/supervisor/comBoardList';"/>
<input type="button" class="btn" id="recBoard" value="채용" onclick="location.href='<%= request.getContextPath()%>/supervisor/recBoardList';"/>

    <%-- 회사리뷰 게시판 --%>
   <section id="super-board">
    <div id="comBoard-container" class="board-container">
	<h2 class="h2">회사 리뷰 게시판</h2>
	<form action="<%= request.getContextPath() %>/supervisor/comReviewDel" method="post" name="comDelFrm">
    <table id="tbl-company-board" class="tb-manage" >
    	<thead>
    		<tr>
    			<th><input type="checkbox" name="allChk" class="allChk" /></th>
    			<th>no</th>
    			<th>회사명</th>
    			<th>content</th>
    			<th>작성자</th>
    			<th>등록일</th>
    		</tr>
    	</thead>
    	<tbody>
    		<%
    			if(comList != null && !comList.isEmpty()){
    				for(CompanyReview com : comList){
    		%>	
    		<tr>
    			<td>
  					<input type="checkbox" name="chk" value="<%= com.getNo() %>" />
				</td>
    			<td><%= com.getNo() %></td>
    			<td><%= com.getCompanyName() %></td>
    			<td>
    				<a href="#"><%= ZoominUtils.escapeXml(com.getContent()) %></a>
    			</td>
    			<td><%= com.getId() %></td>
    			<td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(com.getRegDate()) %></td>
    		</tr>
    		<%
    				}
    			}
    		%>
    	</tbody>	
    </table>
		</form>
			<div id='super-pagebar'>
				<%= request.getAttribute("comPagebar") %>
			</div>
	    <div class="under-tbl-btn">
			<input type="submit" class="btn" id="com-delete" value="삭제"/>
		</div>
	</div>
  </section>
	
	<script>
	document.querySelector("#com-delete").addEventListener('click', (e) => {
    	e.preventDefault()
    	if(confirm("정말 삭제하시겠습니까?"))
    		document.comDelFrm.submit();
    });
	
	
	 //전체선택
    document.querySelectorAll(".allChk").forEach((target) => {
       	const chk = document.querySelectorAll("[name=chk]");
       	const rowCnt = chk.length;
    	target.addEventListener('click', (e) => {
        	const check = target.checked;
        	if(check){
        		for(let i = 0; i < rowCnt; i++){
        			chk[i].checked = true;
        		}
        	} else {
        		for(let i = 0; i < rowCnt; i++){
        			chk[i].checked = false;
        		}
        	}
        })
    })
	
	</script>




</body>
</html>