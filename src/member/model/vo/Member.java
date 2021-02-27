package member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String memberPw;
	private String name;
	private String SocietyNum1;
	private String SocietyNum2;
	private String email;
	private String emailGet;
	private String mobileNum;
	private String phoneNum;
	private String zipCode;
	private String memberAddr;
	private String memberAddrDetail;
	private String isAdmin;
	private Date enrollDate;
	private String memberDelete;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPw, String name, String societyNum1, String societyNum2, String email,
			String emailGet, String mobileNum, String phoneNum, String zipCode, String memberAddr,
			String memberAddrDetail, String isAdmin, Date enrollDate, String memberDelete) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.name = name;
		SocietyNum1 = societyNum1;
		SocietyNum2 = societyNum2;
		this.email = email;
		this.emailGet = emailGet;
		this.mobileNum = mobileNum;
		this.phoneNum = phoneNum;
		this.zipCode = zipCode;
		this.memberAddr = memberAddr;
		this.memberAddrDetail = memberAddrDetail;
		this.isAdmin = isAdmin;
		this.enrollDate = enrollDate;
		this.memberDelete = memberDelete;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSocietyNum1() {
		return SocietyNum1;
	}
	public void setSocietyNum1(String societyNum1) {
		SocietyNum1 = societyNum1;
	}
	public String getSocietyNum2() {
		return SocietyNum2;
	}
	public void setSocietyNum2(String societyNum2) {
		SocietyNum2 = societyNum2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailGet() {
		return emailGet;
	}
	public void setEmailGet(String emailGet) {
		this.emailGet = emailGet;
	}
	public String getMobileNum() {
		return mobileNum;
	}
	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberAddrDetail() {
		return memberAddrDetail;
	}
	public void setMemberAddrDetail(String memberAddrDetail) {
		this.memberAddrDetail = memberAddrDetail;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getMemberDelete() {
		return memberDelete;
	}
	public void setMemberDelete(String memberDelete) {
		this.memberDelete = memberDelete;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", name=" + name + ", SocietyNum1="
				+ SocietyNum1 + ", SocietyNum2=" + SocietyNum2 + ", email=" + email + ", emailGet=" + emailGet
				+ ", mobileNum=" + mobileNum + ", phoneNum=" + phoneNum + ", zipCode=" + zipCode + ", memberAddr="
				+ memberAddr + ", memberAddrDetail=" + memberAddrDetail + ", isAdmin=" + isAdmin + ", enrollDate="
				+ enrollDate + ", memberDelete=" + memberDelete + "]";
	}
	
	
	
}
