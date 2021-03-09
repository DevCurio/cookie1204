<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Member member = (Member)request.getAttribute("member");
	//out.println(member);//응답출력
%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<style>
  	 	/* 세션 중앙정렬 */
    
    div#enroll-container {
        text-align: center;
        width: 1000px;
        margin: 0 auto;
    }
    div#enroll-container input {
    	margin:3px;
    	border:1px solid #dfdfdf;
    	height: 30px;
    	text-align: center;
    }
    div#enroll-container table {margin:0 auto; width: 900px;}
    div#enroll-container table tr {padding-top: 5px;}
    div#enroll-container table th {padding:0 10px; text-align:center; height: 30px; width: 200px;}
    div#enroll-container table td {padding:0 10px; text-align:left;}
    /* 회원가입 필수항목 표시 */
    div#enroll-container sup {
        color: red;
    }
    #member_id, #member_pw, #member_pw_checked, #member_name, #email, #mobile_number, #phone_number {
    	width: 400px;
    }
    #society_front_number {
        width: 150px;
    }
    #society_back_number {
        width: 220px;
    }
    .emailCheked-container{
        width: 400px;
        margin-left: 3px;
        padding-left: 120px;
    }
    .box-radio-input input[type="radio"]{
        display:none;
        }
    .box-radio-input input[type="radio"]:hover{
        cursor: pointer;
        opacity: 0.7;
    }

    .box-radio-input input[type="radio"] + span{
        display:inline-block;
        background:none;
        border:1px solid #dfdfdf;  
        border-radius: 5px;
        padding:0px 10px;
        text-align:center;
        height:30px;
        width: 64px;
        line-height:30px;
        font-weight:500;
        cursor:pointer;
    }
    
    .box-radio-input input[type="radio"]:checked + span{
	    border:1px solid #ce8633;
	    background:#ce8633;
	    color:#fff;
	    text-align: center;
    }

    #zip_code {
        width: 100px;
    }
    .postcodify_address, .postcodify_details {
        width: 400px;
    }
    button {
    	border:1px solid #dfdfdf;  
        border-radius: 5px;
        background: initial;
        height: 30px;
    }
    button:hover {
        cursor: pointer;
        opacity: 0.8;
    }
    button:active {
    	background: initial;
        border-radius: 5px;
        box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
        position: relative;
        top:2px;
    }
    .update, .change, .leave {
        width: 100px;
        margin-top: 20px;
    }
    
    #pwUpdateFrm {
	  position:absolute;
	  width:500px;
	  height:400px;
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center; 
	  top:40%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	}
	
/* 	#pwUpdateFrm h2{ */
/* 	  text-align: center; */
/* 	  margin: 30px; */
/* 	} */
/* 	#pwUpdateFrm table{ */
/* 	  margin: 0 auto; */
/* 	} */
/* 	#modalclose-logo{ */
/* 	  text-align: right; */
/* 	} */
/* 	#modalclose-logo img{ */
/* 	  width:40px; */
/* 	  height:40px; */
/* 	} */
/* 	#pwchange{ */
/* 	 width: 70px; */
/*      height: 50px; */
/*      font-weight: bold; */
/*      border:1px solid #dfdfdf;   */
/*      border-radius: 5px; */
/*      background: initial; */
/* 	} */
/* 	#modalClose{ */
/* 	 width: 70px; */
/*      height: 50px; */
/*      margin-top: 40px; */
/*      margin-left: 200px; */
/*      font-weight: bold; */
/*      border:1px solid #dfdfdf;   */
/*      border-radius: 5px; */
/*      background: initial; */
/* 	} */
/*     #pwchange:hover { */
/*       cursor: pointer; */
/*       opacity: 0.8; */
/*     } */
/*     #modalClose:hover { */
/*       cursor: pointer; */
/*       opacity: 0.8; */
/*     } */
    
