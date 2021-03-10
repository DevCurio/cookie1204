<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="member.model.vo.Member" %>


<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	List<Dessert> list = (List<Dessert>)request.getAttribute("list");
	Member member = (Member)session.getAttribute("memberLoggedIn");
%>
	
	<style>
	.shopImg{
		width:150px;
		height:150px;
		float :none;
		margin-top:10px;
	}
	.dessert{
		display:inline-block;
		border: 1px solid black;
		text-align:center;
		padding :15px;
		margin-top:30px;
		margin-left:30px;
		margin-bottom:30px;
		position: relative;
		width:230px;
	
	}
	
	.dessert:hover{
		color:red;
		background-color:yellow;
	}
	
	
	
	.dessert+.zero{
		position: relative;
		background-color: rgb(100, 100, 100);	
	}
	
	.dessert+.zero >div.zero{
		opacity :0.1; 
		color : white;
		
	}
	
	.forManager{
		text-decoration: none;
		color:white;
		background-color: green;
		font-weight:bold;
		padding: 15px;
		margin-left:30px;
		margin-bottom:30px;
	}
	.forManagerPlaform{
		height:110px;
	}
	
	.sold-out{
		width:400px;
		position :absolute;
		text-align:center;
		color:red;
		font-size:50px;
		font-weight:bold;
		left:-25%;
		top:20%;
		
		-ms-transform: rotate(-35deg);
		-webkit-transform: rotate(-35deg); 
   	 	transform: rotate(-35deg);
	}
	
	</style>
	
	
	
	
	<h2>shopping</h2>
	
	<%if(member ==null) {%>
	<%}
	else{ %>
		
		<%if(member.getIsAdmin().equals("Y")){ %>
			<hr />
			
			<div class="forManagerPlaform">
				<p>관리자 전용 버튼입니다.</p>
				<br />
				<a class="forManager" href="<%=request.getContextPath()%>/admin/dessertUpload">새 제품 업로드하기</a>
				<a class="forManager" href="<%=request.getContextPath()%>/admin/dessertBestChange">제품 비 활성화</a>	
			</div>
		<%}else{ %>
			<hr />
			<p><%=member.getMemberId() %>님 환영합니다!</p>
		
		<%} %>
	<%} %>
	
	<hr>
    <p>마들렌</p>
    <hr>
    <% for(Dessert dessert : list){
    	if(dessert.getDessertCategory().equals("마들렌")&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
	%>
			<%if(dessert.getDessertAmount()==0){ %>
				<div class="dessert zero">
					<div class="zero" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
					<div class="sold-out" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<p>SOLD-OUT</p>
					</div>
				</div>
	
			<%}
			else{ %>
				<div class="dessert remain">
					<div class="remain" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
				</div>
			<%} %>
	<%  }
	} %>
	
	
	<hr>
    <p>휘낭시에</p>
    <hr>
    <% for(Dessert dessert : list){
    	if(dessert.getDessertCategory().equals("휘낭시에")&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
   	 %>
   	 	<%if(dessert.getDessertAmount()==0){ %>
				<div class="dessert zero">
					<div class="zero" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
					<div class="sold-out" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<p>SOLD-OUT</p>
					</div>
				</div>
	
			<%}
			else{ %>
				<div class="dessert remain">
					<div class="remain" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
				</div>
			<%} %>
		
	<%  }
	} %>
		
	<hr />
    <p>기타 Special 메뉴</p>
    <% for(Dessert dessert : list){	
    	if(!(dessert.getDessertCategory().equals("마들렌"))&&!(dessert.getDessertCategory().equals("휘낭시에"))&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
    	
	%>
		<%if(dessert.getDessertAmount()==0){ %>
				<div class="dessert zero">
					<div class="zero" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
					<div onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'" class="sold-out">
						<p>SOLD-OUT</p>
					</div>
				</div>
	
			<%}
			else{ %>
				<div class="dessert remain">
					<div class="remain" onclick="location.href='<%=request.getContextPath()%>/product/productSpecificView?dessertNum=<%=dessert.getDessertNum()%>'">
						<img class="shopImg" src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
						<p><%=dessert.getDessertName()%></p>
						<p>	<%=dessert.getDessertPrice() %>￦</p>
					</div>
				</div>
			<%} %>
			
	<%  }
	} %>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    