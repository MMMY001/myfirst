package com.my.pojo;

public class OrdersVo {
	// 用户ID
	private Integer user_id;

	// 当前页
	private Integer page;

	// 每页数
	private Integer size = 10;

	// 开始行
	private Integer startRow = 0;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getStartRow() {
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	
	

}
