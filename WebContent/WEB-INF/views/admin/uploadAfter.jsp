<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>


<% 
	Dessert dessert = (Dessert)request.getAttribute("dessert");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<table>
		<tr>
			<td>Dessert No. : </td>
			<td><%=dessert.getDessertNum()%></td>
		</tr>
		<tr>
			<td>디저트 이름 : </td>
			<td><%=dessert.getDessertName() %></td>
		</tr>
		
		<tr>
			<td>제품군 : </td>
			<td><%=dessert.getDessertCategory() %></td>
		</tr>
		
		<tr>
			<td>수량 : </td>
			<td><%=dessert.getDessertAmount() %></td>
		</tr>
		
		<tr>
			<td>가격 : </td>
			<td><%=dessert.getDessertPrice()%>￦</td>
		</tr>
		
		<tr>
			<td>가격 : </td>
			<td><%=dessert.getDessertPrice()%>￦</td>
		</tr>
		<tr>
			<td>이미지 : </td>
			<td>
				<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />
			</td>
		</tr>
		<tr>
			<td colspan="2">/images/dessert/<%=dessert.getDessertImage2()%></td>
		</tr>
		
		
		
		
	</table>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>