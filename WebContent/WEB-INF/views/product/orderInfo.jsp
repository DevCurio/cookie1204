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
                buyer_email : 'iamport@siot.do',
                buyer_name : '구매자이름',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456',
                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
                if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
            /******************************************************************/
        }

    </script>			
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
<%--             <input type="hidden" id="sumMoney" value="<%= amount %>" /> --%>
            <input type="text" value="honggd" readonly><br />
            <input type="text" placeholder="받는 사람"><br />
            <input type="text" name="" class="postcodify_postcode5" value="13579" readonly />
            <button id="postcodify_search_button">검색</button><br />
            <input type="text" name="" class="postcodify_address" value="미리 써놓는거" readonly /><br />
            <input type="text" name="" class="postcodify_details" value="배정하는거 가능허냐?" /><br />
            <input type="text" name="" class="postcodify_extra_info" value="" /><br />
            <input type="text" placeholder="핸드폰 번호" id="buyer_tel"><br />
            <input type="text" placeholder="집 전화번호"><br />
            <input type="text" placeholder="이메일" id="buyer_email"><br />
            <textarea name="" id="" cols="30" rows="10" placeholder="요구사항" ></textarea><br />
            <input type="button" value="결제" onclick="order();"">
        </fieldset>
    </form>
		
<%@ include file="/WEB-INF/views/common/footer.jsp" %>