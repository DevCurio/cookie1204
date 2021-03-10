<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page import="product.model.vo.Dessert"%>

<%
	List<Dessert> list = (List<Dessert>)request.getAttribute("list");
	String category =(String)request.getAttribute("category");
%>

<style>
	div>img{
		width:100px;
		height:100px;
		padding-top: 20px;
		float :none;
	}
	
	div.dessert{
		width:350px;
		height:250px;
		text-align: center;
		display:inline-block;
		position:relative;
	}
	
	.season:hover{
		color: red;
		background-color: yellow;
	}
	
	div.nonSeason{
		position: relative;
		background-color: rgb(40, 40, 40);
		opacity :0.3; 
		color : white;
	}
	
	.dessert{
		border:1px solid black;
		margin-left:30px;
		margin-top : 15px;
		margin-bottom:15px;
	}
	
	.is_non_Season{
		width:400px;
		position :absolute;
		text-align:center;
		color:red;
		font-size:50px;
		font-weight:bold;
		left:-7%;
		top:35%;
		
		-ms-transform: rotate(-35deg);
		-webkit-transform: rotate(-35deg); 
   	 	transform: rotate(-35deg);
	}
	
</style>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<br /><br />
	<h1>Category : <%=category %></h1>
	<hr>
    <%if((category.equals("마들렌") || category.equals("휘낭시에"))){ %>
    	
    	<h2>Season</h2>
    	<hr />
    	<%for(Dessert dessert : list){
			if(dessert.getDessertCategory().equals(category) && dessert.getDessertIsBest().equals("Y") && dessert.getDessertDelete().equals("N") ){%>
			<div class="dessert Season">
				<div class="Season" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
					<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
					<p><%= dessert.getDessertImage1() %></p>
					<p><%=dessert.getDessertName()%></p>
					<p>	<%=dessert.getDessertPrice() %>￦</p>
				</div>
			</div>
		
		<% }
		} %>
		<hr />
		<h2>Non-Season</h2>
		<hr />
		<%for(Dessert dessert : list){
			if(dessert.getDessertCategory().equals(category) && dessert.getDessertIsBest().equals("N") && dessert.getDessertDelete().equals("N") ){%>
			<div class="dessert nonSeason">
				<div class="nonSeason" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
					<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
					<p><%= dessert.getDessertImage1() %></p>
					<p><%=dessert.getDessertName()%></p>
					<p>	<%=dessert.getDessertPrice() %>￦</p>
				</div>
				<div class="is_non_season" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">Non-SEASON</div>
			</div>
		<% }
		} %>
		<hr />
   <%} 
	 else{
		%>
		<h2>Season</h2>
	    
		<%for(Dessert dessert : list){
			if(!dessert.getDessertCategory().equals("마들렌") && !dessert.getDessertCategory().equals("휘낭시에") && dessert.getDessertIsBest().equals("Y") && dessert.getDessertDelete().equals("N") ){%>		
				<div class="dessert Season" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
					<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
					<p><%= dessert.getDessertImage1() %></p>
					<p><%=dessert.getDessertName()%></p>
					<p>	<%=dessert.getDessertPrice() %>￦</p>
				</div>
				
			<%}
		}%>
		<br />
		<hr />
		<br />
		<h2>Non-Season</h2>
		<%for(Dessert dessert : list){
			
			if(!dessert.getDessertCategory().equals("마들렌") && !dessert.getDessertCategory().equals("휘낭시에") && dessert.getDessertIsBest().equals("N") && dessert.getDessertDelete().equals("N") ){%>
				<div class="dessert nonSeason">
					<div class="nonSeason" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%= dessert.getDessertImage1() %></p>
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
					<div class="is_non_season" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">Non-SEASON</div>
				</div>
				
			<%}
		 }
	 }%>
			

<%@ include file="/WEB-INF/views/common/footer.jsp" %>