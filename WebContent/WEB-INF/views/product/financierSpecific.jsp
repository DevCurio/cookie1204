<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>

<%
	List<Dessert> list = (List<Dessert>)request.getAttribute("list");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<p>마들렌</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("휘낭시에")){
	%>
		<div class="madelen">
			<img src="<%= request.getContextPath() %>/images/instagram.png" alt="인스타"/>		
			<p><%=dessert.getDessertName()%></p>
			<p>	<%=dessert.getDessertPrice() %>￦</p>
			
		</div>
	<%  }
	} %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>