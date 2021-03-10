<%@page import="board.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style type="text/css">
	.colstyle{
		width: 92px;
	}
    .total_wrap{
        padding:22px 20px 46px;
        font-family:Arial, Helvetica, sans-serif;}
    .total_wrap .tit_vippop{
        margin-bottom:21px;
        line-height:22px;
        letter-spacing:-1px;
        font-size:20px;
        color:#1e2732;
        padding-bottom:15px;
        border-bottom:1px solid #a4a9b0;
        font-weight:bold}
    .total_wrap .subinfo{
        margin-bottom:14px;
        font-size:14px;
        line-height:20px;
        letter-spacing:-1px;
        text-align:center;
        color:#757c8a}
    .total_wrap .qform{
        table-layout:fixed;
        width:100%;
        border-collapse:collapse;
        border-top:1px solid #ececec;
        font-size:14px;
        line-height:20px;color:#5e636d}
    .total_wrap .qform th{
        padding:13px 0 13px 20px;
        text-align:left;
        vertical-align:middle;
        color:#222;
        font-weight:400;
        background:#f8f9fa;
        border-bottom:1px solid #ececec}
    .total_wrap .qform td{
        padding:12px 20px 12px 20px;
        border-bottom:1px solid #ececec;color:#5e636d}
    .total_wrap .tit_caution{display:block;
        margin-top:16px;
        margin-bottom:1px;
        font-size:14px;
        line-height:20px;
        letter-spacing:-1px;
        color:#233549;font-weight:bold}
    .total_wrap .lst_caution{
        padding-bottom:6px}
    .total_wrap .lst_caution li{
        color:#5e636d;
        margin-top:4px;
        padding-left:5px;
        background-position:-998px -300px}
    .total_wrap .ip_viptxtarea{
    	resize :none;
        width:496px;
        height:118px;
        padding:6px 18px 6px 12px;
        border:1px solid #d6d7d8;
        border-radius:2px}
    .total_wrap .ip_viptxt{width:496px}
    
    .total_wrap .qtpye li{
        list-style: none;
        float: left;
    }
    .total_wrap  .qform .pdtit{
        color:#2e8de5}
    .total_wrap  .qform .frm_wrap label{
        padding-left:1px}
    .total_wrap .info_formbottom{
        margin-top:15px;
        margin-left:21px}
    .total_wrap .info_formbottom p{
        font-size:14px;
        line-height:20px;
        color:#222}
    .total_wrap .check_line{
        margin-top:8px;
        font-size:14px;
        line-height:20px;
        color:#222}
    .total_wrap .check_line .txt_sub{
        font-family:Arial, Helvetica, sans-serif;
        color:#94989f}
    .total_wrap .bottom_btns{
        margin-top:21px;
        font-size:20px;
        text-align:center;
        
    }
    .total_wrap .bottom_btns a{
        display:inline-block;
        width:100px;
        height:38px;
        text-decoration: none;
    }
    .total_wrap .bottom_btns .bt_cancel{
        margin-left:8px}
    .total_wrap .txt_emp{
        color:#2e8de5;
        }
    fieldset{
        border: none;
    }
     
     .total_wrap #myBtn{
        border: 8px solid #2e8de5;
        border-radius: 25px;
        border-right-width: 30px;
        border-left-width: 30px;
        background-color: #2e8de5;
        color: white;
        font-size: 17px;
        outline: 0;
    }
    
     .total_wrap #myBtn hover{
        cursor: pointer;
    } 
     
    .total_wrap .reset{
        border :8px solid #a4a9b0;
        border-radius: 25px;
        border-right-width: 30px;
        border-left-width: 30px;
        background-color: #a4a9b0;
        color: white;
        
    }
    .bar_close,.total_wrap .bar_close{
        position:fixed;
        bottom:0;
        left:0;
        width:100%;
        height:32px;
        background:#f8f9fa;
        border-top:1px solid #ececec;
        text-align:right;
        margin-bottom: 0px;
        padding-bottom: 0px;
    }
    .bar_close a,.total_wrap .bar_close a{
        position:relative;
        display:inline-block;
        padding-right:14px;
        margin:8px 16px 0 0;
        font-size:14px;
        line-height:16px;
        color:#757c8a}
    .bar_close a:hover,.total_wrap .bar_close a:hover{color:#1e2732}
    .bar_close a:hover{
        text-decoration:none;
        color:#1e2732}
    .addFile{
    	display: none;
    	
    }
    /* .bar_close .total_wrap .bar_close .ic{
        display:inline-block;
        width:10px;
        height:10px;
        position:absolute;
        top:3px;
        right:0;
        background-position:-450px -130px;
        text-indent:-999em;font-size:0}
    .bar_close:hover .total_wrap .bar_close:hover {background-position:-470px -130px} */
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

                                    
	
	// 일단 확인을 누르면 등록이 완료되었습니다가 뜬다.
	function add() {
		if ($("#add1").css("display") == "none")
			$("#add1").show();

		else
			$("#add1").hide();
	}
	function add1() {
		if ($("#add2").css("display") == "none")
			$("#add2").show();

		else
			$("#add2").hide();
	}
	function add2() {
		alert("파일은 3개까지 첨부가능합니다.");

	}

	function qna_Check() {
		// Get the modal
		var tempvalue = true;
		var fileMax = 10*1024*1024;
		var form = document.checkform
		
		if (!form.qTitle.value) {
			alert("제목을  입력하세요.");
			tempvalue = false;
			return tempvalue;
		}else  (!form.qContent.value) {
			alert("내용을  입력하세요.");
			tempvalue = false;
			return tempvalue;

	}
	
	function check(){
		
		var temp = document.hihi.check1.value;
		if(document.hihi.check1.value=='1'){
			var modal = document.getElementById('myModal');
			modal.style.display = "block";
			
			setTimeout(function(){
				window.close();
			}, 1000);
			
			
			
		
		
	}
   

</script>
</head>
<body onload="check();">
<form name="hihi">
<input type="hidden" name="check1" value="${param.check }">

</form>
	<div class="total_wrap">
		<h1 class="tit_vippop">판매자에게 문의하기</h1>
		<p class="subinfo">상품,배송,취소/반품,A/S등의 문의를 남겨주시면 판매자가 직접 답변을 드립니다.</p>
		
		
		<form action="qnaBoard.so" id="checkform" method="post" enctype="multipart/form-data" name="checkform" onsubmit="return qna_Check();">
		
			<fieldset>
				<!-- <legend>판매자에게 문의하기 폼</legend> -->
				<table class="qform">
					<!-- <caption>문의 종류,상품명 ,이름ID,제목,내용에 관한 테이블</caption> -->
					<colgroup>
						<col class="colstyle">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>글번호</th>
							<td><%= qna.getQnaNum() %></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><%= qna.getQnaTitle() %></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%= qna.getQnaWriter() %></td>
						</tr>
		
						<tr>
							<th>내용</th>
							<td><textarea title="내용" class="ip_viptxtarea" id="ta_content" name="qContent"><%= qna.getQnaContent() %></textarea><br>
								<strong class="tit_question">문의 시 유의해주세요!</strong>
								<ul class="lst_caution">
									<li>주민등록 번호,연락처 등의 정보는 타인에게 노출될 경우 개인정보 도용의 위험이 있으니 주의해 주시기 바랍니다.</li>
									<li>비방,광고,불건전한 내용의 글은 관리자에 의해 사전 동의 없이 삭제될 수 있습니다.</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				
				<p class="bottom_btns">
				
<!-- 				memberLoggedIn.getMemberId().equals(qna.getQnaWriter()) -->
				<% if(qna.getQnaReLev() == 1
						&& memberLoggedIn != null
				 		&& "Y".equals(memberLoggedIn.getIsAdmin())
					) { %>
					<tr>
						<th colspan="2">
							<input type="button" value="답글" onclick="answer();" class="ok" id="myBtn"/>
							<input type="button" value="삭제하기" onclick="deleteBoard();" class="ok" id="myBtn"/>
						</th>
					</tr>
				<% } else if(qna.getQnaReLev() == 1
								&& memberLoggedIn != null
								&& memberLoggedIn.getMemberId().equals(qna.getQnaWriter())) { %>
					<tr>
						<th colspan="2">
							<input type="button" value="수정하기" onclick="updateBoard();" class="ok" id="myBtn"/> 
							<input type="button" value="삭제하기" onclick="deleteBoard();"  class="ok" id="myBtn"/>
						</th>
					</tr>
				<%} else if (qna.getQnaReLev() == 2
						&& memberLoggedIn != null
						&& memberLoggedIn.getMemberId().equals(qna.getQnaWriter())) { %>
					<tr>
						<th colspan="2">
							<input type="button" value="수정하기" onclick="updateBoard();" class="ok" id="myBtn"/> 
							<input type="button" value="삭제하기" onclick="deleteBoard();"  class="ok" id="myBtn"/>
						</th>
					</tr>
				<% } %>
				 
			</fieldset>
		</form>
	
	<script>
		function updateBoard(){
	        location.href="<%=request.getContextPath()%>/board/qnaUpdate?qnaNum=<%=qna.getQnaNum() %>&memberId=<%= memberLoggedIn.getMemberId() %>";
		}
		
		function deleteBoard(){
			if(confirm("이 게시물을 삭제하시겠습니까?")){
				location.href = "<%= request.getContextPath() %>/board/qnaDelete?qnaNum=<%= qna.getQnaNum() %>";
			}
		}
		
		function answer() {
			location.href="<%= request.getContextPath() %>/board/qnaAnswer?qnaNum=<%= qna.getQnaNum() %>";
		}
		
	</script>
			

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>