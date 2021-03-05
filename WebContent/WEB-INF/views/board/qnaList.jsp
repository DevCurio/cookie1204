<%@page import="java.util.List"%>
<%@ page import="board.model.vo.Qna" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Qna> list = (List<Qna>)request.getAttribute("list");
	
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>

div#qna-search {
	padding : 1px;
	float: left;
	margin-bottom : 5px;
}


div#board-container{width:600px; margin:0 auto; text-align:center;}
div#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 

input#btn-add{float:right; margin: 0 0 15px;}

div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3); }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}

</style>


        
<div id="board-container">
	<h2>문의사항</h2>
	<div id="qna-search">
	    <form action="<%=request.getContextPath()%>/board/qnaSearch">
	        <input 
	        	type="text" 
	        	name="qnaSearch" 
	        	size="20" 
	        	placeholder="아이디 검색"
	        	value=""/>
	        <button type="submit">검색</button>			
	    </form>	
	</div>
	<% if(memberLoggedIn != null) { %>
	<input 
		type="button" 
		value="글쓰기" 
		id="btn-add"
		onclick="location.href='<%= request.getContextPath() %>/board/qnaEnroll';" />
	<% } %>
	
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<% for(Qna q : list){ %>
		<tr>
			<td><%= q.getQnaNum() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/board/qnaView?qnaNum=<%= q.getQnaNum() %>">
					<%= q.getQnaTitle() %>
				</a>
			</td>
			<td><%= q.getQnaWriter() %></td>
			<td><%= q.getQnaDate() %></td>
		</tr>
		<% } %>
	</table>

	<div id='pageBar'><%=request.getAttribute("pageBar") %></div>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>