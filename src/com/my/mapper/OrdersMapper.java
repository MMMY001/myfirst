package com.my.mapper;

import java.util.List;

import com.my.pojo.BuyGameVo;
import com.my.pojo.Orders;
import com.my.pojo.OrdersVo;

public interface OrdersMapper {

    //  查询对应订单总条数
    public int odersCountByOrdersVo(OrdersVo vo);

    //  对应订单集合
    public List<Orders> selectOrdersListByOrdersVo(OrdersVo vo);

    // 加入订单
    public void insertOrders(BuyGameVo vo);

    //根据用户的Id删除订单
    void deleteOrdersByUId(Integer id);

    // 根据订单ID查询游戏URL
    String selectUrlById(Integer id);
}
