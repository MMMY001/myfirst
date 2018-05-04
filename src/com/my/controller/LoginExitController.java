package com.my.controller;

import com.common.utils.MailUtil;
import com.common.utils.MyCheckCode;
import com.my.pojo.User;
import com.my.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Controller
public class LoginExitController {

    @Autowired
    // @Qualifier("UserService")
    private UserService userService;


    // 主页入口
    @RequestMapping(value = "/index.action")
    public String welcome() {
        return "myindex";
    }

    // 获得验证码
    @RequestMapping(value = "/getVerifyCode.action")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        MyCheckCode mycode = new MyCheckCode();
        String verifyCodeValue = mycode.drawImg(output);

        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    /**
     * 用户登录
     *
     * @param user_name
     * @param user_password
     * @param session
     * @param request
     * @return
     */
    // 登录判断
    @RequestMapping(value = "/user_login.action", method = RequestMethod.POST)
    public @ResponseBody
    String user_Login(String user_name, String user_password, HttpSession session, HttpServletRequest request) {

        /**
         *  判断验证码是否正确
         */

        // 用户输入验证码
        String inputVerifyCode = request.getParameter("user_input_verifyCode");
        // session中保存验证码
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");

        if (verifyCodeValue.equals(inputVerifyCode)) {  // 验证码正确
            /**
             *  进行登陆判断
             */
            User existUser = userService.userLogin(user_name, user_password);
            if (existUser != null) { // 账号密码正确
                // 根据用户名查询用户权限
                int state = userService.selectState(user_name);
                if (state == 1) { // 普通用户跳转主页
                    request.getSession().setAttribute("user_name", user_name);
                    // 设置sessio周期 request.getSession().setMaxInactiveInterval(2);
                    return "1";
//                    return "1";
                } else {  // 管理员跳转用户管理
                    return "2";
                }
            } else { // 账号密码错误
                return "3";
            }
        } else { // 验证码错误
            return "4";
        }
    }


    // 跳转用户注册页面
    @RequestMapping(value = "/user_registPage.action")
    public String JumpRegist() {
        return "newregist";
    }


    //发送邮箱验证码
    private static String mailcode;

    /**
     *
     * 发送验证码
     */

    public String sendCodeCommon(String email){
        // 声明校验码工具类
        MyCheckCode myCheckCode = new MyCheckCode();
        // 获得校验码
        mailcode = myCheckCode.exampleCode();
        // 声明邮箱工具类
        MailUtil mailUtil = new MailUtil();
        // 发送校验码到用户邮箱
        try {
            mailUtil.MailUtil(email, mailcode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "OK";
    }

    // 注册邮箱校验
    @RequestMapping(value = "/sendEMail", method = RequestMethod.GET)
    public @ResponseBody
    String sendMailCode(@RequestParam String user_email) {
        String email = user_email;

        // 校验邮箱是否已经存在
        Integer email_id = userService.selectUIdByEmail(email);

        if (email_id != null) {
            return "existence";
        } else {
            return sendCodeCommon(email);
        }
    }




    /**
     * 忘记密码
     *
     * @return
     */
    //  跳转邮箱验证页面
    @RequestMapping(value = "/findPwd")
    public String findPwd() {
        return "accountjsp/findpwd";
    }
    // 忘记密码验证码发送
    @RequestMapping(value = "/sendEMail2", method = RequestMethod.GET)
    public @ResponseBody
    String sendEMail2(@RequestParam String user_email) {
        String email = user_email;
        // 校验邮箱是否已经存在
        Integer email_id = userService.selectUIdByEmail(email);

        if(email_id != null){
            return sendCodeCommon(email);
        }else {
            return "None";
        }


    }

    // 验证码是否输入正确
    @RequestMapping(value = "/CheckMail")
    public @ResponseBody
    String CheckMail(String user_input_code) {

        if (user_input_code.equals(mailcode)) {
            return "OK";
        } else {
            return "error";
        }
    }

    // 通过验证弹出更改框
    @RequestMapping( value = "/UpdatePage.action")
    public String UpdatePage(){
        return "accountjsp/updatePwd";
    }

    /**
     * 用户注册
     *
     * @param user
     * @param userInputCode
     * @return
     */
    // 用户注册
    @RequestMapping(value = "/user_regist.action", method = RequestMethod.POST)
    public @ResponseBody
    String user_Regist(User user, String userInputCode) {

        String inputCode = userInputCode;
        if (inputCode.equals(mailcode)) {  //  判断验证码是否正确
            // 检验用户名是否已存在
            String existUserName = userService.selectUserName(user.getUser_name());
            if (user.getUser_name() == null || user.getUser_name() == "") {
                return "0";
            } else if (existUserName != null) {
                return "1";
            } else {
                userService.userRegist(user);
//		System.out.println(user.getUser_name() + ":" + user.getUser_password());
                // 注册成功跳到登录页面
                return "2";
            }
        } else {
            return "9";
        }


    }

    // 退出登录
    @RequestMapping(value = "/exit_logon.action")
    public String exitLogin(HttpSession session) {

        // 退出登录销毁session对象
        session.invalidate();
        return "mylogin";
    }
}
