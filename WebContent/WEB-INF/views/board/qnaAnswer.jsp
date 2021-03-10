<%@page import="board.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Qna qna = (Qna)request.getAttribute("qna");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath() %>/ckeditor/ckeditor.js"></script>

	<style>
	
	
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
        width:1300px;
        margin:0 auto; 
        border-collapse:collapse;
        border-top:1px solid #ececec;
        font-size:14px;
        line-height:20px;color:#5e636d}
    .total_wrap .qform th{
        padding:13px 0 13px 20px;
        width:200px;
        text-align:center;
        vertical-align:middle;
        color:#222;
        font-weight:10;
        background:#f8f9fa;
        border-bottom:1px solid #ececec}
    .total_wrap .qform td{
    	
        padding:12px 20px 12px 20px;
        border-bottom:1px solid #ececec;color:#5e636d;}
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
        width:440px;
        height:118px;
        padding:6px 18px 6px 12px;
        border:1px solid #d6d7d8;
        border-radius:2px}
    .total_wrap .ip_viptxt{width:300px}
    
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
     

 
	
	
	
	/*  */
		div#board-container{width:600px; margin:0 auto; text-align:center;}
		div#board-container h2{margin:10px 0;}
	
		table#tbl-board-view {
			width:1300; 
			margin:0 auto; 
			border:1px solid black; 
			border-collapse:collapse;  
		}
		table#tbl-board-view th {
			width: 150px; 
			border:1px solid; 
			padding: 10px 0; 
			text-align:center; 
		} 
		table#tbl-board-view td {
			border:1px solid; 
			padding: 5px 0 5px 15px; 
			text-align:left;
		}
		
		table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
		table#tbl-comment tr:hover button.btn-delete{display:inline;}
		
		#board-qna-container {
			text-align: center;
		}
		#qnaTable {
			margin: 0 auto;
			width: 510px;
		}
		#qnaTable tr th {
			float: left;
			width: 50px;
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
			width: 500px;
			margin: 0 auto;
		}
	</style>


<div id="board-qna-container">
	
	<h2>Q & A</h2>
	
<div class="total_wrap">
		
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
								
							</td>
						</tr>
					</tbody>
				</table>
	</div>
	<br><br>
    <form 
    	name="qnaAnswerFrm"
        action="<%= request.getContextPath() %>/board/qnaAnswer"
        method="post">
        <input type="hidden" name="qnaReRef" value="<%= qna.getQnaNum() %>" />
        <table id=qnaTable>
            <tr>
                <th>ㄴRe: </th>
                <td><input type="text" name="qnaTitle" value="<%= qna.getQnaTitle() %>" required></td>
            </tr>
        </table>
		<br>
        <div id="ckeditor-container">
            <textarea name="qnaContent" class="ckeditor" id="ckeditor" required>
            </textarea>
        </div>
        <br>
      
        
        <button type="submit">등록하기</button>
    </form>
    
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>