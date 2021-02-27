
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

