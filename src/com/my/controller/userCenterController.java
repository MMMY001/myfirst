package com.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.my.pojo.*;
import com.my.service.GamesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.utils.Page;
import com.my.service.OrdersService;
import com.my.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class userCenterController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private GamesService gamesService;

    // 修改个人密码
    @RequestMapping(value = "/changePwd.action")
    public @ResponseBody
    String changePw(String user_password, HttpSession session, HttpServletRequest request) {
        // 获取当前用户信息
        String user_name = (String) request.getSession().getAttribute("user_name");
        User user = new User();
        user.setUser_name(user_name);
        user.setUser_password(user_password);
        // 通过用户名修改密码
        userService.updatePwd(user);
        return "OK";


//        return "mylogin";
    }

    // 个人资金查询
    @RequestMapping(value = "/mycash.action")
    public String mycash(HttpSession session, HttpServletRequest request) {
        // 获取当前用户信息
        String user_name = (String) request.getSession().getAttribute("user_name");

        // 通过用户名查询用户资金
        float user_cash = userService.selectUserCash(user_name);
        session.setAttribute("user_cash", user_cash);
        request.getSession();
        return "accountjsp/mySafety1";
    }


    // 订单查询 通过用户名
    @RequestMapping(value = "/viewOrder.action")
    /* String user_name, HttpSession session, */
    public String olist(HttpServletRequest request, OrdersVo vo,
                        Model model) {
        // 获得当前登录用户名
        String user_name = (String) request.getSession().getAttribute("user_name");
        Integer page_id = (Integer) request.getSession().getAttribute("page_id");
//		System.out.println(user_name);
        // 通过用户名查询到用户Id
        if (null != user_name && "" != user_name) {
            vo.setUser_id(userService.selcetUidByUname(user_name));
            // 通过用户ID查询分页对象
            Page<Orders> page = ordersService.selectPageByOrdersVo(vo);
            model.addAttribute("page", page);
            // 回显
            model.addAttribute("user_id", vo.getUser_id());

            if (page_id == 001 && page_id != null) {
                return "accountjsp/myGames1";
            } else if (page_id == 002 && page_id != null) {
                return "accountjsp/myOrders1";
            }

        } else {
            return "accountjsp/acctIndex";
        }
        return null;
    }


    // 账户充值
    @RequestMapping(value = "/Recharge.action")
    public String rechargeCash(float user_cash, HttpServletRequest request, RechargeVo vo) {
        vo.setUser_cash(user_cash);
        // 获得当前登录用户名
        String user_name = (String) request.getSession().getAttribute("user_name");
        // 通过用户名查询到用户Id
        vo.setUser_id(userService.selcetUidByUname(user_name));
        userService.rechargeCash(vo);
        return "accountjsp/acctIndex";
    }

    // 购买游戏
    @RequestMapping(value = "game/buygame.action", method = RequestMethod.POST)
    public String buyGame(Integer game_id, String game_name, HttpServletRequest request, BuyGameVo vo) {
        // 获得当前登录用户名
        String user_name = (String) request.getSession().getAttribute("user_name");
        // 判断用户是否登录
        if (null != user_name && "" != user_name) {
            // 获得游戏ID
            vo.setGame_id(game_id);
            // 获得游戏名称
            vo.setGame_name(game_name);
            // 获取要购买游戏价格
            vo.setGame_price(gamesService.selectPriceById(vo.getGame_id()));

            // 通过用户名查询到用户Id
            vo.setUser_id(userService.selcetUidByUname(user_name));
            // 进行游戏购买操作
            boolean bo = userService.buybuyGame(vo);
            if (bo == true) { // 购买成功跳转到订单页面
                return "accountjsp/myOrders1";
            } else { // 购买失败跳转到个人中心首页
                return "accountjsp/acctIndex";
            }
        } else {
            return "mylogin";
        }

    }

    // 游戏下载
    @RequestMapping(value = "/findgameUrl.action")
    public @ResponseBody
    String findgameUrl(Integer id) {

        // 获取当前订单ID
        Integer order_id = id;

        // 根据订单ID查询游戏URL
        String url = ordersService.selectUrlById(order_id);
        if (url != null || url != "") {
            return url;
        }else{
            return null;
        }
    }

}
