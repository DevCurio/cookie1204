<%@page import="product.model.vo.Basket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Basket> list = (List<Basket>)request.getAttribute("list");
	int amount = 0;
	for(Basket b : list) {
		amount += b.getBasketSumMoney();
	}
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
			
    <style>
    
        table {
            empty-cells: hide;
            position: relative;
        }
        input[type=submit] {
            width:60px; 
            height:50px; 
            color:white; 
            background:#3300ff; 
            position: relative; 
            top: 4px; 
        }
        fieldset {
            width: 500px;
            height: 500px;
        }

    </style>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    
    <script>
        var IMP = window.IMP;
        IMP.init('imp94594446');

        function order() {

            var sumMoney = document.getElementById("sumMoney").innerText;
            var productName = document.getElementById("productName").innerText;

            /********************************************************************/
            IMP.request_pay({
                pg : 'inicis', // version 1.1.0부터 지원.
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : productName,
                amount : sumMoney,
                buyer_email : 'asrisk@naver.com',
                buyer_name : '구매자이름',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456',
                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
                if ( rsp.success ) {
                    
                    // 주문번호
                    var orderTradeNum = document.getElementsByName("orderTradeNum");
                    orderTradeNum[0].value = rsp.merchant_uid;
                    
                    // 받는 사람
                    var orderReceiveName = document.getElementsByName("orderReceiveName");
                    var order_memberName = document.getElementById("order_memberName");
                    orderReceiveName[0].value = order_memberName.value;
                    
                    // 우편번호
                    var orderZipCode = document.getElementsByName("orderZipCode");
                    var order_zipCode = document.getElementById("order_zipCode");
                    orderZipCode[0].value = order_zipCode.value;
					
                    // 기본 주소
                    var orderReceiveAddr = document.getElementsByName("orderReceiveAddr");
                    var order_addr = document.getElementById("order_addr");
                    orderReceiveAddr[0].value = order_addr.value;
                    
                    // 상세 주소
                    var orderReceiveAddrDetail = document.getElementsByName("orderReceiveAddrDetail");
                    var order_addrDetail = document.getElementById("order_addrDetail");
                    orderReceiveAddrDetail[0].value = order_addrDetail.value;
                    
                    // 전화번호 (집)
                    var orderReceivePhone = document.getElementsByName("orderReceivePhone");
                    var order_phone = document.getElementById("order_phone");
                    orderReceivePhone[0].value = order_phone.value;
                    
                    // 핸드폰 번호
                    var orderReceiveMobile = document.getElementsByName("orderReceiveMobile");
                    var order_mobile = document.getElementById("order_mobile");
                    orderReceiveMobile[0].value = order_mobile.value;
                    
                    // 요구사항
                    var orderMemo = document.getElementsByName("orderMemo");
                    var order_memo = document.getElementById("order_memo");
                    orderMemo[0].value = order_memo.value;
                    
                    // 합계금액
                    var orderSumMoney = document.getElementsByName("orderSumMoney");
                    orderSumMoney[0].value = <%= amount %>;
                    
                    // 이메일
                    var orderEmail = document.getElementsByName("orderEmail");
                    var order_email = document.getElementById("order_email");
                    orderEmail[0].value = order_email.value;
                    
                    // 아이디
                    var memberId = document.getElementsByName("memberId");
                    var order_memberId = document.getElementById("order_memberId");
                    memberId[0].value = order_memberId.value;
                    
                    // 카드 승인번호
                    var cardNum = document.getElementsByName("cardNum");
                    cardNum[0].value = rsp.apply_num;
                    
                    // 결제정보 전달
                 	var order_success = document.getElementById("order_success");
         			order_success.submit();
//                     msg += '고유ID : ' + rsp.imp_uid;
//                     msg += '상점 거래ID : ' + rsp.merchant_uid;
//                     msg += '결제 금액 : ' + rsp.paid_amount;
//                     msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    var msg = '결제에 실패하였습니다. ';
                    msg += ' 에러내용 : ' + rsp.error_msg;
                    alert(msg);
                }
            });
            /******************************************************************/
        }

    </script>
    			
    <form action="<%= request.getContextPath() %>/product/orderResult" id="order_success" method="post">
    
    	<input type="hidden" name="orderTradeNum" value="" />
    	<input type="hidden" name="orderReceiveName" value="" />
    	<input type="hidden" name="orderZipCode" value="" />
    	<input type="hidden" name="orderReceiveAddr" value="" />
    	<input type="hidden" name="orderReceiveAddrDetail" value="" />
    	<input type="hidden" name="orderReceivePhone" value="" />
    	<input type="hidden" name="orderReceiveMobile" value="" />
    	<input type="hidden" name="orderMemo" value="" />
    	<input type="hidden" name="orderSumMoney" value="" />
    	<input type="hidden" name="orderEmail" value="" />
    	<input type="hidden" name="memberId" value="" />
    	<input type="hidden" name="cardNum" value="" />
    </form>
    						
	<br><br>
	<table>
		<tr>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<% for(Basket b : list) { %>
		<tr>
			<td><%= b.getDessertName() %></td>
			<td><%= b.getBasketAmountNum() %></td>
			<td><%= b.getBasketSumMoney() %></td>
		</tr>
		<% } %>
	</table>
	<br>
	<% if(list.size() == 1) { %>
		<span id="productName"><%= list.get(0).getDessertName() %></span>
	<% } else { %>
		<span id="productName"><%= list.get(0).getDessertName() %></span><span> 등 <%= list.size() %>종</span>
	<% } %>
	<br>
	<span id="sumMoney"><%= amount %></span><span>원</span><br />
			
    <form action="" id="order">
        <fieldset>
            <input type="text" id="order_memberId" value="<%= memberLoggedIn.getMemberId() %>" readonly><br />
            <input type="text" id="order_memberName" placeholder="받는 사람" value="<%= memberLoggedIn.getMemberName() %>"><br />
            <input type="text" id="order_zipCode" class="postcodify_postcode5" value="<%= memberLoggedIn.getZipCode() != null ? memberLoggedIn.getZipCode() : "" %>" readonly />
            <button id="postcodify_search_button">검색</button><br />
            <input type="text" id="order_addr" class="postcodify_address" value="<%= memberLoggedIn.getMemberAddr() != null ? memberLoggedIn.getMemberAddr() : "" %>" readonly /><br />
            <input type="text" id="order_addrDetail" class="postcodify_details" value="<%= memberLoggedIn.getMemberAddrDetail() != null ? memberLoggedIn.getMemberAddrDetail() : "" %>" /><br />
            <input type="text" id="order_mobile" placeholder="핸드폰 번호" id="buyer_tel" value="<%= memberLoggedIn.getMobileNum() != null ? memberLoggedIn.getMobileNum() : "" %>"><br />
            <input type="text" id="order_phone" placeholder="집 전화번호" value="<%= memberLoggedIn.getPhoneNum() != null ? memberLoggedIn.getPhoneNum() : "" %>"><br />
            <input type="text" id="order_email" placeholder="이메일" id="buyer_email" value="<%= memberLoggedIn.getEmail() != null ? memberLoggedIn.getEmail() : "" %>"><br />
            <textarea id="order_memo" id="" cols="30" rows="10" placeholder="요구사항" ></textarea><br />
            <input type="button" value="결제" onclick="order();">
        </fieldset>
    </form>
		
<%@ include file="/WEB-INF/views/common/footer.jsp" %>