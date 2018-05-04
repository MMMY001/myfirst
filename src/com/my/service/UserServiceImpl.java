package com.my.service;

import com.common.utils.MD5Util;
import com.my.mapper.GamesMapper;
import com.my.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utils.Page;
import com.my.mapper.CustomerMapper;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private GamesMapper gamesMapper;

    // 登录
    @Override
    public User userLogin(String user_name, String user_password) {
        // TODO Auto-generated method stub
        // 因为密码经过MD5加密所以要将输入密码进行加密，用加密后的值于数据库中的值比对
        MD5Util md5Util =new MD5Util();
        String password =  md5Util.MD5Util(user_password);
        return customerMapper.userLogin(user_name, password);
    }


    // 查询state
    public Integer selectState(String user_name) {
        // TODO Auto-generated method stub
        return customerMapper.selectState(user_name);
    }

    // 注册
    @Override
    public void userRegist(User user) {

        MD5Util md5Util =new MD5Util();
        // 对密码进行MD5加密
        String password = user.getUser_password();
        user.setUser_password(md5Util.MD5Util(password));

        // TODO Auto-generated method stub
        int i = (int) System.currentTimeMillis(); // 获取当前的毫秒数
        user.setUser_id(i);// 设置用户ID
        user.setState(1);// 设置用户权限
        customerMapper.userRegist(user);
    }

    //  验证用户名是否已存在
    public String  selectUserName(String user_name){
        //判断用户名是否已经存在
        return customerMapper.selectUserName(user_name);
    }

    // 通过用户名查询分页对象
    public Page<User> selectPageByQueryVo(QueryVo vo) {
        Page<User> page = new Page<User>();

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
            if (null != vo.getUser_name() && !"".equals(vo.getUser_name().trim())) {
                vo.setUser_name(vo.getUser_name().trim());
            }

            // 总条数
            vo.setState(1);
            page.setTotal(customerMapper.customerCountByQueryVo(vo));
            page.setRows(customerMapper.selectCustomerListByQueryVo(vo));

        }

        return page;
    }

    // 通过Id删除用户
    public void deleteUserById(Integer id) {
        // 调用mapper
        customerMapper.deleteUserById(id);
    }

    // 通过用户名查询Id
    public Integer selcetUidByUname(String user_name) {
        Integer id = customerMapper.selcetUidByUname(user_name);
        return id;
    }

    // 账户充值
    public void rechargeCash(RechargeVo vo) {
        // 通过用户ID查询原有资金
        float user_cash = customerMapper.selectUserCashById(vo.getUser_id());
        vo.setUser_cash((user_cash + vo.getUser_cash()));
        // 将计算过后的资金存入数据库
        customerMapper.rechargeCashById(vo);
    }

    //  购买游戏
    public boolean buybuyGame(BuyGameVo vo) {
        Games games =new Games();

        // 通过用户ID查询原有资金
        float user_cash = customerMapper.selectUserCashById(vo.getUser_id());

        // 通过游戏ID查询原有销量
        Integer saleCount =gamesMapper.selectSaleCountById(vo.getGame_id());


        int i = (int) System.currentTimeMillis(); // 获取当前的毫秒数
        Date time = new Date(); // 获取系统时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 设置日期格式
        String dateNowStr = sdf.format(time); // 格式化当前日期

        //  设置订单流水号
        vo.setOrder_no(dateNowStr+i);
        // 设置订单生成时间
        vo.setOrder_time(time);

        if ((user_cash-vo.getGame_price() ) >= 0) { //  购买成功

            // 通过游戏ID获取要购买游戏的URL
            vo.setGame_url(gamesMapper.selectUrlById(vo.getGame_id()));

            // 购买成功游戏销量+1
            games.setG_saleCount((saleCount+1));

            // 通过游戏ID修改销售数量
            games.setGame_id(vo.getGame_id());
            gamesMapper.updateSaleCountById(games);

            // 修改用户资金
            vo.setUser_cash(user_cash-vo.getGame_price() );
            customerMapper.updateCashById(vo);

            // 设置订单状态
            vo.setOrder_payment("已付款");

            // 加入订单
            ordersService.insertOrders(vo);
            return true;
        } else { // 资金不足购买失败 但是可以加入购物订单？
            return false;
        }
    }

    // 通过用户名查询用户资金
    public float selectUserCash(String user_name){
       return  customerMapper.selectUserCash(user_name);
    }

    // 通过用户名修改密码
    public void updatePwd(User u){
        MD5Util md5Util =new MD5Util();
        // 对密码进行MD5加密
        String password = u.getUser_password();
        u.setUser_password(md5Util.MD5Util(password));
        customerMapper.updatePwd(u);
    }

    // 查询邮箱是否存在
    public Integer selectUIdByEmail(String email){
        return customerMapper.selectUIdByEmail(email);
    }

}
