package com.my.service;

import com.common.utils.Page;
import com.my.pojo.*;

public interface UserService {

	// 登录
	public User userLogin(String user_name, String user_password);

    //  验证用户名是否已存在
	public String  selectUserName(String user_name);

	// 通过用户名查询state
	public Integer selectState(String user_name);

	// 注册
	public void userRegist(User user);

	// 查询用户
	public Page<User> selectPageByQueryVo(QueryVo vo);

	// 通过Id删除用户
	public void deleteUserById(Integer id);

	// 通过用户名查询Id
	public Integer selcetUidByUname(String user_name);

    //  账户充值
    public void rechargeCash(RechargeVo vo);

    //  购买游戏
	public boolean buybuyGame(BuyGameVo vo);

	// 通过用户名查询用户资金
	public float selectUserCash(String user_name);

	// 通过用户名修改密码
    public void updatePwd(User u);
}
