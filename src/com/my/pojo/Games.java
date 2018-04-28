package com.my.pojo;

public class Games {

    private int game_id; // 游戏ID
    private String game_name; // 游戏名称
    private float game_price;// 游戏价格
    private String game_pic; //游戏封面
    private String game_present; //游戏评论
    private int g_saleCount; // 游戏销售数量
    private int sorId; // 游戏分类ID
    private String game_image; //游戏图片
    private String sorName; // 游戏分类
    private String game_url; // 游戏链接


    public String getSorName() {
        return sorName;
    }

    public void setSorName(String sorName) {
        this.sorName = sorName;
    }

    public int getGame_id() {
        return game_id;
    }

    public void setGame_id(int game_id) {
        this.game_id = game_id;
    }

    public String getGame_name() {
        return game_name;
    }

    public void setGame_name(String game_name) {
        this.game_name = game_name;
    }

    public float getGame_price() {
        return game_price;
    }

    public void setGame_price(float game_price) {
        this.game_price = game_price;
    }

    public String getGame_pic() {
        return game_pic;
    }

    public void setGame_pic(String game_pic) {
        this.game_pic = game_pic;
    }

    public String getGame_present() {
        return game_present;
    }

    public void setGame_present(String game_present) {
        this.game_present = game_present;
    }

    public int getG_saleCount() {
        return g_saleCount;
    }

    public void setG_saleCount(int g_saleCount) {
        this.g_saleCount = g_saleCount;
    }

    public int getSorId() {
        return sorId;
    }

    public void setSorId(int sorId) {
        this.sorId = sorId;
    }

    public String getGame_image() {
        return game_image;
    }

    public void setGame_image(String game_image) {
        this.game_image = game_image;
    }

    public String getGame_url() {
        return game_url;
    }

    public void setGame_url(String game_url) {
        this.game_url = game_url;
    }
}
