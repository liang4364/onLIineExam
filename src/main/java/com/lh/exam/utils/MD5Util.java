package com.lh.exam.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
    public static String getMD5(String password) {
        try {
            //得到一个信息摘要器
            MessageDigest digest = MessageDigest.getInstance("md5");
            byte[] result = digest.digest(password.getBytes());
            StringBuffer buffer = new StringBuffer();
            //把每一个byte做一个与运算 0xff
            for(byte b : result){
                int number = b & 0xff;//加盐
                String str = Integer.toHexString(number);
                if(str.length() == 1){
                    buffer.append("0");
                }
                buffer.append(str);
            }
            //标准的md5加密后的结果
            return buffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    /*public static void main(String[] args) {
        String i = "123";
        String j = MD5Util.getMD5(i);
        System.out.println(j);
    }*/
}
