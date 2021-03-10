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
    <link rel="stylesheet" href="../css/object.css"/>
</head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
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
	section#board-container{width:700px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
div#pageBar{width: 1400px; text-align:center; background-color:buttonhighlight; }
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
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
        width: 300px;
        height: 40px;
    }
    .productList th:nth-child(6){
        width: 500px;
        height: 40px;
    }
    .productList th:nth-child(7){
        width:50px;
        height: 40px;
    }
    .productList th:nth-child(8){
        width: 300px;
        height: 40px;
    }
	 .productList th:nth-child(9){
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