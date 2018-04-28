package com.my.pojo;

public class GameVo {

	// 游戏名
	private String game_name;

	// 当前页
	private Integer page;

	// 每页数
	private Integer size = 10;

	// 开始行
	private Integer startRow = 0;

	public String getGame_name() {
		return game_name;
	}

	public void setGame_name(String game_name) {
		this.game_name = game_name;
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
