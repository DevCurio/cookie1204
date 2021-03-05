package product.model.vo;

public class OrderDessertExt extends OrderDessert {

	private String dessertName;

	
	
	public OrderDessertExt() {
		super();
	}
	public OrderDessertExt(String dessertName) {
		super();
		this.dessertName = dessertName;
	}

	
	
	public String getDessertName() {
		return dessertName;
	}
	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}



	@Override
	public String toString() {
		return "OrderDesertExt [dessertName=" + dessertName + ", getOrderTradeNum()=" + getOrderTradeNum()
				+ ", getDessertNum()=" + getDessertNum() + ", getOrderDessertAmount()=" + getOrderDessertAmount()
				+ ", getOrderDessertDelete()=" + getOrderDessertDelete() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
