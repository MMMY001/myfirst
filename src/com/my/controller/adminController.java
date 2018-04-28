package com.my.controller;

import com.my.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utils.Page;
import com.my.mapper.GamesMapper;
import com.my.pojo.GameVo;
import com.my.pojo.Games;
import com.my.pojo.QueryVo;
import com.my.pojo.User;
import com.my.service.GamesService;
import com.my.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class adminController {

    @Autowired
    private UserService userService;
    @Autowired
    private GamesService gamesService;
    @Autowired
    private OrdersService ordersService;


    // 查询用户
    @RequestMapping(value = "/usermanage/list.action")
    public String list(QueryVo vo, Model model) {

        // 通过用户名查询分页对象
        Page<User> page = userService.selectPageByQueryVo(vo);
        // Integer state = userService.selectState(vo.getUser_name());
        model.addAttribute("page", page);
        // 回显
        model.addAttribute("user_name", vo.getUser_name());

        return "managerjsp/usermanage";
    }

    // 查询所有游戏
    @RequestMapping(value = "/goodsmanage/gamemanage.action")
    public String glist(GameVo vo, Model model) {

        // 通过游戏名查询分页对象
        Page<Games> page = gamesService.selectPageByGameVo(vo);
        // Integer state = userService.selectState(vo.getUser_name());
        model.addAttribute("page", page);
        // 回显
        model.addAttribute("user_name", vo.getGame_name());

        return "managerjsp/goodsmanage";
    }

    // 通过Id删除游戏
    @RequestMapping(value = "game/delete.action")
    public @ResponseBody
    String deleteGameById(Integer id) {

        gamesService.deleteGameById(id);
        return "OK";
    }

    // 弹出修改页面 查询单个游戏
    @RequestMapping(value = "game/edit.action")
    public @ResponseBody
    Games edit(Integer id) {
        return gamesService.selectGamesById(id);
    }

    // 通过Id修改游戏
    @RequestMapping(value = "game/update.action")
    public @ResponseBody
    String updateGameById(Games games) {
        gamesService.updateGameById(games);
        return "OK";
    }

    // 添加游戏
    @RequestMapping(value = "game/add.action")
    public @ResponseBody
    String insertGame(Games games) {
        games.getSorName();
        gamesService.insertGame(games);
        return "OK";

    }

    // 通过Id删除用户 并且删除用户的订单
    @RequestMapping(value = "customer/delete.action")
    public @ResponseBody
    String deleteUserById(Integer id) {

        ordersService.deleteOrderByUId(id);
        userService.deleteUserById(id);
        return "OK";
    }

}
