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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/10-11.css" />
<script type="text/javascript" src="../js/10-11.js"></script>  
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
<form name="orderform" id="orderform" method="post" class="orderform" action="/product/basketList">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="dessertName">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                  		
                   	
         	

			<% int idx = 0; %>
		<% for(Basket b : list) { %>
		
			<% idx++; %>
     <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="../images/basket1.jpg" width="60"></div>
                        <div class="dessertName"><%= b.getDessertName() %>
						</div>
                    </div>
                    <div class="subdiv">
                        <div class=basketprice><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%= b.getBasketSumMoney() %>"><%= b.getBasketSumMoney() %>원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num<%= idx %>" id="p_num<%= idx %>" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(<%= idx %>);">
                                <span onclick="javascript:basket.changePNum(<%= idx %>);">
                                <i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(<%= idx %>);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>

						<div class="sum"><%= b.getBasketSumMoney() %>원</div>
                        
                    </div>
			</div>
					
          </div>
          
        </form>
		<% } %>
		<br>
		<br>
			
	</table>
  	 <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num"></div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price"></div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
		

            </div>
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