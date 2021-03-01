package product.model.vo;

import java.sql.Date;

public class Dessert {
	private int dessertNum;
	private String dessertCategory;
	private String dessertName;
	private String dessertContent;
	private int dessertAmount;
	private int dessertPrice;
	private String dessertImage1;
	private String dessertImage2;
	private String dessertIsBest;
	private Date dessertEnrollDate;
	private String dessertDelete;
	
	public Dessert() {
		super();
	}

	public Dessert(int dessertNum, String dessertCategory, String dessertName, String dessertContent, int dessertAmount,
			int dessertPrice, String dessertImage1, String dessertImage2, String dessertIsBest, Date dessertEnrollDate,
			String dessertDelete) {
		super();
		this.dessertNum = dessertNum;
		this.dessertCategory = dessertCategory;
		this.dessertName = dessertName;
		this.dessertContent = dessertContent;
		this.dessertAmount = dessertAmount;
		this.dessertPrice = dessertPrice;
		this.dessertImage1 = dessertImage1;
		this.dessertImage2 = dessertImage2;
		this.dessertIsBest = dessertIsBest;
		this.dessertEnrollDate = dessertEnrollDate;
		this.dessertDelete = dessertDelete;
	}

	public int getDessertNum() {
		return dessertNum;
	}

	public void setDessertNum(int dessertNum) {
		this.dessertNum = dessertNum;
	}

	public String getDessertCategory() {
		return dessertCategory;
	}

	public void setDessertCategory(String dessertCategory) {
		this.dessertCategory = dessertCategory;
	}

	public String getDessertName() {
		return dessertName;
	}

	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}

	public String getDessertContent() {
		return dessertContent;
	}

	public void setDessertContent(String dessertContent) {
		this.dessertContent = dessertContent;
	}

	public int getDessertAmount() {
		return dessertAmount;
	}

	public void setDessertAmount(int dessertAmount) {
		this.dessertAmount = dessertAmount;
	}

	public int getDessertPrice() {
		return dessertPrice;
	}

	public void setDessertPrice(int dessertPrice) {
		this.dessertPrice = dessertPrice;
	}

	public String getDessertImage1() {
		return dessertImage1;
	}

	public void setDessertImage1(String dessertImage1) {
		this.dessertImage1 = dessertImage1;
	}

	public String getDessertImage2() {
		return dessertImage2;
	}

	public void setDessertImage2(String dessertImage2) {
		this.dessertImage2 = dessertImage2;
	}

	public String getDessertIsBest() {
		return dessertIsBest;
	}

	public void setDessertIsBest(String dessertIsBest) {
		this.dessertIsBest = dessertIsBest;
	}

	public Date getDessertEnrollDate() {
		return dessertEnrollDate;
	}

	public void setDessertEnrollDate(Date dessertEnrollDate) {
		this.dessertEnrollDate = dessertEnrollDate;
	}

	public String getDessertDelete() {
		return dessertDelete;
	}

	public void setDessertDelete(String dessertDelete) {
		this.dessertDelete = dessertDelete;
	}

	
	
	@Override
	public String toString() {
		return "Dessert [dessertNum=" + dessertNum + ", dessertCategory=" + dessertCategory + ", dessertName="
				+ dessertName + ", dessertContent=" + dessertContent + ", dessertAmount=" + dessertAmount
				+ ", dessertPrice=" + dessertPrice + ", dessertImage1=" + dessertImage1 + ", dessertImage2="
				+ dessertImage2 + ", dessertIsBest=" + dessertIsBest + ", dessertEnrollDate=" + dessertEnrollDate
				+ ", dessertDelete=" + dessertDelete + "]";
	}

}
