<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>
<%@page import="member.model.vo.Member"%>


<% 
	Dessert dessert = (Dessert)request.getAttribute("dessert");	

	Member member = (Member)session.getAttribute("memberLoggedIn");
%>

<style>
	#specific{
		width:600px;
		height:300px;
		border:1px solid black;
		margin-top: 30px;
		margin-left:30px;
		border:1px solid black;
		margin-left:100px;
		text-align:center;
		padding: 10px;
			
	}
	#specific img{0
		width:200px;
		height:200px;
		float :none;
	}
	#description{
		width:300px;
	}
	
	#specific *{
		padding:10px;
	}
	
	.descriptionButton{
		text-decoration: none;
		background-color: green;
		color:white;
		font-weight:bold;
	}
	
	
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

<form action="<%=request.getContextPath()%>/product/BasketUpload?dessertNum=<%=dessert.getDessertNum()%>">
	<table name="specific" id="specific">	
		<tr>
			<td colspan="2">
				<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />
			</td>
		</tr>
		
		<tr>
			<td>Dessert No. : </td>
			<td>
				<p name="num" id="num"><%=dessert.getDessertNum()%></p>
			</td>
		</tr>
		<tr>
			<td>디저트 이름 : </td>
			<td>
				<p name="name" id="name"><%=dessert.getDessertName() %></p>
			</td>
		</tr>
		
		<tr>
			<td>Category : </td>
			<td>
				<p name="category" id="category"><%=dessert.getDessertCategory() %></p>
			</td>
		</tr>
		
		<tr>
			<td>남은 수량 : </td>
			<td>
			<p name="remain" id= remain><%=dessert.getDessertAmount() %>개</p>
			</td>
		</tr>
		
		<tr>
			<td>가격 : </td>
			<td >
				<p name="price" id="price"><%=dessert.getDessertPrice()%>￦</p>
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
		<tr>
			<td>제품 설명 : </td>
			<td id="description" style="border:1px solid black">
				<p><%=dessert.getDessertContent() %></p>	
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td></td>
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
	</table>
	
</form>	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>