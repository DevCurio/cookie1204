<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	img{
		width:100px;
		height:100px;
	}
	.dessert{
		display:inline-block;
		border:1px solid black;
	}
</style>


<form action="<%=request.getContextPath()%>/admin/dessertBestChange" method=post>
   	<br /><br />
    <input type="submit" value="제품 업로드 상태 변경하기" />
   
	<%List<Dessert> list = (List<Dessert>)request.getAttribute("list"); %>
	
	<p>마들렌</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("마들렌")&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
	%>
		<div class="dessert madelen">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="abledisable[]" value="<%=dessert.getDessertNum()%>" />비활성화
			<p>제품 No. : <%=dessert.getDessertNum() %></p>
			<p>인기여부: <%=dessert.getDessertIsBest() %></p>
			<p>삭제여부 : <%=dessert.getDessertDelete() %>
			<br />
		</div>
	<%  }
	} %>
	<hr />
	
	<p>휘낭시에</p>
    <hr>
    <% for(Dessert dessert : list){
		if(dessert.getDessertCategory().equals("휘낭시에")&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
	%>
		<div class="dessert madelen">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="abledisable[]" value="<%=dessert.getDessertNum()%>" />비활성화
			<br />
			<p>제품 No. : <%=dessert.getDessertNum() %></p>
			<p>인기여부: <%=dessert.getDessertIsBest() %></p>
			<p>삭제여부 : <%=dessert.getDessertDelete() %>
			
		</div>
	<%  }
	} %>
	<hr />
	
	<p>Special-Menu</p>
    <hr>
    <% for(Dessert dessert : list){
		if(!(dessert.getDessertCategory().equals("마들렌"))&&!(dessert.getDessertCategory().equals("휘낭시에"))&&dessert.getDessertIsBest().equals("Y")&&dessert.getDessertDelete().equals("N")){
	%>
		<div class="dessert madelen">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="abledisable[]" value="<%=dessert.getDessertNum()%>" />비활성화
			<p>제품 No. : <%=dessert.getDessertNum() %></p>
			<p>인기여부: <%=dessert.getDessertIsBest() %></p>
			<p>삭제여부 : <%=dessert.getDessertDelete() %>
			
			<br />
		</div>
	<%  }
	} %>
	<hr />
	
	<p>비활성화 메뉴</p>
    <% for(Dessert dessert : list){
		if(dessert.getDessertIsBest().equals("N")&&dessert.getDessertDelete().equals("N")){
	%>
		<div class="dessert disable">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<br />
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="abledisable[]" value="<%=dessert.getDessertNum()%>" />활성화
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="activedelete[]" value="<%=dessert.getDessertNum()%>" />삭제
			<p>제품 No. : <%=dessert.getDessertNum() %></p>
			<p>인기여부: <%=dessert.getDessertIsBest() %></p>
			<p>삭제여부 : <%=dessert.getDessertDelete() %>
			
		</div>
	<%  }
	} %>
		<hr />
    <hr />
	<p>삭제한 메뉴</p>
    <% for(Dessert dessert : list){
		if(dessert.getDessertDelete().equals("Y")){
	%>
		<div class="dessert deleted">
			<img src="<%=request.getContextPath() %>/images/dessert/<%=dessert.getDessertImage2() %>" alt="<%=dessert.getDessertName() %>" />		
			<p><%=dessert.getDessertName()%></p>
			<input type="checkbox" id="<%=dessert.getDessertName() %>" name="activedelete[]" value="<%=dessert.getDessertNum()%>" />부활
			<p>제품 No. : <%=dessert.getDessertNum() %></p>
			<p>인기여부: <%=dessert.getDessertIsBest() %></p>
			<p>삭제여부 : <%=dessert.getDessertDelete() %>
			
		</div>
	<%  }
	 }%>
	<hr />
    </form>
	
	
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>