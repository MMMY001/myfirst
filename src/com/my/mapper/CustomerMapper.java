package com.my.mapper;

import java.util.List;

import com.my.pojo.BuyGameVo;
import com.my.pojo.RechargeVo;
import org.apache.ibatis.annotations.Param;

import com.my.pojo.QueryVo;
import com.my.pojo.User;

public interface CustomerMapper {

	// 登录
	public User userLogin(@Param("user_name") String user_name, @Param("user_password") String user_password);

	// 查询state
	public Integer selectState(@Param("user_name") String user_name);

	// 注册
	public void userRegist(User user);

	// 查询的结果集
	public List<User> selectCustomerListByQueryVo(QueryVo vo);

	// 查询总条数
	public Integer customerCountByQueryVo(QueryVo vo);

	// 通过Id删除用户
	public void deleteUserById(Integer id);

	// 通过用户名查询Id
	public Integer selcetUidByUname(String user_name);

	// 通过用户ID查询原有资金
	public float selectUserCashById(Integer user_id);

	// 将计算过后的资金存入数据库
	public void rechargeCashById(RechargeVo vo);

	// 购买游戏后剩余资金存入数据库
	public void updateCashById(BuyGameVo vo);

	//判断用户名是否已经存在
	public String selectUserName(String user_name);

	// 通过用户名查询用户资金
	public float selectUserCash(String user_name);

	// 通过用户名修改密码
    public void updatePwd(User u);
}
