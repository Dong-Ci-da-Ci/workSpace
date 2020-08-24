package com.fh.test;

import java.util.*;

public class LambdaTest {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("hehe");
        list.add("haha");
        list.add("heihei");
        //普通输出方法
        for (int i = 0; i <list.size() ; i++) {
            //System.out.println(list.get(i));
        }
        //lambda表达式方法
        //list.forEach(x-> System.out.println(x));



        Map<String,Object> map = new HashMap<>();
        map.put("name：","小明");
        map.put("sex:","女");
        map.put("age:","23");

        //输出方法一、通过keySet遍历
        for(String k : map.keySet()){
            System.out.println(k);
        }

        for(Object v : map.values()){
            System.out.println(v);
        }

        //输出方法二、通过entrySet遍历(常用)
        for(Map.Entry<String,Object> entry :map.entrySet()){
            System.out.println("key = " + entry.getKey() + "value:" + entry.getValue());
        }

        //输出方法三、通过Iterator遍历
        Iterator<Map.Entry<String,Object>> iterator = map.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry<String,Object> entry = iterator.next();
            System.out.println("key = " + entry.getKey() + "value:" + entry.getValue());

        }

        //输出方法四、通过Ilambda表达式方法遍历
        map.forEach((key,value)->
                System.out.println(key+":"+value));
    }
}

