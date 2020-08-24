package com.fh;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.*;

public class ExportExceTest {
    //1.创建一个配置实例
    Configuration cfg = new Configuration();
    //设置模板文件所在位置

    public static void main(String[] args) throws IOException, TemplateException {
        //1.创建一个配置实例
        Configuration cfg = new Configuration();
        //设置模板文件所在位置
        cfg.setClassForTemplateLoading(ExportExceTest.class,"/template");
        //3.设置字符集编码
        cfg.setDefaultEncoding("utf-8");
        //4.获取模板文件
        Template template = cfg.getTemplate("hehehDox.ftl", "utf-8");
        //创建数据模型
        Map<String,Object> dataMap = new HashMap<>();
        List<Book> bookList = new ArrayList<>();
        for (int i=1; i<5; i++) {
            Book book = new Book();
            book.setBookId(i);
            book.setBookName("Java从入门到精通");
            book.setBookPrice(55.6);
            book.setIsup(1);
            book.setProducedDate(new Date());
            bookList.add(book);
        }
        dataMap.put("bookList",bookList);
        // 6.创建一个Writer对象
        Writer writer = new OutputStreamWriter(new FileOutputStream("d:/heheDox.doc"));
        template.process(dataMap,writer);

        writer.close();

    }

}
