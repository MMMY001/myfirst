package com.my.mapper;

import java.util.List;

import com.common.utils.Page;
import com.my.pojo.GameVo;
import com.my.pojo.Games;

public interface GamesMapper {

	// 查询总数
	public int gameCountByGameVo(GameVo vo);

	// 查询游戏
	public List<Games> selectGamesListByGameVo(GameVo vo);

	// 通过Id删除游戏
	public void deleteGameById(Integer id) ;

	// 通过ID查询游戏显示在修改框上
	public Games selectGamesById(Integer id);

	// 通过ID更新游戏信息
	public void updateGameById(Games game);

	// 添加游戏
	public void insertGame(Games games);

	// 根据游戏ID查询游戏价格
	public float selectPriceById(Integer  id);

	// 通过游戏ID查询原有销量
	public Integer selectSaleCountById(Integer id);

	// 通过游戏ID修改销售数量
	public void updateSaleCountById(Games games);

	// 获取要购买游戏的URL
    public String selectUrlById(Integer id);
}
