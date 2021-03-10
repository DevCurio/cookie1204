<%@page import="board.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="<%= request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<style>
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

<script>

$(function(){
	$("[name=qnaUpdateFrm]").submit(qnaValidate);
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

<div id="board-qna-container">
	
	<h2>Q & A</h2>
    <form 
    	name="qnaUpdateFrm"
        action="<%= request.getContextPath() %>/board/qnaUpdate"
        method="post">
        <input type="hidden" name="qnaNum" value="<%= qna.getQnaNum() %>" />
        <table id=qnaTable>
            <tr>
                <th>제목</th>
                <td>
                	<input type="text" name="qnaTitle" value="<%= qna.getQnaTitle() %>" required>
                </td>
            </tr>
            
        </table>

        <div id="ckeditor-container">
            <textarea name="qnaContent" class="ckeditor" id="ckeditor" required>
            	<%= qna.getQnaContent() %>
            </textarea>
            
        </div>
        
        <hr>
        
		<input type="submit" value="수정하기">
		<input type="button" value="취소" onclick="location.href='<%= request.getContextPath() %>/board/qnaView?qnaNum=<%= qna.getQnaNum() %>';">
    </form>
    
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>