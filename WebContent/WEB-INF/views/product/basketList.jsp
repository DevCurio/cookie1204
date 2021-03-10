<%@page import="product.model.vo.Basket"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Basket> list = (List<Basket>)request.getAttribute("basketlist");	
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/10-11.css" />
<script type="text/javascript" src="../js/10-11.js"></script>  

<style>
	#nonBasket {
		text-align : center;
	}

</style>


<script>
	function delItem(basketNum) {
		
    	$.ajax({
			url : "<%= request.getContextPath() %>/product/basketDeleteAjax",
			data : {
				basketNum : basketNum
			},
			dataType : "json",
			method : "post",
			success : function(data) {
				console.log("결과 : " + data);
			},
			error : function(xhr, status, err) {
				console.log(xhr, status, err);
			},
			complete : function() {
				console.log("basketDeleteAjax complete");
			}
		});
		
		event.target.parentElement.parentElement.parentElement.remove();
	}

	
	
	
	
</script>

	<br><br>
	<table>
		<form name="orderform" id="orderform" method="post" class="orderform" action="/product/basketList">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
<!--                         <div class="check">선택</div> -->
<!--                         <div class="img">이미지</div> -->
                        <div class="dessertName">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                      <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
	<% if(list != null && list.size() > 0) { %>
		<% for(Basket b : list) { %>
		
     <div class="row data">
                    <div class="subdiv">
<!--                         <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div> -->
<!--                         <div class="img"><img src="../images/basket1.jpg" width="60"></div> -->
                        <div class="dessertName"><%= b.getDessertName() %>
						</div>
                    </div>
                    <div class="subdiv">
                        <div class=basketprice><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%= b.getBasketSumMoney() %>"><%= b.getBasketSumMoney() %>원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num<%= b.getBasketNum() %>" id="p_num<%= b.getBasketNum() %>" size="2" maxlength="4" class="p_num" value="<%= b.getBasketAmountNum() %>" onkeyup="javascript:basket.changePNum(<%= b.getBasketNum() %>);">
                                <span onclick="javascript:basket.changePNum(<%= b.getBasketNum() %>);">
                                	<i class="fas fa-arrow-alt-circle-up up"></i>
                                </span>
                                <span onclick="javascript:basket.changePNum(<%= b.getBasketNum() %>);">
                                	<i class="fas fa-arrow-alt-circle-down down"></i>
                                </span>
                            </div>
                        </div>
                        
                        <div class="sum"><%= b.getBasketSumMoney()*b.getBasketAmountNum() %>원</div>
                        
                    </div>
			
						<div class="subdiv">
<%--                         <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem(<%= b.getBasketNum() %>);">삭제</a></div> --%>
                        	<div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="delItem(<%= b.getBasketNum() %>);">삭제</a></div>
                    </div>
          </div>
          
			<% } %>
		<% } else { %>
			<div class="row data" id="nonBasket">
				담긴 상품이 없습니다.
			</div>
		<% } %>
        </form>
		<br>
	<br>
	
	

<!-- 	   <div class="right-align basketrowcmd"> -->
<!--                 <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> -->
<!--                 <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a> -->
<!--             </div> -->
    
			<div class="bigtext right-align sumcount" id="sum_p_num">
			</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">
            <% int price = 0; %>
            <% for(Basket b : list) {
            	price += b.getBasketSumMoney()*b.getBasketAmountNum();
               } %>
            	합계금액: <%= price %>원
            </div>
    
    	<% if(list.size() > 0) { %>
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="<%= request.getContextPath() %>/product/orderInfo?memberId=<%= memberLoggedIn.getMemberId() %>">선택한 상품 주문</a>
                </div>
            </div>
        <% } %>
            
<%@ include file="/WEB-INF/views/common/footer.jsp" %>