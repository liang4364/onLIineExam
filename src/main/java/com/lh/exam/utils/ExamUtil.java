package com.lh.exam.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
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

}
