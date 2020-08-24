package com.fh.util;


import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;
import java.util.UUID;

public class FreemarkerUtil {

    /**
     * 在服务器上生成Word文档
     * @param dataMap 数据模型
     * @param templateName 模板名
     * @param templateFolderName 模板文件夹
     * @param request
     * @return 返回值
     */
    public static File generateWord(Map<String,Object> dataMap,String templateName, String templateFolderName,HttpServletRequest request){
        File file = null;
        try {
            // 1.创建一个配置实例
            Configuration cfg = new Configuration();
            // 2.设置模板文件所在的位置
            cfg.setClassForTemplateLoading(FreemarkerUtil.class,templateFolderName);
            // 3.设置字符集编码
            cfg.setDefaultEncoding("utf-8");
            // 4.获取模板文件
            Template template = cfg.getTemplate(templateName, "utf-8");
            // 5.创建一个Writer对象
            // 获取项目发布在tomcat下的绝对路径
            String realPath = request.getServletContext().getRealPath("/");
            file = new File(realPath+"/"+ UUID.randomUUID()+".doc");
            OutputStream os = new FileOutputStream(file);
            Writer writer = new OutputStreamWriter(os,"utf-8");
            // 8.调用模板对象中的process方法填充数据并输出内容到指定的文件
            template.process(dataMap,writer);
            writer.close();
            os.close();
        } catch (IOException | TemplateException e) {
            e.printStackTrace();
        }
        return file;
    }

    public static File grenertePdf(Map<String,Object> dataMap,String templateName, String templateFolderName,HttpServletRequest request){
        File file = null;
        try {
            // 1.创建配置实例
            Configuration cfg = new Configuration();
            // 2.设置模板文件所在的目录
            cfg.setClassForTemplateLoading(FreemarkerUtil.class,templateFolderName);
            // 3.设置字符集
            cfg.setDefaultEncoding("utf-8");
            // 4.获取模板文件
            Template template = cfg.getTemplate(templateName, "utf-8");
            // 5.创建一个Write对象
            Writer writer = new StringWriter();
            // 6.调用模板对象中的process方法填充数据并输出内容到指定的文件
            template.process(dataMap,writer);
            // 7.从Writer对象中得到生成的html内容
            String html = writer.toString();
            // 8.创建一个PDF渲染器
            ITextRenderer renderer = new ITextRenderer();
            // 设置字体，目前只支持宋体和黑体，否则pdf中的中文不会显示
            ITextFontResolver fontResolver = renderer.getFontResolver();
            fontResolver.addFont("C:/Windows/fonts/simsun.ttc", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            // 9.将html内容放到PDF渲染器中
            renderer.setDocumentFromString(html);
            // 10.调用pdf渲染器中的layout方法
            renderer.layout();
            // 11.创建Pdf文件
            String realPath = request.getServletContext().getRealPath("/");
            file = new File(realPath +"/"+UUID.randomUUID()+".pdf");
            OutputStream outputStream = new FileOutputStream(file);
            // 12.调用PDF渲染器中创建PDF文件的方法
            renderer.createPDF(outputStream);
            renderer.finishPDF();
            outputStream.close();
        } catch (IOException | TemplateException | DocumentException e) {
            e.printStackTrace();
        }
        return file;
    }

}
