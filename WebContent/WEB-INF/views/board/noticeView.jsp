<%@page import="board.model.vo.Notice"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	

<script>
	
  	
</script>		
	<style>
		div#board-container{width:800px; margin:0 auto; text-align:center;}
		div#board-container h2{margin:10px 0;}
		table #table {
		border:1px solid black; 
		}
		table#table tbl-board-view {
			width:1100px; 
			margin:0 auto; 
			border:2px solid black; 
			border-collapse:collapse;  
			min-width : 600px;
		}
		table#table tbl-board-view th {
			width: 150px; 
			border: 1px solid; 
			padding: 10px 0; 
			text-align:center; 
		} 
		table#table tbl-board-view td {
			border:1px solid; 
			padding: 5px 0 5px 15px; 
			text-align:left;
		}
		
		table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
		table#tbl-comment tr:hover button.btn-delete{display:inline;}
		
		
		img{
		max-width:700px; 
		margin:0 auto; 
		background-size: cover;
		}
		
		#contentLine {
			border-bottom : 1px solid black;	
			border-top : 1px solid black;	
			width : 800px;
		}
	</style>
			
<div id="board-container">
	<thead>
	<tr>
		<th colspan="2" style="background-color: #eeeeee; text-align: center;"></th>
	</tr>
		</thead>
	<h2>공지글</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%= notice.getNoticeNum() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= notice.getNoticeTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= notice.getNoticeWriter() %></td>
		</tr>
		
		<tr>
            <th colspan="2" id="contentLine">내 용</th>
        </tr>
        <tr>
            <td colspan="2"><%= notice.getNoticeContent() %>
            	<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
			<% if(notice.getNoticeOriginalImage() != null){ %>
			<br>
		<br>
		<img src="<%=request.getContextPath() %>/images/notice/<%=notice.getNoticeRenameImage() %>" />	
		
			<% } %>
			
		</td>
        </tr>


			
		<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
		<% if(
			memberLoggedIn != null
		 &&  ("Y".equals(memberLoggedIn.getIsAdmin()))
		){ %>
		<tr>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard();"/> 
				<input type="button" value="삭제하기" onclick="Noitcedelete('<%= notice.getNoticeNum() %>');" />
			</th>
		</tr>
		
		<script>
	 	function updateNotice(){
	        location.href="<%=request.getContextPath()%>/board/noticeUpdate?noticeNum=<%=notice.getNoticeNum() %>";
		} 
		
		function Noitcedelete(notice_Num){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				$("[name=noitceDelFrm]").submit();
			}
		}
		</script>
		<form 
			action="<%= request.getContextPath() %>/board/NoitceDeleteList"
			method="POST"
			name="noitceDelFrm">
			<input type="hidden" name="noticeNum" value="<%= notice.getNoticeNum() %>"/>
		</form>
		<% } %>
	</table>
	
</div>
				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>