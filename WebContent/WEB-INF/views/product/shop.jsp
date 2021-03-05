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
	
	.finance{
		display:inline-block;
		border: 1px solid black;
	}
	.madelen{
		display:inline-block;
		border: 1px solid black;
	
	}
	.special{
		display:inline-block;
		border: 1px solid black;
		
	}
	.dessert:hover{
		color:red;
		background-color:yellow;
	}
	
	
	</style>
	
	
	
	
	<h2>shopping</h2>
	<hr />
	<br />
	<a href="<%=request.getContextPath()%>/admin/dessertUpload">새 제품 업로드하기</a>
	<br />
	<hr>
    <p>마들렌</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("마들렌")){
	%>
		<div class="dessert madelen" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<p>	<%=dessert.getDessertPrice() %>￦</p>
			
		</div>
	<%  }
	} %>
	
	
	<hr>
    <p>휘낭시에</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("휘낭시에")){
	%>
		<div class="dessert finance" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<p>	<%=dessert.getDessertPrice() %>￦</p>
		</div>
	<%  }
	} %>
		
	<hr />
    <p>기타 Special 메뉴</p>
    <% for(Dessert dessert : list){
		if(!(dessert.getDessertCategory().equals("휘낭시에")) &&
				!(dessert.getDessertCategory().equals("마들렌"))){
	%>
		<div class="dessert special" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<p>	<%=dessert.getDessertPrice() %>￦</p>
		</div>
	<%  }
	} %>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>