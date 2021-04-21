package com.lh.exam.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class ExamUtil {
    public static String getCourseId(String courseName){
        String courseId = "";
        if(courseName.equals("Java")){
            courseId = "ccf7a84f9c3f407388c996ce7e2dbc4a";
        }else if(courseName.equals("C++")){
            courseId = "ed975776d21340858209db1b6f4871e6";
        }else if(courseName.equals("Web前端")){
            courseId = "182a98f09feb47cca5d90346afa3c78e";
        }
        return courseId;
    }
    public static String readJSONStringFromRequestBody(HttpServletRequest request){
        StringBuffer json = new StringBuffer();
        String line = null;
        try{
            BufferedReader reader = request.getReader();
            while((line = reader.readLine()) != null){//一行一行的读数据
                json.append(line);
            }
        }catch(Exception e){
            System.out.println("Error reading JSON String " + e.toString());
        }
        return json.toString();//变为字符串返回
    }


    public static <T> List<T> mergeLists(List<T>... lists) {
        Class clazz = lists[0].getClass();
        List<T> list = null;
        try {
            list = (List<T>) clazz.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0, len = lists.length; i < len; i++) {
            list.addAll(lists[i]);
        }
        return list;
    }

    public static String dateDiff(String startTime, String endTime) throws ParseException {
        // 按照传入的格式生成一个simpledateformate对象
        String res = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
        long nh = 1000 * 60 * 60;// 一小时的毫秒数
        long nm = 1000 * 60;// 一分钟的毫秒数
        long ns = 1000;// 一秒钟的毫秒数
        long diff;
        long day = 0;
        long hour = 0;
        long min = 0;
        long sec = 0;
        // 获得两个时间的毫秒时间差异
        try {
            diff = sdf.parse(endTime).getTime() - sdf.parse(startTime).getTime();
            day = diff / nd;// 计算差多少天
            hour = diff % nd / nh + day * 24;// 计算差多少小时
            min = diff % nd % nh / nm + day * 24 * 60;// 计算差多少分钟
            sec = diff % nd % nh % nm / ns;// 计算差多少秒
            // 输出结果
            if(hour == 0){
                res =(min - day * 24 * 60) + "分钟" + sec + "秒";
            }else{
                res = (hour - day * 24) + "小时" + (min - day * 24 * 60) + "分钟" + sec + "秒";
            }
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       return res;
    }

    public static void main(String[] args) throws ParseException {
        String a = dateDiff("2021-04-12 16:52:46","2021-04-12 17:05:44");
        System.out.println(a);
    }
}
