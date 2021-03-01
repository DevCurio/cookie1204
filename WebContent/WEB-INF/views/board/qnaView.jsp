<%@page import="board.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
			
	<style>
		div#board-container{width:600px; margin:0 auto; text-align:center;}
		div#board-container h2{margin:10px 0;}
	
		table#tbl-board-view {
			width:500px; 
			margin:0 auto; 
			border:1px solid black; 
			border-collapse:collapse;  
		}
		table#tbl-board-view th {
			width: 150px; 
			border:1px solid; 
			padding: 10px 0; 
			text-align:center; 
		} 
		table#tbl-board-view td {
			border:1px solid; 
			padding: 5px 0 5px 15px; 
			text-align:left;
		}
		
		table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
		table#tbl-comment tr:hover button.btn-delete{display:inline;}
	</style>
					
<div id="board-container">

	<h2>게시판</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%= qna.getQnaNum() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= qna.getQnaTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= qna.getQnaWriter() %></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><%= qna.getQnaContent() %></td>
		</tr>
		<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
		<% if(
			memberLoggedIn != null
		 && (memberLoggedIn.getMemberId().equals(qna.getQnaWriter())
		 	|| "Y".equals(memberLoggedIn.getIsAdmin()))
		){ %>
		<tr>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard();"/> 
				<input type="button" value="삭제하기" onclick="deleteBoard();" />
			</th>
		</tr>
		
		<script>
		function updateBoard(){
	        location.href="<%=request.getContextPath()%>/board/qnaUpdate?qnaNum=<%=qna.getQnaNum() %>";
		}
		
		function deleteBoard(){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				$("[name=boardDelFrm]").submit();
			}
		}
		</script>
		<form 
			action="<%= request.getContextPath() %>/board/qnaDelete"
			method="POST"
			name="boardDelFrm">
			<input type="hidden" name="qnaNum" value="<%= qna.getQnaNum() %>"/>
		</form>
		<% } %>
	</table>
	
</div>
				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>