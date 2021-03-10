
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/object.css"/>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" /> --%>
<style>
	div#search-container {width:1400px; margin:0 0 10px 0; padding:3px; background-color: #d3d3d3;}
	div#search-memberId {display: <%= "memberId".equals(searchType) || searchType == null ? "inline-block" : "none" %>;}
	div#search-memberName{display:<%= "memberName".equals(searchType) ? "inline-block" : "none" %>;}
	section#board-container{width:700px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
div#pageBar{width:1400px; text-align:center; background-color:buttonhighlight; }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}




table#tbl-board td {border:1px solid; border-color:gray; ; padding: 5px 0; text-align:center;} 

input#btn-add{float:right; margin: 10 60 20px;}
    .productList{
        width: 1400px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        border: 1px solid #d3d3d3;
        border-top: 0px;
    }
    #productList{
       
        border: 1px solid #d3d3d3;
        background-color: #EFE8E4;
    }
    .productList div{
        border-left: 1px solid #d3d3d3;
        float: left;
    }
  
    .productList th:nth-child(1){
        width: 70px;
        height: 40px
        }
    .productList th:nth-child(2){
        width: 120px;
        height: 40px;
    }
    .productList th:nth-child(3){
        width: 200px;
        height: 40px;
    }
    .productList th:nth-child(4){
        width: 150px;
        height: 40px;
    }
    .productList th:nth-child(5){
        width: 400px;
        height: 40px;
    }
    .productList th:nth-child(6){
        width: 150px;
        height: 40px;
    }
    .productList th:nth-child(7){
        width: 110px;
        height: 40px;
    }
    .productList th:nth-child(8){
        width: 150px;
        height: 40px;
    }
	
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



	      <div id="wrap">
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
        <div class="productList" id="productList">
          	<table>
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
	<div id="pageBar"><%= request.getAttribute("pageBar") %>
	</div>
	    </form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
