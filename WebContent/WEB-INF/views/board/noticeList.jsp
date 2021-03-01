<%@page import="board.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>

/*게시판*/
section#board-container{width:600px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 

/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 20px;}

/*페이지바*/
div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3); }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}

/*게시글 작성/상세보기 테이블*/
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

/* 삭제버튼관련 */
table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

</style>


<section id="board-container">
	<h2> 공지글 </h2>
	<% if(memberLoggedIn != null){ %>
	<input 
	type="button" 
		value="글쓰기" 
		id="btn-add"
		onclick="location.href='#';" />
	<% } %>
	
	<table width=570 border="0" cellpadding="0" cellspacing="0">
	
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">작성일</div>
		</td>
	
	</tr>
		<% for(Notice n : list){ %>
		<tr>
			<td><%= n.getNoticeNum() %></td>
			<td>
			<a href="#">
				<%= n.getNoticeTitle() %></a>
			</td>
			<td><%= n.getNoticeWriter() %></td>
			<td><%= n.getNoticeDate() %></td>
			
		<% } %>
			<tr align="right">
		<td colspan="5">
	   		<a href="./BoardWrite.bo">[글쓰기]</a>
		
		</td>
		</tr>
	</table>

	<div id='pageBar'><%=request.getAttribute("pageBar") %></div>
	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>