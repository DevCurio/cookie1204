<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>


<% 
	Dessert dessert = (Dessert)request.getAttribute("dessert");
%>

<style>
	#specific{
		width:300px;
		height:300px;
		border:1px solid black;
		margin-top: 30px;
		margin-left:30px;
			
	}
	#specific img{0
		width:200px;
		height:200px;
	}
	
</style>

<script>
	<%-- function moveToBasket(){
		location.href = "<%= request.getContextPath() %>/board/boardCommentDelete?boardCommentNo=" + boardCommentNo +"&boardNo=<%= board.getBoardNo() %>";
	} --%>
</script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<table name="specific" id="specific">	
		<tr>
			<td colspan="2">
				<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />
			</td>
		</tr>
		
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
		
	
		<%-- <tr>
			<td colspan="2">/images/dessert/<%=dessert.getDessertImage2()%></td>
		</tr> --%>
	</table>
	
	<input type="button" value="장바구니 담기" onclick="moveToBasket();" />
	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>