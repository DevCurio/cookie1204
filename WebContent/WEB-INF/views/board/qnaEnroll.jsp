
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% 
	String qnaContent = request.getParameter("qnaContent");
%>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
</script>
<script src="<%= request.getContextPath() %>/ckeditor/ckeditor.js"></script>
<script>
	var editorContent = CKEDITOR.instances.ckeditor.getData();
  	
  	$("#ckeditor").val(editorContent);
  	
</script>

<style>
<style type="text/css">
	.colstyle{
		width: 92px;
	}
    .total_wrap{
 		 width :1200px;
    	margin: 0 auto;
    	
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
     	width :200px;
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


	
	[name=qnaTitle] {
		float: left;
		width: 440px;
	}
	[name=qnaWriter] {
		float: left;
		width: 100px;
	}
	#ckeditor-container {
		width: 1200px;
		margin: 0 auto;
	}
	
</style>

<script>
$(function(){
	$("[name=qnaEnrollFrm]").submit(qnaValidate);
});

function qnaValidate(){
	//제목을 작성해야 폼 제출이 가능함.
	var $qnaTitle = $("[name=qnaTitle]");
	//1글자 이상 작성하기
	if(/^.{1,}$/.test($qnaTitle.val()) == false){
		alert("제목을 입력하세요.");
		return false;
	}
	
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	var $qnaContent = $("[name=qnaContent]");
	//아무글자 또는 개행문자가 1개이상
	if(/^(.|\n){1,}$/.test($qnaContents.val()) == false){
		alert("내용을 입력하세요.");
		return false;
	}
	
	return true;
}
</script>


	<div class="total_wrap">
	
	<h2>공지글</h2>
    <form 
    	name="qnaEnrollFrm"
        action="<%= request.getContextPath() %>/board/qnaEnroll"
        method="post">
     <table class="qform">
        
        	<tr>
            	<th>작성자</th>
            	<td><input type="text" name="qnaWriter"
            			value="<%= memberLoggedIn.getMemberId() %>" readonly></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="qnaTitle" placeholder="제목을 입력해주세요." required></td>
            </tr>
            
        </table>

        <div id="ckeditor-container">
            <textarea name="qnaContent" class="ckeditor" id="ckeditor" required>
            </textarea>
            
        </div>
        
        <hr>
        
        <button type="submit">등록하기</button>
        <button type="reset" onclick="location.href='<%= request.getContextPath() %>/board/qna'">취소하기</button>
    </form>
    
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
