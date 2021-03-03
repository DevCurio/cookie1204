package product.model.vo;

import java.sql.Date;

public class OrderTable {
	
	private int orderNum;						// 인덱스 번호(pk)
	private String orderTradeNum;				// 주문번호
	private String orderTransNum;				// 운송장번호
	private String orderReceiveName;			// 받는사람 이름
	private String zipCode;						// 우편번호
	private String orderReceiveAddr;			// 기본주소
	private String orderReceiveAddrDetail;		// 상세주소
	private String orderReceivePhone;			// 전화번호 (집)
	private String orderReceiveMobile;			// 핸드폰 번호
	private String orderEmail;					// 이메일
	private String orderMemo;					// 요구사항
	private int sumMoney;						// 합계금액
	private String orderTradeType;				// 결제방법
	private Date orderDate;						// 주문날짜
	private int orderStatus;					// 주문상태
	private String orderDelete;					// 삭제여부
	private String memberId;					// 회원 아이디
	private int cardNum;						// 카드 승인번호
	
	
	
	public OrderTable() {
		super();
	}
	public OrderTable(int orderNum, String orderTradeNum, String orderTransNum, String orderReceiveName, String zipCode,
			String orderReceiveAddr, String orderReceiveAddrDetail, String orderReceivePhone, String orderReceiveMobile,
			String orderEmail, String orderMemo, int sumMoney, String orderTradeType, Date orderDate, int orderStatus,
			String orderDelete, String memberId, int cardNum) {
		super();
		this.orderNum = orderNum;
		this.orderTradeNum = orderTradeNum;
		this.orderTransNum = orderTransNum;
		this.orderReceiveName = orderReceiveName;
		this.zipCode = zipCode;
		this.orderReceiveAddr = orderReceiveAddr;
		this.orderReceiveAddrDetail = orderReceiveAddrDetail;
		this.orderReceivePhone = orderReceivePhone;
		this.orderReceiveMobile = orderReceiveMobile;
		this.orderEmail = orderEmail;
		this.orderMemo = orderMemo;
		this.sumMoney = sumMoney;
		this.orderTradeType = orderTradeType;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.orderDelete = orderDelete;
		this.memberId = memberId;
		this.cardNum = cardNum;
	}
	
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderTradeNum() {
		return orderTradeNum;
	}
	public void setOrderTradeNum(String orderTradeNum) {
		this.orderTradeNum = orderTradeNum;
	}
	public String getOrderTransNum() {
		return orderTransNum;
	}
	public void setOrderTransNum(String orderTransNum) {
		this.orderTransNum = orderTransNum;
	}
	public String getOrderReceiveName() {
		return orderReceiveName;
	}
	public void setOrderReceiveName(String orderReceiveName) {
		this.orderReceiveName = orderReceiveName;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getOrderReceiveAddr() {
		return orderReceiveAddr;
	}
	public void setOrderReceiveAddr(String orderReceiveAddr) {
		this.orderReceiveAddr = orderReceiveAddr;
	}
	public String getOrderReceiveAddrDetail() {
		return orderReceiveAddrDetail;
	}
	public void setOrderReceiveAddrDetail(String orderReceiveAddrDetail) {
		this.orderReceiveAddrDetail = orderReceiveAddrDetail;
	}
	public String getOrderReceivePhone() {
		return orderReceivePhone;
	}
	public void setOrderReceivePhone(String orderReceivePhone) {
		this.orderReceivePhone = orderReceivePhone;
	}
	public String getOrderReceiveMobile() {
		return orderReceiveMobile;
	}
	public void setOrderReceiveMobile(String orderReceiveMobile) {
		this.orderReceiveMobile = orderReceiveMobile;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public int getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(int sumMoney) {
		this.sumMoney = sumMoney;
	}
	public String getOrderTradeType() {
		return orderTradeType;
	}
	public void setOrderTradeType(String orderTradeType) {
		this.orderTradeType = orderTradeType;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderDelete() {
		return orderDelete;
	}
	public void setOrderDelete(String orderDelete) {
		this.orderDelete = orderDelete;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCardNum() {
		return cardNum;
	}
	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}
	
	
	
	@Override
	public String toString() {
		return "OrderTable [orderNum=" + orderNum + ", orderTradeNum=" + orderTradeNum + ", orderTransNum="
				+ orderTransNum + ", orderReceiveName=" + orderReceiveName + ", zipCode=" + zipCode
				+ ", orderReceiveAddr=" + orderReceiveAddr + ", orderReceiveAddrDetail=" + orderReceiveAddrDetail
				+ ", orderReceivePhone=" + orderReceivePhone + ", orderReceiveMobile=" + orderReceiveMobile
				+ ", orderEmail=" + orderEmail + ", orderMemo=" + orderMemo + ", sumMoney=" + sumMoney
				+ ", orderTradeType=" + orderTradeType + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus
				+ ", orderDelete=" + orderDelete + ", memberId=" + memberId + ", cardNum=" + cardNum + "]";
	}
	
}
