<%@page import="product.model.vo.Basket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Basket> list = (List<Basket>)request.getAttribute("list");
	int amount = 0;
	for(Basket b : list) {
		amount += b.getBasketSumMoney()*b.getBasketAmountNum();
	}
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/10-11.css" />
<script type="text/javascript" src="../js/10-11.js"></script>  

<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
    <style>


        table {
            empty-cells: hide;
            position: relative;
        }
        input[type=submit] {
            width:100px; 
            height:50px; 
            color:white; 
            background:#3300ff; 
            position: relative; 
            top: 4px; 
        }
        fieldset#form-group {
            width: 700px;
            height: 450px;
          
            margin: 0 auto; 
            ont-family: 'Open Sans', sans-serif; 
            font-size: 15px; 
            font-weight: 400; 
            color: #888; 
            line-height:30px;
            text-align: center;
        }
        
        
        
        

    </style>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script>
    
    $(function() { 
        $("#zip_code_search").postcodifyPopUp(); 
    });
        var IMP = window.IMP;
        IMP.init('imp94594446');

        function order() {

            var sumMoney = document.getElementById("sumMoney").innerText;
            console.log("sumMoney= " + sumMoney);
            var productName = document.getElementById("productName").innerText;
            var email = document.getElementById("buyer_email").value;
            var receiveName = document.getElementById("receiveName").value;
			var buyer_tel = document.getElementById("buyer_tel").value;
			var postcodify_address = document.getElementById("postcodify_address").value;
			var postcodify_details = document.getElementById("postcodify_details").value;
			
			if(postcodify_details != null) {
				postcodify_address = postcodify_address + postcodify_details;
			}
			
			var postCode = document.getElementById("postcodify_postcode5").value;
			
            /********************************************************************/
            IMP.request_pay({
                pg : 'inicis', // version 1.1.0부터 지원.
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : productName,
                amount : sumMoney,
                buyer_email : email,
                buyer_name : receiveName,
                buyer_tel : buyer_tel,
                buyer_addr : postcodify_address,
                buyer_postcode : postCode
<%--                 m_redirect_url : '<%= request.getContextPath() %>/product/orderResult' --%>
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
<form name="orderform" id="orderform" method="post" class="orderform" action="/product/basketList">
    
    <input type="hidden" name="cmd" value="order">
   	<div class="basketdiv" id="basket">
    	<div class="row head">
        	<div class="subdiv">
<!--        	<div class="check">선택</div> -->
                <div class="img">이미지</div>
               	<div class="dessertName">상품명</div>
            </div>
            <div class="subdiv">
	            <div class="basketprice">가격</div>
	            <div class="num">수량</div>
	            <div class="sum">합계</div>
            </div>
       	</div> 
			<% int idx = 0; %>
			<% for(Basket b : list) { %>
			<% idx++; %>
     		<div class="row data">
            	<div class="subdiv">
<!--                <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div> -->
	                <div class="img"><img src="../images/basket1.jpg" width="60"></div>
	                <div class="dessertName"><%= b.getDessertName() %></div>
                </div>
                <div class="subdiv">
                	<div class=basketprice><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%= b.getBasketSumMoney()*b.getBasketAmountNum() %>"><%= b.getBasketSumMoney() %>원</div>
                    <div class="num">
                    	<div class="updown">
                        	<div><%= b.getBasketAmountNum() %></div>
<%--                        <span onclick="javascript:basket.changePNum(<%= idx %>);"> --%>
<!--                       		<i class="fas fa-arrow-alt-circle-up up"></i> -->
<!--                        </span> -->
<%--                        <span onclick="javascript:basket.changePNum(<%= idx %>);"> --%>
<!--                        	<i class="fas fa-arrow-alt-circle-down down"></i> -->
<!--                       	</span> -->
                        </div>
                    </div>
					<div class="sum"><%= b.getBasketSumMoney() %>원</div>    
                </div>
			</div> <!-- row data -->
					
			<% } %>
	</div>         
</form>
	<br>
    <fieldset id="form-group">
       
         
         
            
                <div class="form-group">
                    <label for="username">받는 사람:</label>
                     <input type="text" id="receiveName" placeholder="받는 사람" value="<%= memberLoggedIn.getMemberName() %>"><br />
              
         
                    <label for="username">검색:</label>
                     <input type="text" id="postcodify_postcode5" class="postcodify_postcode5" value="<%= memberLoggedIn.getZipCode() != null ? memberLoggedIn.getZipCode() : "" %>" readonly />
       			    <button id="postcodify_search_button">검색</button><br />
               
                    <label for="username">주소:</label>
                   <input type="text" id="postcodify_address" class="postcodify_address" value="<%= memberLoggedIn.getMemberAddr() != null ? memberLoggedIn.getMemberAddr() : "" %>" readonly /><br />
            		
            	
            	<label for="username">전화번호:</label>
            		<input type="text" id="postcodify_details" class="postcodify_details" value="<%= memberLoggedIn.getMemberAddrDetail() != null ? memberLoggedIn.getMemberAddrDetail() : "" %>" /><br />
            	
         
             
                    <label for="username">전화번호:</label>
                   <input type="text" placeholder="핸드폰 번호" id="buyer_tel" value="<%= memberLoggedIn.getMobileNum() != null ? memberLoggedIn.getMobileNum() : "" %>"><br />
          
                   
              
                    <label for="username">집 전화번호:</label>
          			  <input type="text" placeholder="집 전화번호" value="<%= memberLoggedIn.getPhoneNum() != null ? memberLoggedIn.getPhoneNum() : "" %>"><br />
          
    
                    <label for="username">이메일 :</label>
          			     <input type="text" placeholder="이메일" id="buyer_email" value="<%= memberLoggedIn.getEmail() != null ? memberLoggedIn.getEmail() : "" %>"><br />
            		
         
                    <label for="username">요구 사항:</label>
          			 <textarea name="" id="" cols="30" rows="10" placeholder=""></textarea>
          			        <br />
          			   <input type="button" value="결제" onclick="order();">
            
         

        
    </fieldset>
			<br>
			<div class="bigtext right-align sumcount" id="sum_p_num">
				<% if(list.size() == 1) { %>
					<span id="productName"><%= list.get(0).getDessertName() %></span>
				<% } else { %>
					<span id="productName"><%= list.get(0).getDessertName() %> 등 <%= list.size() %>종</span>
				<% } %>
			</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price"><span id="sumMoney"><%= amount %></span><span>원</span></div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>