<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>

<%
	List<Dessert> list = (List<Dessert>)request.getAttribute("list");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<style>
	img{
		width:100px;
		height:100px;
	}
	#exercise{
		display:inline;
	}
	</style>
	
	<h2>shopping</h2>
	<p>연습</p>
	<% for(Dessert dessert : list){ 
	%>
		<table id="exercise" border="1">
			<tr>
				<td colspan="2">
					<img src="<%= request.getContextPath() %>/images/instagram.png" alt="인스타"/>		
				</td>
			</tr>
			<tr>
				<td><%=dessert.getDessertName()%>
				</td>
				<td>
					<%=dessert.getDessertPrice() %>￦
				</td>
			</tr>
		</table>
	<%} %>
	
	
	<hr />
	<br /><br />
	<p>마들렌</p>
	<div id="madlen_section">
		<span>
		<img src="<%= request.getContextPath() %>/images/instagram.png" alt="인스타"/>
		</span>
		<span>
		<img src="<%= request.getContextPath() %>/images/dessert/pumpkin pie.JPG" alt="인스타" />
		</span>
	</div>
	
	<p><%= request.getContextPath() %>/images/instagram.png</p>
		
	
	<hr>
    <p>휘낭시에</p>
    <div>
    <hr>
    </div>
    <p>기타 Special 메뉴</p>
    <div>

    </div>
    <hr>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    