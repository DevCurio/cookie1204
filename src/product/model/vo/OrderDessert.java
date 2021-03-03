package product.model.vo;

public class OrderDessert {
	
	private String orderTradeNum;
	private int dessertNum;
	private int orderDessertAmount;
	private String orderDessertDelete;
	
	
	
	public OrderDessert() {
		super();
	}
	public OrderDessert(String orderTradeNum, int dessertNum, int orderDessertAmount, String orderDessertDelete) {
		super();
		this.orderTradeNum = orderTradeNum;
		this.dessertNum = dessertNum;
		this.orderDessertAmount = orderDessertAmount;
		this.orderDessertDelete = orderDessertDelete;
	}
	
	
	
	public String getOrderTradeNum() {
		return orderTradeNum;
	}
	public void setOrderTradeNum(String orderTradeNum) {
		this.orderTradeNum = orderTradeNum;
	}
	public int getDessertNum() {
		return dessertNum;
	}
	public void setDessertNum(int dessertNum) {
		this.dessertNum = dessertNum;
	}
	public int getOrderDessertAmount() {
		return orderDessertAmount;
	}
	public void setOrderDessertAmount(int orderDessertAmount) {
		this.orderDessertAmount = orderDessertAmount;
	}
	public String getOrderDessertDelete() {
		return orderDessertDelete;
	}
	public void setOrderDessertDelete(String orderDessertDelete) {
		this.orderDessertDelete = orderDessertDelete;
	}
	
	
	
	@Override
	public String toString() {
		return "OrderDessert [orderTradeNum=" + orderTradeNum + ", dessertNum=" + dessertNum + ", orderDessertAmount="
				+ orderDessertAmount + ", orderDessertDelete=" + orderDessertDelete + "]";
	}
	
}
