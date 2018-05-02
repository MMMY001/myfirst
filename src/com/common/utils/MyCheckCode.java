package com.common.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * 验证码生成工具
 */

public class MyCheckCode {

    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 绘画验证码
     *
     * @param output
     * @return
     */
    public String drawImg(ByteArrayOutputStream output) {
        // 获取验证码
        code = exampleCode();
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /**
     * 随机参数一个字符
     *
     * @return
     */
    public char randomChar() {
        Random r = new Random();
        String s = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789";
        return s.charAt(r.nextInt(s.length()));
    }
    /**
     * 获取4个字符验证码
     */
    public String exampleCode(){
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        return code;
    }


    /*private BufferedImage image; // 图像
    private String str; // 验证码
    private static char code[] = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789".toCharArray();

    public static final String SESSION_CODE_NAME = "code";

    public MyCheckCode() {
        init(); // 初始化属性
    }

    *//**
     * 取得随机实例
     *//*
    public static MyCheckCode Instance() {
        return new MyCheckCode();
    }

    *//**
     * 取得验证码图片
     *//*
    public BufferedImage getImage() {
        return this.image;
    }

    *//**
     * 取得图片的验证码
     *//*
    public String getString() {
        return this.str;
    }

    public void init() {
        // 在内存中创建图像
        int width = 85;
        int height = 20;
        // 获取图形上下文
        Graphics g = image.getGraphics();
        // 生成随机类
        Random random = new Random();
        // 设置背景颜色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        // 设置字体
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        // 随机产生155条干扰线，使图像中的验证码不易被其他程序探测
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }
        // 取随机产生的验证码(设定为四位数)
        String sRand = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(code[random.nextInt(code.length)]);
            sRand += rand;
            // 将验证码显示到图像中
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            // 调用函数产生的颜色相同，直接生成
            g.drawString(rand, 13 * i + 6, 16);
        }
        // 赋值验证码
        this.str=sRand;


    }

    *//*
     * 给定范围获得随机颜色
     *//*
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

*/
}
