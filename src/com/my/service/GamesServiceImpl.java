package com.my.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utils.Page;
import com.my.mapper.GamesMapper;
import com.my.mapper.SortMapper;
import com.my.pojo.GameVo;
import com.my.pojo.Games;
import com.my.pojo.Sort;
import com.my.pojo.User;

@Service
public class GamesServiceImpl implements GamesService {

	@Autowired
	private GamesMapper gamesMapper;
	
	@Autowired
	private SortMapper sortMapper;

	public Page<Games> selectPageByGameVo(GameVo vo) {
		Page<Games> page = new Page<Games>();

		// 每页显示的条数
		page.setSize(6);

		vo.setSize(6);

		// 判断当前页
		if (null != vo) {
			// 判断当前页
			if (null != vo.getPage()) {
				page.setPage(vo.getPage());
				vo.setStartRow((vo.getPage() - 1) * vo.getSize());
			}
			if (null != vo.getGame_name() && !"".equals(vo.getGame_name().trim())) {
				vo.setGame_name(vo.getGame_name().trim());
			}

			// 总条数
			page.setTotal(gamesMapper.gameCountByGameVo(vo));
			page.setRows(gamesMapper.selectGamesListByGameVo(vo));

		}

		return page;
	}

	// 删除单个游戏
	public void deleteGameById(Integer id) {
		gamesMapper.deleteGameById(id);
	}

	// 查询单个游戏
	public Games selectGamesById(Integer id) {
		return gamesMapper.selectGamesById(id);
	}

	// 更新游戏
	public void updateGameById(Games games) {
		gamesMapper.updateGameById(games);
	}

	// 添加游戏
	public void insertGame(Games games) {
		
		// 根据sorname查询sorid
		int i = sortMapper.selectSortId(games.getSorName());

		// 设置初始销售数量为零
		games.setG_saleCount(0);
		// 根据sorname查询sorid 设置sorId
		games.setSorId(i);
		
		gamesMapper.insertGame(games);
	}

	// 根据游戏ID查询游戏价格
	public float selectPriceById(Integer  id){
		return gamesMapper.selectPriceById(id);
	}

}