/*     #pwchange:active { */
/*     	background: initial; */
/*         border-radius: 5px; */
/*         box-shadow: 1px 1px 0 rgb(0,0,0,0.5); */
/*         position: relative; */
/*         top:2px; */
/*     } */
/*     #modalClose:active { */
/*     	background: initial; */
/*         border-radius: 5px; */
/*         box-shadow: 1px 1px 0 rgb(0,0,0,0.5); */
/*         position: relative; */
/*         top:2px; */
/*     } */
    
	/* - - - - - - 수정 들어가는 부분 - - - - - - - */	
	
	/* 팝업창 닫기 버튼 */
	#modalclose-logo{
		display: block;
		text-align: right;
	}
	#modalclose-logo a{
		display: inline-block;
		padding: 15px;
	}
	#modalclose-logo img{
	  width: 100%;
	}
	/* 팝업창 타이틀 h2*/
	#pwUpdateFrm h2{
		text-align: center;
		margin: 30px;
		margin-top: 0;
		color: #333;
	}
	/* 팝업창 정보수정 table */
	#pwUpdateFrm table{
		width: 95%;
		margin: 0 auto;
		padding: 15px 0;
		border: 1px solid #ddd; /* 넣고 싶은 색으로 변경*/;
		border-radius: 10px;
		padding: 20px;
		box-sizing: border-box;
	}
	#pwUpdateFrm table th{
		text-align: left;
		color: #666;
	}
	#pwUpdateFrm table td{
		padding: 5px 0;
	}
	/* 테이블 input */
	.inputWrap{
		display: block;
		border: 1px solid #ddd; /* 넣고 싶은 색으로 변경*/
		box-sizing: border-box;
		border-radius: 5px;
		min-width: 150px;
		max-width: 100%;
		height: 30px;
	}
	input[type='password'] {
		width: 95%; height: 26px;
		outline: none;
		border: none;
		background: none;
    	vertical-align: middle;
	}
	input::-webkit-input-placeholder{
		color: #aaa;
		font-size: 12px;
	}
	input::-ms-input-placeholder{
		color: #aaa;
		font-size: 12px;
	}
	input::-moz-input-placeholder{
		color: #aaa;
		font-size: 12px;
	}
	input::-o-input-placeholder{
		color: #aaa;
		font-size: 12px;
	}
	/* 팝업창 수정/닫기 버튼 */	
	.btnArea{
		width: 100%;
		display: block;
		padding-top: 20px;
	}
	.btnArea .btn{
		float: left;
		width: 50%;
	}
	.btnArea .btn input{
		width: 90%; height: 40px;
		box-sizing: border-box;
		border: none;
		cursor: pointer;
		outline: none;
		transition: all .2s;
		font-weight: bold;
		border-radius: 5px;
	}
	
	#pwchange{
		background: #ffc644;
		color: #fff;
		}
	#modalClose{
		background: #ddd;
		color: #888;
	}
	#pwchange:hover{
		background: #e89b00;
	}
	#modalClose:hover{
		background: #aaa;
		color: #eee;
	}	
	/* 액티브 화면은 내가 볼 수 없어서 못 잡아주겠음...*/
    #pwchange:active, 
	#modalClose:active{
    	background: initial;
        border-radius: 5px;
        box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
        position: relative;
        top:2px;
    }
   
</style>

<script>
function deleteMember(){
    var bool = confirm("정말로 탈퇴하시겠습니까?");
    if(bool)
        location.href = "<%=request.getContextPath() %>/member/memberDelete?memberId=<%=member.getMemberId()%>";
}

function updateMember(){
	var url = "<%=request.getContextPath() %>/member/memberUpdate";
	$("#memberUpdateFrm")
		.attr('action',url)
		.submit();	
}

// 비밀번호 수정 버튼 클릭시 호출 함수
function updatePassword(){
	modal('passwordChange');
	return;
}

// 모달 함수
function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('#modalClose')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
    
    
}

function passwordValidate(){
	
	var $memberPw = $("#memberPw");
	var $newPassword = $("#newMemberPw");
	var $newPasswordCheck = $("#newPasswordCheck"); 
	
	 if($newPassword.val() != $newPasswordCheck.val()){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		$newPassword.select();
		return false;
	}
	return true;
}
function updatePasswd(){
	if(passwordValidate()){
		var url = "<%=request.getContextPath() %>/member/updatePassword";
		$("#pwUpdateFrm")
			.attr('action',url)
			.submit();
	}
}

