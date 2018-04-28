package com.my.service;

import com.common.utils.Page;
import com.my.pojo.GameVo;
import com.my.pojo.Games;

public interface GamesService {

	// 查询所有游戏
	public Page<Games> selectPageByGameVo(GameVo vo);

	// 删除游戏
	public void deleteGameById(Integer id);

	// 查询单个游戏
	public Games selectGamesById(Integer id);

	// 更新游戏信息
	public void updateGameById(Games games);

	// 添加游戏
	public void insertGame(Games games);

	// 根据游戏ID查询游戏价格
	public float selectPriceById(Integer id);

}
