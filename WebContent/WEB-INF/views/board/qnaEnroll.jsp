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
	#board-qna-container {
		text-align: center;
	}
	table {
		margin: 0 auto;
		width: 510px;
	}
	table tr th {
		float: left;
	}
	[name=qnaTitle] {
		width: 450px;
	}
	[name=qnaWriter] {
		width: 100px;
	}
	#ckeditor-container {
		width: 500px;
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
<div id="board-qna-container">
	
	<h2>Q & A</h2>
    <form 
    	name="qnaEnrollFrm"
        action="<%= request.getContextPath() %>/board/qnaEnroll"
        method="post">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="qnaTitle" placeholder="제목을 입력해주세요." required></td>
            </tr>
            <tr>
            	<th>작성자</th>
            	<td>
            		<input 
						type="hidden" name="qnaWriter"
						value="<%= memberLoggedIn.getMemberId() %>" readonly/>
            	</td>
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