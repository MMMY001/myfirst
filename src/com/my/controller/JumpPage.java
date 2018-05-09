package com.my.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;


@Controller
public class JumpPage {

    /**
     * 导航条跳转
     *
     * @return
     */
    // 首页跳转
    @RequestMapping(value = "/Jumpindex.action")
    public String Jumpindex() {
        return "myindex";
    }

    // 跳转登录页面
    @RequestMapping(value = "/login.action")
    public String Jumplogin() {
        return "mylogin";
    }

    // 跳转关于我们
    @RequestMapping(value = "/Jumpabout.action")
    public String Jumpabout() {
        return "managerjsp/aboutUs";
    }

    // 跳转联系我们
    @RequestMapping(value = "/Jumpcontact.action")
    public String Jumpcontact() {
        return "managerjsp/contactUs";
    }

    // 跳转联系我们
    @RequestMapping(value = "/Jumpsolve.action")
    public String Jumpsolve() {
        return "managerjsp/solveProb";
    }

    /**
     * 后台跳转
     *
     * @return
     */
    // 管理页面跳转
    @RequestMapping(value = "/goodsmanage.action")
    public String Jumpgoods() {
        return "managerjsp/goodsmanage";
    }

    @RequestMapping(value = "/usermanage.action")
    public String Jumpusers() {
        return "managerjsp/usermanage";
    }

    /**
     * 游戏页面跳转
     *
     * @return
     */

    @RequestMapping(value = "/JumpPRG")
    public String JumpPRG() {
        return "PRG";
    }

    @RequestMapping(value = "/JumpSPG")
    public String JumpSPG() {
        return "SPG";
    }

    @RequestMapping(value = "/JumpSLG")
    public String JumpSLG() {
        return "SLG";
    }

    @RequestMapping(value = "/JumpSIM")
    public String JumpSIM() {
        return "SIM";
    }

    @RequestMapping(value = "/JumpFPS")
    public String JumpFPS() {
        return "FPS";
    }

    @RequestMapping(value = "/JumpACT")
    public String JumpACT() {
        return "ACT";
    }

    @RequestMapping(value = "/gamejsp/jpghost.action")
    public String jumpghost() {
        return "gamejsp/ghost";
    }

    @RequestMapping(value = "/gamejsp/jpCOD14.action")
    public String jumpCOD14() {
        return "gamejsp/COD14";
    }

    @RequestMapping(value = "/gamejsp/jpGTA5.action")
    public String jumpGTA5() {
        return "gamejsp/GTA5";
    }

    @RequestMapping(value = "/gamejsp/jpHOI4.action")
    public String jumpHOI4() {
        return "gamejsp/HOI4";
    }

    @RequestMapping(value = "/gamejsp/jpsiege.action")
    public String jumpsiege() {
        return "gamejsp/siege";
    }

    @RequestMapping(value = "/gamejsp/jpAWO.action")
    public String jumpAWO() {
        return "gamejsp/AWO";
    }

    @RequestMapping(value = "/gamejsp/jpFARCRY5.action")
    public String jumpFARCRY5() {
        return "gamejsp/FARCRY5";
    }

    @RequestMapping(value = "/gamejsp/jpMSE.action")
    public String jumpMSE() {
        return "gamejsp/MSE";
    }

    @RequestMapping(value = "/gamejsp/jpmonster.action")
    public String jumpmonster() {
        return "gamejsp/monster";
    }

    @RequestMapping(value = "/gamejsp/jpdfz.action")
    public String jpdfz() {
        return "gamejsp/DFZ";
    }

    @RequestMapping(value = "/gamejsp/jpnioh.action")
    public String jpnioh() {
        return "gamejsp/NIOH";
    }

    @RequestMapping(value = "/gamejsp/jpysVIII.action")
    public String jpysVIII() {
        return "gamejsp/YsVIII";
    }

    @RequestMapping(value = "/gamejsp/jptwtk.action")
    public String jptwtk() {
        return "gamejsp/TWTK";
    }

    @RequestMapping(value = "/gamejsp/jpfs5.action")
    public String jpfs5() {
        return "gamejsp/FS5";
    }

    @RequestMapping(value = "/gamejsp/jphangame.action")
    public String jphangame() {
        return "gamejsp/hangame";
    }

    /**
     * 个人中心跳转
     *
     * @param session
     * @param request
     * @return
     */
    @RequestMapping(value = "/accoutindex.action")
    public String accoutindex(HttpSession session, HttpServletRequest request) {

        return "accountjsp/acctIndex";
    }

    // 我的订单
    @RequestMapping(value = "/myOrders.action")
    public String myOrders() {
        return "accountjsp/myOrders1";
    }

    // 我的游戏
    @RequestMapping(value = "/myGames.action")
    public String myGames() {
        return "accountjsp/myGames1";
    }

    // 充值中心
    @RequestMapping(value = "/myRecharge.action")
    public String myRecharge() {
        return "accountjsp/myRecharge1";
    }

    // 账号信息
    @RequestMapping(value = "/myBasic.action")
    public String myBasic() {
        return "accountjsp/myBasic";
    }

    // 账号安全
    @RequestMapping(value = "/mySafety.action")
    public String mySafety() {
        return "accountjsp/mySafety1";
    }

    // 修改密码
    @RequestMapping(value = "/ChangePwd.action")
    public String ChangePwd() {
        return "accountjsp/changepwd";
    }


}
