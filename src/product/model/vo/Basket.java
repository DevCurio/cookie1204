package product.model.vo;

import java.sql.Date;

public class Basket {
	
	private int basketNum;				// 장바구니 고유번호 pk
	private int basketAmountNum;		// 상품 수량
	private int basketSumMoney;			// 합계 금액
	private String memberId;			// 회원 아이디
	private int dessertNum;				// 상품 번호 fk
	private String basketDelete;		// 삭제 여부
	private Date basketDate;			// 추가날짜
	private String dessertName;			// 제품 이름
	private int dessertPrice;			// 제품 가격
	
	public Basket() {}
	public Basket(int basketNum, int basketAmountNum, int basketSumMoney, String memberId, int dessertNum,
			String basketDelete, Date basketDate, String dessertName, int dessertPrice) {
		super();
		this.basketNum = basketNum;
		this.basketAmountNum = basketAmountNum;
		this.basketSumMoney = basketSumMoney;
		this.memberId = memberId;
		this.dessertNum = dessertNum;
		this.basketDelete = basketDelete;
		this.basketDate = basketDate;
		this.dessertName = dessertName;
		this.dessertPrice = dessertPrice;
	}
	
	
	
	public int getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}
	public int getBasketAmountNum() {
		return basketAmountNum;
	}
	public void setBasketAmountNum(int basketAmountNum) {
		this.basketAmountNum = basketAmountNum;
	}
	public int getBasketSumMoney() {
		return basketSumMoney;
	}
	public void setBasketSumMoney(int basketSumMoney) {
		this.basketSumMoney = basketSumMoney;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getDessertNum() {
		return dessertNum;
	}
	public void setDessertNum(int dessertNum) {
		this.dessertNum = dessertNum;
	}
	public String getBasketDelete() {
		return basketDelete;
	}
	public void setBasketDelete(String basketDelete) {
		this.basketDelete = basketDelete;
	}
	public Date getBasketDate() {
		return basketDate;
	}
	public void setBasketDate(Date basketDate) {
		this.basketDate = basketDate;
	}
	public String getDessertName() {
		return dessertName;
	}
	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}
	public int getDessertPrice() {
		return dessertPrice;
	}
	public void setDessertPrice(int dessertPrice) {
		this.dessertPrice = dessertPrice;
	}
	
	
	
	@Override
	public String toString() {
		return "Basket [basketNum=" + basketNum + ", basketAmountNum=" + basketAmountNum + ", basketSumMoney="
				+ basketSumMoney + ", memberId=" + memberId + ", dessertNum=" + dessertNum + ", basketDelete="
				+ basketDelete + ", basketDate=" + basketDate + ", dessertName=" + dessertName + ", dessertPrice="
				+ dessertPrice + "]";
	}
	
}