$(function(){

	$("#memberUpdateFrm").submit(function(){
        //memberName
        var $memberName = $("#member_name");
        if(/^[가-힣]{2,}$/.test($memberName.val()) == false){
        	alert("이름은 한글 2글자 이상이어야 합니다.");
        	$memberName.select();
        	return false;
        }
        
        // 핸드폰
        var $phone = $("#mobile_number");
        //-제거하기
        $phone.val($phone.val().replace(/[^0-9]/g, ""));//숫자아닌 문자(복수개)제거하기
        
        if(/^010[0-9]{8}$/.test($phone.val()) == false){
        	alert("유효한 전화번호가 아닙니다.");
        	$phone.select();
        	return false;
        }
      	//집전화
        var $phone_number = $("#phone_number");
        //특수문자(복수개) 제거
        $phone_number.val($phone_number.val().replace(/[^0-9]/g, ""));
        //연락처 유효성 검사
        if(/(^02.{0})([0-9]{3})([0-9]{4})|$/.test($phone_number.val()) == false){
        	alert("유효한 전화번호가 아닙니다.");
        	$phone_number.select();
        	return false;
        }

      	//이메일 유효성 검사
      	/* var $email = $("#email");
        if(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test($email.val()) == false){
        	alert("유효한 이메일이 아닙니다.");
        	$email.select();
        	return false;
        }  */       
        
      	//주소 유효성 검사
      	var $zip_code = $("#zip_code");
      	var $member_addr = $("#member_addr");
      	var $member_addr_detail = $("#member_addr_detail");
	    
        return true;
	});

	//우편주소 api팝업 띄우기
	$("#zip_code_search").postcodifyPopUp();

});
</script>
<div id="enroll-container">
    <h2>회원 정보 수정</h2>
    <form id="memberUpdateFrm" method="POST">
        <table>
            <tr>
                <th>아이디<sup>*</sup></th>
                <td>
                    <input type="text" name="member_id" id="member_id" value="<%= member.getMemberId() %>" readonly>
                    <input type="hidden" id="idValid" value="0" />
                </td>
            </tr>
            <tr>
                <th>이름<sup>*</sup></th>
                <td>
                    <input type="text" name="member_name" id="member_name" value="<%= member.getMemberName() %>" required>
                </td>
            </tr>
            <tr>
                <th>주민번호<sup>*</sup></th>
                <td>
                    <input type="text" name="society_front_number" id="society_front_number" value="<%= member.getSocietyFrontNumber() %>" required maxlength="6"> -
                    <input type="password" name="society_back_number" id="society_back_number" value="<%= member.getSocietyBackNumber() %>" maxlength="7">
                </td>
            </tr>
            <tr>
                <th>이메일&nbsp;</th>
                <td>
                    <input type="email" name="email" id="email" placeholder="abc@naver.com" value="<%= member.getEmail() != null ? member.getEmail() : "" %>" >
                </td>
            </tr>
            <tr>
                <th>이메일 수신 여부&nbsp;</th>
                <td class="emailCheked">
                    <div class="emailCheked-container">
                        <label class="box-radio-input" >
                        <input type="radio" name="email_get" value="Y" <%= "Y".equals(member.getEmailGet()) ? "checked" : "" %>><span>예</span></label>
                        <label class="box-radio-input">
                        <input type="radio" name="email_get" value="N" <%= "N".equals(member.getEmailGet()) ? "checked" : "" %>><span>아니오</span></label>
                    </div>
                </td>
            </tr>
            <tr>
                <th>휴대폰 번호<sup>*</sup></th>
                <td>
                    <input type="tel" name="mobile_number" id="mobile_number" value="<%= member.getMobileNum() %>" required>
                </td>
            </tr>
            <tr>
                <th>자택 번호&nbsp;</th>
                <td>
                    <input type="tel" name="phone_number" id="phone_number" value="<%= member.getPhoneNum() != null ? member.getPhoneNum() : "" %>">
                </td>
            </tr>
            <tr>
                <th>우편 번호<sup>*</sup></th>
                <td>
                    <input type="text" name="zip_code" id="zip_code" class="postcodify_postcode5" value="<%= member.getZipCode() %>">
                    <button type="button" id="zip_code_search">우편번호</button>
                </td>
            </tr>
            <tr>
                <th>자택 주소<sup>*</sup></th>
                <td>
                    <input type="text" name="member_addr" id="member_addr" class="postcodify_address" value="<%= member.getMemberAddr() %>" >
                </td>
            </tr>
            <tr>
                <th>상세 주소<sup>*</sup></th>
                <td>
                    <input type="text" name="member_addr_detail" id="member_addr_detail" class="postcodify_details" value="<%= member.getMemberAddrDetail() %>" >
                </td>
            </tr>
        </table>
        <hr>
        <button type="button" class="update" onclick="updateMember();">정보수정</button>
        <button type="button" class="change" onclick="updatePassword();">비밀번호변경</button>
        <button type="button" class="leave" onclick="deleteMember();">탈퇴</button>
        <!-- <input type="submit" value="수정">
		<input type="reset" value="취소"> -->
    </form>
