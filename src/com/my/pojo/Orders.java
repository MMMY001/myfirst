package com.my.pojo;

import java.util.Date;

public class Orders {
	
	private int order_id; //订单ID
	private String order_no; // 订单流水号
	private int user_id; // 用户ID
	private Date order_time; // 订单生成时间
	private String game_name; // 游戏名称
	private String game_price;// 游戏价格
	private String game_url; // 游戏链接
	private String order_payment; // 订单付款状态
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public String getGame_price() {
		return game_price;
	}
	public void setGame_price(String game_price) {
		this.game_price = game_price;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}

	public String getGame_url() {
		return game_url;
	}

	public void setGame_url(String game_url) {
		this.game_url = game_url;
	}
}
