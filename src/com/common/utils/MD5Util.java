package com.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
    // MD5加密算法
    public String MD5Util(String data) {

        //  获得Java提供的信息摘要算法加密功能类的一个实例
        MessageDigest md5 = null;

        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        // 将获得的String类型转换成byte数组
        char[] chars = data.toCharArray();
        byte[] bytes = new byte[chars.length];

        for (int i = 0; i < chars.length; i++) {
            bytes[i] = (byte) chars[i];
        }

        // 获得计算后的byte值
        byte[] md5byte = md5.digest(bytes);

        // 将获得的byte值转回String
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < md5byte.length; i++) {
            // 使用0xff保持转值不出错
            int val = md5byte[i] & 0xff;
            if (val < 16) {
                stringBuffer.append("0");
            } else {
                stringBuffer.append(Integer.toHexString(val));
            }
        }
        return stringBuffer.toString();
    }

/*
    // 测试
    public static void main(String[] args) {
        MD5Util util = new MD5Util();
        String s = new String("123456");
        System.out.println("初始数据" + s);
        System.out.print("加密后" + util.MD5Util(s));
    }
*/


}
