<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>
<%@page import="member.model.vo.Member"%>


<% 
	Dessert dessert = (Dessert)request.getAttribute("dessert");	

	Member member = (Member)session.getAttribute("memberLoggedIn");
%>
<link rel="stylesheet" href="../css6/default.css">
<link rel="stylesheet" href="../css6/style.css">
<style>


</style>

<script>
    function formsubmit(f){
    	/* console.log(f)
    	console.log(document.getElementById("amount")); */
    	
    	
    	var number = document.getElementById("amount").value;
    	console.log(number);
    	
    	if(typeof number == "undefined" || number == null || number == ""){
    		alert("숫자를 입력해주세요");
            f.amount.focus();          
    		return;    		
    	}

    	else if(number<1 || number >20){
        	alert("1~20사이의 숫자를 입력해주세요.");
            f.amount.focus();
            return;
        }
    	else{
    		f.method = "post";
            f.submit(); 
    	}
    }
    
    function backBeforePage(){
    	window.history.back();
    }
</script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	#descImg {
		margin-top : 50px;
	}
</style>


<form action="<%=request.getContextPath()%>/product/BasketUpload?dessertNum=<%=dessert.getDessertNum()%>">
<div class="product_view">
		<h2><p name="name" id="name"><%=dessert.getDessertName() %></p></h2>
		<table>
		
			<tbody>
			
		<tr>
			<td>Dessert No. : </td>
			<td>
				<p name="num" id="num"><%=dessert.getDessertNum()%></p>
			</td>
		</tr>
			
		<tr>
			<td>Category : </td>
			<td>
				<p name="category" id="category"><%=dessert.getDessertCategory() %></p>
		</td>
			
			
		</tr>
			
		<tr>
			<td>가격 : </td>
			<td >
				<p name="price" id="price"><%=dessert.getDessertPrice()%>원</p>
			</td>
		</tr>
		
			<tr>
			<td>남은 수량 : </td>
			<td>
			<p name="remain" id= remain><%=dessert.getDessertAmount() %>개</p>
			</td>
		</tr>
		
		<%if(dessert.getDessertIsBest().equals("Y") && dessert.getDessertAmount() != 0){ %>
		<tr>
			<td>수량 : </td>
			<td>
				<input type="number" name="amount" id="amount" placeholder="수량을 입력하세요(0~20)"
                max="20" min="1" step="1"
                style="width: 150px;">
			</td>
		</tr>
		<%} %>
	
		
	<%if(dessert.getDessertIsBest().equals("Y") && dessert.getDessertAmount() != 0){ %>
			
	
		<%} %>
		<tr>
			<td>제품 설명 : </td>
			
			<td>	<p><%=dessert.getDessertContent() %></td>
			
		</tr>

	
		
		<%if(dessert.getDessertIsBest().equals("Y") && dessert.getDessertAmount() != 0){ %>
		
			<tr>
				<td colspan="2">
					<input class="descriptionButton" type="button" value="장바구니 담기" onclick="formsubmit(this.form)">
				</td>
			</tr>
		<%}
		else{ %>
			<tr>
				<td colspan="2">
					<input class="descriptionButton" type="button" value="돌아가기" onclick="backBeforePage();"/>
				</td>
			</tr>
		<%} %>
			</tbody>
		</table>
		
		
		<div class="img">
			<td colspan="2">
				<img id="descImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />
			</td>
<!-- 			<ul> -->
<!-- 			<li class="on"><a href="#a"><img src="images/@thoumb.png" alt=""></a></li> -->
<!-- 			<li><a href="#a"><img src="images/@thoumb.png" alt=""></a></li> -->
<!-- 			</ul> -->
		</div>
		
		
		
		
		
		
		

<form action="<%=request.getContextPath()%>/product/BasketUpload?dessertNum=<%=dessert.getDessertNum()%>">
	
		
	
	
	</table>
	
</form>	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>