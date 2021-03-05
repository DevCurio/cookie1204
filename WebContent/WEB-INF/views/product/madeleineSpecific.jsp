<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>

<%
	List<Dessert> list = (List<Dessert>)request.getAttribute("list");
%>

<style>
	div>img{
		width:100px;
		height:100px;
		padding-top: 30px;
	}
	
	div.madelen{
		width:350px;
		height:250px;
		text-align: center;
		margin-top: 30px;
		display:inline-block;
	}
	
	div.madelen:hover{
		color: red;
		background-color: yellow;
	}
	
	.madelen{
		border:1px solid black;
	}
</style>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<p>마들렌</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("마들렌")){
	%>
		<div class="madelen" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%= dessert.getDessertImage1() %></p>
			<p><%=dessert.getDessertName()%></p>
			<p>	<%=dessert.getDessertPrice() %>￦</p>
			
		</div>
	<%  }
	} %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    