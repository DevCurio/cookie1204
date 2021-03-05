<%@page import="product.model.vo.OrderDessertExt"%>
<%@page import="product.model.vo.OrderTable"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<OrderTable> list = (List<OrderTable>)request.getAttribute("list");
	List<OrderDessertExt> odeList = (List<OrderDessertExt>)request.getAttribute("orderDessertExt");
	String pageBar = (String)request.getAttribute("pageBar");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<script>
		function finish(tradeNum) {
			location.href="<%= request.getContextPath() %>/admin/orderFinish?orderTradeNum=" 
					+ tradeNum;
		}
		
		function cancel(tradeNum) {
			location.href="<%= request.getContextPath() %>/admin/orderCancel?orderTradeNum=" 
					+ tradeNum;
		}

	</script>

	<style>
		table {
			border : 1px solid black;
			border-collapse : collapse;
		}
		th, td {
			border : 1px solid black;
		}
	</style>

	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>우편번호</th>
			<th>배송주소</th>
			<th>요청사항</th>
			<th>금액</th>
			<th>주문제품</th>
			<th>처리</th>
		</tr>
		<% for(OrderTable ot : list) { %>
			<tr>
				<td><%= ot.getMemberId() %></td>
				<td><%= ot.getOrderReceiveName() %></td>
				<td><%= ot.getOrderReceivePhone() != null 
						? ot.getOrderReceiveMobile() + "<br>" + ot.getOrderReceivePhone() 
						: ot.getOrderReceiveMobile() %></td>
				<td><%= ot.getZipCode() %></td>
				<td><%= ot.getOrderReceiveAddrDetail() != null
						? ot.getOrderReceiveAddr() + " " + ot.getOrderReceiveAddrDetail()
						: ot.getOrderReceiveAddr() %></td>
				<td><%= ot.getOrderMemo() != null ? ot.getOrderMemo() : "" %></td>
				<td><%= ot.getSumMoney() %></td>
				<% StringBuilder sb = new StringBuilder(); %>
				<td><% for(OrderDessertExt ode : odeList) { %>
						<% if(ode.getOrderTradeNum().equals(ot.getOrderTradeNum())) { %>
							<% sb.append(ode.getDessertName() + " " + ode.getOrderDessertAmount() + "개<br>"); %>
						<% } %>
					<% } %>
					<% String str = sb.toString(); %>
					<% if(!(str.equals(""))) { %>
						<%= str.substring(0, str.length()-4) %>
					<% } %>
				</td>
				<td>
					<input type="button" value="처리" onclick="finish('<%= ot.getOrderTradeNum() %>');" />
					<input type="button" value="취소" onclick="cancel('<%= ot.getOrderTradeNum() %>');" />
				</td>
			</tr>
		<% } %>
	</table>

	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>