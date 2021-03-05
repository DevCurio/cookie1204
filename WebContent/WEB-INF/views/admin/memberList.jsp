<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	List<Member> list = (List<Member>)request.getAttribute("list");
	Member member = (Member)request.getAttribute("member");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<style>
	div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
	div#search-memberId {display: <%= "memberId".equals(searchType) || searchType == null ? "inline-block" : "none" %>;}
	div#search-memberName{display:<%= "memberName".equals(searchType) ? "inline-block" : "none" %>;}
	@CHARSET "UTF-8";

section#memberList-container {text-align:center;}
section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }

section#memberList-container div#numPerPage-container{float:right; margin-top: 10px;}
section#memberList-container form#numPerPageFrm{display:inline;}

section#memberList-container div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
section#memberList-container div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
section#memberList-container div#pageBar a{margin-right: 5px;}
</style>
<script>


 function adminDelete(member_id){
	if(confirm("이 회원을 삭제하시겠습니까?")){
	  location.href="<%=request.getContextPath() %>/admin/memberDeleteList?memberId="+member_id;
	}
		
 }
$(function(){
	
	/**
	* 검색타입 변경 이벤트핸들러
	*/
	$("#searchType").change(function(){
		var type = $(this).val();//memberId | memberName 
		var $divSearchTypes = $(".search-type");
		
		$divSearchTypes
			.hide()
			.filter("#search-" + type)
			.css('display', 'inline-block');
	});

	

	
});


</script>


<section id="memberList-container">
	<h2>회원관리</h2>
	
	<div id="search-container">
        검색타입 : 
        <select id="searchType">
            <option value="memberId" <%= "memberId".equals(searchType) ? "selected" : "" %>>아이디</option>		
            <option value="memberName" <%= "memberName".equals(searchType) ? "selected" : "" %>>회원명</option>
       
        </select>
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input 
                	type="text" name="searchKeyword"  size="25" 
                	placeholder="검색할 아이디를 입력하세요."
                	value="<%= "memberId".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberName" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberName"/>
                <input 
                	type="text" name="searchKeyword" size="25" 
                	placeholder="검색할 이름을 입력하세요."
                	value="<%= "memberName".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
     
    </div>
	
	<table id="tbl-member">
		<thead>
			<tr>
				<th>아이디</th>	
				<th>이름</th>
				<th>이메일</th>
				<th>모바일전화번호</th>	
				<th>주소</th>
				<th>동</th>
				<th>가입일</th>
				
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<% if(list == null || list.isEmpty()) { %>
			
			<tr>
				<td colspan="10" style="text-align:center;">
				
				</td>
			</tr>
		
		<% } else { 
			for(Member m : list) { %>
				
			<tr>
				<td><%= m.getMemberId() %></td>
				<td><%= m.getMemberName() %></td>
				<td><%= m.getEmail() != null ?  m.getEmail() : "" %></td>
				<td><%= m.getMobileNum() %></td>
				<td><%= m.getMemberAddr() != null ? m.getMemberAddr() : "" %></td>
				<td><%= m.getMemberAddrDetail() != null ? m.getMemberAddrDetail() : "" %></td>
				<td><%= m.getEnrollDate() %></td>
			
				<td><input type="button" value="삭제하기" onclick="adminDelete('<%= m.getMemberId()%>');"/></td>
		</tr>  

			
		<% 	} 
			
		
		  } %>
			
		
		</tbody>
	</table> 
	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>
	    </form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>