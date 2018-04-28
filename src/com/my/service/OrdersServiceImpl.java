package com.my.service;

import com.my.pojo.BuyGameVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utils.Page;
import com.my.mapper.OrdersMapper;
import com.my.pojo.Orders;
import com.my.pojo.OrdersVo;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersMapper ordersMapper;

	// 通过用户ID查询分页对象
		public Page<Orders> selectPageByOrdersVo(OrdersVo vo){
			
			Page<Orders> page=new Page<Orders>();
			
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
				
				

				// 总条数
				page.setTotal(ordersMapper.odersCountByOrdersVo(vo));
				page.setRows(ordersMapper.selectOrdersListByOrdersVo(vo));

			}

			return page;
			
//			return ordersMapper.selectPageByOrdersVo(vo);
		}


	// 加入订单
	public void insertOrders(BuyGameVo vo){
			ordersMapper.insertOrders(vo);
	}

	//根据用户的Id删除订单
	public void deleteOrderByUId(Integer id){
			ordersMapper.deleteOrdersByUId(id);

	}

	// 根据订单ID查询游戏URL
	public String selectUrlById(Integer id){
       return ordersMapper.selectUrlById(id);
	}
	
}
