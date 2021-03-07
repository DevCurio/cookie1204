<%@page import="board.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
	
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="../css/mainIndex.css">





<!-- Custom Style -->
<link rel="stylesheet" href="../container/css/style.css">

<link rel="stylesheet" href="../css/notice.css">
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<style>



/*게시판*/
section#board-container{width:700px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 

/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 20px;}

/*페이지바*/
div#pageBar{margin-bottom:700px; text-align:center; background-color:buttonhighlight; }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}



/* 삭제버튼관련 */
table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

</style>


<section id="board-container">

	<div id="contents">
			<div id="content">
				
				<div class="board_qna">
					<h1 id="qna_head">공지사항</h1>
					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="20%">
								<col width="40%">
								<col width="20%">
															</colgroup>
							<thead>
							
								<tr class="">
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">날짜</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="" var='boardDtos' varStatus='status'>
								<tr class="item">
									<% for(Notice n : list){ %>
		<tr>
			<td><%= n.getNoticeNum() %></td>
			<td>
		<a href="<%= request.getContextPath() %>/board/noticeView?noticeNum=<%= n.getNoticeNum() %>">
					<%= n.getNoticeTitle() %>
				</a>
			</td>
			<td><%= n.getNoticeWriter() %></td>
		
			
		
			
			<td><%= n.getNoticeDate() %></td>
			
		<% } %>
								</tr>
								<tr class="hide">
								<!-- 이미지 넣기 -->
									<!-- <td colspan="3">
										<div class="item_name">
											상품명 클릭시 해당 상품 상세페이지 이동
											<a href="">ㅅ</a>
										</div>
										<div class="item_img">
											<img src="http://placehold.it/200X200">
										</div>
									</td> -->
									<td colspan="4">
										
									</td>	
								</tr>
								</c:forEach>
							</tbody>
						</table>
		
	<h2> 공지글 </h2>
	<% if(
			memberLoggedIn != null
		 && ("Y".equals(memberLoggedIn.getIsAdmin()))
		){ %>
	<input 
	type="button" 
		value="글쓰기" 
		id="btn-add"
		onclick="location.href='<%= request.getContextPath() %>/board/noticeEnroll';" />

	<% } %>

	
	<table id="tbl-board">
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
			<div align="center">날짜</div>
		</td>
	</tr>
		<% for(Notice n : list){ %>
		<tr>
			<td><%= n.getNoticeNum() %></td>
			<td>
		<a href="<%= request.getContextPath() %>/board/noticeView?noticeNum=<%= n.getNoticeNum() %>">
					<%= n.getNoticeTitle() %>
				</a>
			</td>
			<td><%= n.getNoticeWriter() %></td>
		
			
		
			
			<td><%= n.getNoticeDate() %></td>
			
		<% } %>
		
		</tr>
	</table>

	<div id='pageBar'><%=request.getAttribute("pageBar") %></div>
	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>