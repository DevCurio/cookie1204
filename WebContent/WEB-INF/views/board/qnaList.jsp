
<%@ page import="java.util.List"%>
<%@ page import="board.model.vo.Qna" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Qna> list = (List<Qna>)request.getAttribute("list");
	
%>
        <link rel="stylesheet" href="../css/qna.css"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style>

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: gray;
}
.content {
	resize: none;
	margin: 10px;
}

.qna_answer_table {
	width: 1065px;
	margin-left:50px;
	margin-top:20px;
	
}
/* h2 {
	text-align: center;
} */
#qna_answer_div2 {
	margin-top:20px;
	
}

#answer_button {
	margin-left:570px;
}
div#qna-search {
	padding : 1px;
	float: left;
	margin-bottom : 5px;
}


section#board-container{width:700px; margin:0 auto; text-align:center;}
section#board-container h2{margin:10px 0;}
table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }



table#tbl-board td {border:1px solid; border-color:gray; ; padding: 5px 0; text-align:center;} 

input#btn-add{float:right; margin: 10 60 20px;}

div#pageBar{margin-top: 325px; margin-bottom: 750px;text-align:center; background-color:#E6D2C9; opacity: 0.5;}
div#pageBar span.cPage{color: #0066ff; margin-right: 5px;}
div#pageBar a{margin-right: 5px;}

    .productList div p{
    	display:table-cell; text-align:center; vertical-align:middle;
    }
    #productList{
        margin-left: 50px;
        border-top: 1px solid #d3d3d3;
        background-color: #EFE8E4;
    }
    .productList div{
        float: left;
        height:66px;
        display:table;
        border-left:1px solid #d3d3d3;
       
    }
    .productList div p{
    	 display:table-cell; text-align:center; vertical-align:middle;
    }
     .productList div:nth-child(1){
        /* width: 110px; */
        height: 66px; 
   	}
    .productList div:nth-child(2){
        /* width: 502px; */
        height: 66px;
    }
    .productList div:nth-child(3){
        /* width: 147px; */
        height: 66px
    }
    .productList div:nth-child(4){
         /* width: 300px;  */
         height: 66px
         /* text-align:center; */
    }
    #num {
    	width: 60px;
    }
    #title {
    	width: 700px;
    }
    #writer {
    	width: 100px;
    }
    #date {
    	width: 230px;
    }
    
  	#td_num {
  		width: 60px;
  	}
	#td_title {
		width: 700px;
	}
	#td_writer {
		width: 96px;
	}
	#td_date {
		width: 240px;
	}
</style>

	
    <div id="wrap">
        <div id="header_11">
            <div><h2>문의내역</h2></div>
        </div>
        <div id="header_22">
            
        </div>
     	<div>
	<% if(memberLoggedIn != null) { %>
	<input 
		type="button" 
		value="글쓰기" 
		id="btn-add"
		onclick="location.href='<%= request.getContextPath() %>/board/qnaEnroll';" />
	<% } %>
	</div>	
	<div id="search">
	    <form action="<%=request.getContextPath()%>/board/qnaSearch">
	        <input 
	        	type="text" 
	        	name="qnaSearch" 
	        	size="20" 
	        	placeholder="아이디 검색"
	        	value=""/>
	        <button button id="search_button" type="submit"name="search_enter">검색</button>			
	    </form>	
	</div>

        <div class="productList" id="productList">
           <table id="tbl-board">
            <div id="num"><p>번호</p></div>
            <div id="title"><p>제목</p></div>
            <div id="writer"><p>사용자ID</p></div>
            <div id="date"><p>날짜</p></div>


		<% for(Qna q : list){ %>
		<tr>
		<td id="td_num"><%= q.getQnaNum() %></td>
			<td id="td_title">
				<a href="<%= request.getContextPath() %>/board/qnaView?qnaNum=<%= q.getQnaNum() %>">
					<%= q.getQnaTitle() %>
				</a>
			</td>
			<td td="td_writer"><%= q.getQnaWriter() %></td>
			<td td="td_date"><%= q.getQnaDate() %></td>
		</tr>
		<% } %>

	</table>
		</div>
		<div id='pageBar'><%=request.getAttribute("pageBar") %></div>
	




</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
