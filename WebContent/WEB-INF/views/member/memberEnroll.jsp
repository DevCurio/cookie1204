<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<style>
    /* 세션 중앙정렬 */
    div#enroll-container {
        text-align: center;
    }
    div#enroll-container input {margin:3px;}
    div#enroll-container table {margin:0 auto;}
    div#enroll-container table th {padding:0 10px; text-align:right;}
    div#enroll-container table td {padding:0 10px; text-align:left;}
    /* 회원가입 필수항목 표시 */
    div#enroll-container sup {
        color: red;
    }
    #society_front_number {
        width: 55px;
    }
    #society_back_number {
        width: 82px;
    }
    .emailCheked-container{
        width: 80px;
        margin-left: 60px;
    }
    #zip_code {
        width: 89px;
    }
    .postcodify_address, .postcodify_details {
        width: 250px;
    }
</style>
<script>
$(function() {
	//우편주소 api팝업 띄우기
    $("#zip_code_search").postcodifyPopUp();
    
});
</script>
<script>
    function memberIdDuplicate(){
        //1. 아이디 유효성 검사하기
        var $memberId = $(member_Id);
        if(/^[a-zA-Z0-9_]{3,}$/.test($memberId.val()) == false){
            alert("3글자 이상 입력해주세요.");
            //$memberId.select();
            return;
        }

        //2.팝업으로 중복검사 여부 보여주기
        var title = "아이디 중복 확인";
        var css = "left=500px, top=300px, width=300px, height=200px";
        open("", title, css);
    }
</script>

<div id="enroll-container">
    <h2>회원 가입 정보 입력</h2>
    <form action="" method="POST">
        <table>
            <tr>
                <th>아이디<sup>*</sup></th>
                <td>
                    <input type="text" name="member_Id" id="member_Id" placeholder="3글자 이상" required>
                    <button type="button" onclick="memberIdDuplicate()">중복확인</button>
                    <input type="hidden" id="idValid" value="0">
                </td>
            </tr>
            <tr>
                <th>비밀번호<sup>*</sup></th>
                <td>
                    <input type="password" name="member_pw" id="member_pw" placeholder="8자 이상" required>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인<sup>*</sup></th>
                <td>
                    <input type="password" name="member_pw" id="member_pw_checked" required>
                </td>
            </tr>
            <tr>
                <th>이름<sup>*</sup></th>
                <td>
                    <input type="text" name="member_name" id="member_name" required>
                </td>
            </tr>
            <tr>
                <th>주민번호<sup>*</sup></th>
                <td>
                    <input type="text" name="society_front_number" id="society_front_number" placeholder="생년월일" required maxlength="6"> -
                    <input type="password" name="society_back_number" id="society_back_number" maxlength="7">
                </td>
            </tr>
            <tr>
                <th>이메일&nbsp;</th>
                <td>
                    <input type="email" name="email" id="email" placeholder="abc@naver.com" required>
                </td>
            </tr>
            <tr>
                <th>이메일 수신 여부&nbsp;</th>
                <td>
                    <div class="emailCheked-container">
                        <label for="">Y</label><input type="radio" name="email_get" value="Y">
                        <label for="">N</label><input type="radio" name="email_get" value="N" checked="checked">
                    </div>
                </td>
            </tr>
            <tr>
                <th>휴대폰 번호<sup>*</sup></th>
                <td>
                    <input type="tel" name="mobile_number" id="mobile_number" placeholder="-없이" required>
                </td>
            </tr>
            <tr>
                <th>자택 번호&nbsp;</th>
                <td>
                    <input type="tel" name="phone_number" id="phone_number" placeholder="-없이">
                </td>
            </tr>
            <tr>
                <th>우편 번호&nbsp;</th>
                <td>
                    <input type="text" name="zip_code" id="zip_code" class="postcodify_postcode5">
                    <button type="button" id="zip_code_search">우편번호</button>
                </td>
            </tr>
            <tr>
                <th>자택 주소&nbsp;</th>
                <td>
                    <input type="text" name="member_addr" id="member_addr" class="postcodify_address">
                </td>
            </tr>
            <tr>
                <th>상세 주소&nbsp;</th>
                <td>
                    <input type="text" name="member_addr_detail" id="member_addr_detail" class="postcodify_details">
                </td>
            </tr>
        </table>
        <hr>
        <input type="submit" value="가입" >
		<input type="reset" value="취소">
    </form>
</div>