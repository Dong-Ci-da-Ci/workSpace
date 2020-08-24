package com.fh;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class FreemarkerTest {

    public static void main(String[] args) throws IOException, TemplateException {
        //1.创建配置实例
        Configuration cfg = new Configuration();
        //2.设置freemarker模板文件所在目录
        cfg.setClassForTemplateLoading(FreemarkerTest.class,"/template");
        //3.设置字符集编码
        cfg.setDefaultEncoding("utf-8");
        //4.获取模板文件
        Template template = cfg.getTemplate("test.ftl");
        //5.创建数据模型
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("username","小明");
        //这个是user的Map集合
        Map<String,Object> userMap = new HashMap<>();
        userMap.put("loginCount",5);
        userMap.put("lastLoginTime",new Date());
        dataMap.put("user",userMap);
        //创建一个writer对象
        Writer writer = new OutputStreamWriter(new FileOutputStream("d:/小明.html"));
        template.process(dataMap,writer);

        writer.close();






    }

}
