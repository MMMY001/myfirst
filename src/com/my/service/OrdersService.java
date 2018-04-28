package com.my.service;

import com.common.utils.Page;
import com.my.pojo.BuyGameVo;
import com.my.pojo.Orders;
import com.my.pojo.OrdersVo;

public interface OrdersService {

	// 通过用户ID查询分页对象
	 Page<Orders> selectPageByOrdersVo(OrdersVo vo);

	// 加入订单
	 void insertOrders(BuyGameVo vo);

	//根据用户的Id删除订单
    void deleteOrderByUId(Integer id);

	// 根据订单ID查询游戏URL
	String selectUrlById(Integer id);
}
