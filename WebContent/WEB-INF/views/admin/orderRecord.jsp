<%@page import="product.model.vo.OrderDessertExt"%>
<%@page import="product.model.vo.OrderTable"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<OrderTable> otList = (List<OrderTable>)request.getAttribute("otList");
	List<OrderDessertExt> odeList = (List<OrderDessertExt>)request.getAttribute("odeList");
	String pageBar = (String)request.getAttribute("pageBar");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="../css/object.css"/>
	<style>
	div#pageBar{width:1400px; margin-bottom:75px; text-align:center; background-color:buttonhighlight; }
	div#pageBar span.cPage{width:1200px; color: #0066ff; margin-right: 5px;}
	div#pageBar a{margin-right: 5px;}
	
	
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
        width: 120px;
        height: 40px;
    }
    .productList th:nth-child(4){
        width: 100px;
        height: 40px;
    }
    .productList th:nth-child(5){
        width: 260px;
        height: 40px;
    }
    .productList th:nth-child(6){
        width: 60px;
        height: 40px;
    }
    .productList th:nth-child(7){
        width:300px;
        height: 40px;
    }
    .productList th:nth-child(8){
        width: 100px;
        height: 40px;
    }
	
	</style>



 <div id="wrap">
        <div id="header_11">
            <div><h2>주문 관리</h2></div>
        </div>
  
      
        
        <div class="productList" id="productList">
          	<table>
		<tr>
	
			 <th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>우편번호</th>
			<th>배송주소</th>
			<th>금액</th>
			<th>주문제품</th>
			<th>처리</th>
			
			
		</tr>
		<% for(OrderTable ot : otList) { %>
			<tr>
				<td><%= ot.getMemberId() != null ? ot.getMemberId() : "" %></td>
				<td><%= ot.getOrderReceiveName() != null ? ot.getOrderReceiveName() : "" %></td>
				<td><%= ot.getOrderReceivePhone() != null 
							? ot.getOrderReceiveMobile() + "<br>" + ot.getOrderReceivePhone()
	 						: ot.getOrderReceiveMobile() %></td>
				<td><%= ot.getZipCode() != null ? ot.getZipCode() : "" %></td>
				<td><%= ot.getOrderReceiveAddrDetail() != null
 						? ot.getOrderReceiveAddr() + " " + ot.getOrderReceiveAddrDetail()
 						: ot.getOrderReceiveAddr() %></td>
				<td><%= ot.getSumMoney() != 0 ? ot.getSumMoney() : "" %></td>
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
					<% String status = null; %>
					<% switch(ot.getOrderStatus()) {
					case 1 : status = "발송준비"; break;
					case 2 : status = "발송완료"; break;
					case 3 : status = "배송중"; break;
					case 4 : status = "배송완료"; break;
					case 5 : status = "주문취소"; break;
					} %>
					<%= status %>
				</td>
			</tr>
		<% } %>
	</table>

	<div id="pageBar">
		<%= request.getAttribute("pageBar") %>
	</div>
				
<%@ include file="/WEB-INF/views/common/footer.jsp" %>