</div>
<br /><br />



<!-- <DIV ID="PASSWORDCHANGE" STYLE="DISPLAY: NONE;"> -->
<!-- 	<FORM NAME="UPDATEPWDFRM" ID="PWUPDATEFRM" METHOD="POST" > -->
<!-- 	<DIV ID="MODALCLOSE-LOGO"> -->
<%-- 		<A HREF=""><IMG SRC="<%= REQUEST.GETCONTEXTPATH() %>/IMAGES/CLOSE.PNG" ALT="닫기" /></A> --%>
<!-- 	</DIV> -->
<!-- 		<H2>비밀번호 변경</H2> -->
<!-- 		<HR /> -->
<!-- 		<TABLE> -->
<!-- 			<TR> -->
<!-- 				<TH>현재 비밀번호</TH> -->
<!-- 				<TD><INPUT TYPE="PASSWORD" NAME="MEMBERPW" ID="MEMBERPW" REQUIRED></TD> -->
<!-- 			</TR> -->
<!-- 			<TR> -->
<!-- 				<TH>변경할 비밀번호</TH> -->
<!-- 				<TD> -->
<!-- 					<INPUT TYPE="PASSWORD" NAME="NEWMEMBERPW" ID="NEWMEMBERPW" REQUIRED> -->
<!-- 				</TD> -->
<!-- 			</TR> -->
<!-- 			<TR> -->
<!-- 				<TH>비밀번호 확인</TH> -->
<!-- 				<TD>	 -->
<!-- 					<INPUT TYPE="PASSWORD" NAME="NEWPASSWORDCHECK" ID="NEWPASSWORDCHECK" REQUIRED><BR> -->
<!-- 				</TD> -->
<!-- 			</TR> -->
<!-- 		</TABLE> -->
<!-- 		<HR /> -->
<!-- 		<TABLE> -->
<!-- 			<TR> -->
<!-- 				<TD COLSPAN="2" STYLE="TEXT-ALIGN: CENTER;"> -->
<!-- 					<INPUT TYPE="BUTTON" ID="PWCHANGE" ONCLICK="UPDATEPASSWD();" VALUE="변경" /> -->
<!-- 					<BUTTON TYPE="BUTTON" ID="MODALCLOSE">닫기</BUTTON> -->
<!-- 				</TD> -->
<!-- 			</TR> -->
<!-- 		</TABLE>	 -->
<%-- 		<INPUT TYPE="HIDDEN" NAME="MEMBERID" VALUE="<%= REQUEST.GETPARAMETER("MEMBERID") %>"/> --%>
<!-- 	</FORM> -->
<!-- </DIV> -->




<div id="passwordChange" style="display: none;">
	<form name="updatePwdFrm" id="pwUpdateFrm" method="post" >
	<div id="modalclose-logo">
		<a href=""><img src="<%= request.getContextPath() %>/images/close.png" alt="닫기" /></a>
	</div>
		<input type="hidden" name="memberId" value="<%= memberLoggedIn != null ? memberLoggedIn.getMemberId() : "" %>" />
		<h2>비밀번호 변경</h2>
		<table>
			<tr>
				<th>현재 비밀번호</th>
				<td>
					<div class="inputWrap">
						<input type="password" name="memberPw" id="memberPw" required placeholder="현재 비밀번호를 적어주세요">
					</div>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<div class="inputWrap">
						<input type="password" name="newMemberPw" id="newMemberPw" required>
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<div class="inputWrap">
						<input type="password" name="newPasswordCheck" id="newPasswordCheck" required><br>
					</div>
				</td>
			</tr>
		</table>
		<div class="btnArea">
			<div class="btn">
				<input type="button" id="pwchange" onclick="updatePasswd();" value="변경" />
			</div>
			<div class="btn">
				<input type="button" id="modalClose" onclick="" value="닫기" />
			</div>
		</div>	
		<input type="hidden" name="memberId" value=""/>
	</form>
</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>

