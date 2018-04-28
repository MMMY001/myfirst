package com.my.pojo;

import java.util.Date;

public class BuyGameVo {
    private float user_cash; // 用户余额
    private String user_name; // 用户名
    private Integer user_id; // 用户ID
    private float game_price; // 游戏价格
    private Integer game_id; // 游戏ID
    private String game_name; // 游戏名称
    private String order_no; // 订单流水号
    private Date order_time; // 订单生成时间
    private String order_payment; // 订单付款状态
    private String game_url; // 游戏链接

    public String getGame_name() {
        return game_name;
    }

    public void setGame_name(String game_name) {
        this.game_name = game_name;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public String getOrder_payment() {
        return order_payment;
    }

    public void setOrder_payment(String order_payment) {
        this.order_payment = order_payment;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public Integer getGame_id() {
        return game_id;
    }

    public void setGame_id(Integer game_id) {
        this.game_id = game_id;
    }

    public float getGame_price() {
        return game_price;
    }

    public void setGame_price(float game_price) {
        this.game_price = game_price;
    }

    public float getUser_cash() {
        return user_cash;
    }

    public void setUser_cash(float user_cash) {
        this.user_cash = user_cash;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getGame_url() {
        return game_url;
    }

    public void setGame_url(String game_url) {
        this.game_url = game_url;
    }
}
