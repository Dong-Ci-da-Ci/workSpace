package com.fh;

import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.util.*;

public class ExportPdfTest {

    public static void main(String[] args) throws IOException, TemplateException, DocumentException {
        //1.加载配置实例
        Configuration cfg = new Configuration();
        //2.设置模板文件
        cfg.setClassForTemplateLoading(ExportExceTest.class,"/template");
        //3.配置字符集编码
        cfg.setDefaultEncoding("utf-8");
        //4.获取模版文件
        Template template = cfg.getTemplate("pdf.ftl", "utf-8");
        //5.创建数据模型
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
        Writer writer = new StringWriter();
        //7.
        template.process(dataMap,writer);
        //8.从writer对象中得到生成的html内容
        String html =  writer.toString();

        //9.创建一个pdf渲染器
        ITextRenderer renderer = new ITextRenderer();
        // 设置字体，目前只支持宋体和黑体，否则pdf中的中文不会显示
        ITextFontResolver fontResolver = renderer.getFontResolver();
        fontResolver.addFont("/template/simsun.ttc", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        //10.将HTML内容放到pdf渲染器中
        renderer.setDocumentFromString(html);
        //11.调用pdf渲染器中的layout（）方法
        renderer.layout();
        //12.创建输出流
        OutputStream outputStream = new FileOutputStream("d:/pdfBook.pdf");
        //13.调用pdf渲染器中的pdf文件的方法
        renderer.createPDF(outputStream);
        renderer.finishPDF();
        outputStream.close();






    }
}
