package com.fh.util;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ExcelUtil {

    public static void excelDownload(XSSFWorkbook wirthExcelWB, HttpServletRequest request,HttpServletResponse response, String fileName) {
        OutputStream out = null;
        try {
        	
        	//解决下载文件名中文乱码问题
        	if(request.getHeader("User-agent").toLowerCase().indexOf("firefox")!=-1){
        		fileName = new String(fileName.getBytes("utf-8"),"iso-8859-1");
        	}else{
        		fileName = URLEncoder.encode(fileName,"utf-8");
        	}
        	
            out = response.getOutputStream();
            // 让浏览器识别是什么类型的文件
            response.reset(); // 重点突出
            response.setCharacterEncoding("UTF-8"); // 重点突出
            response.setContentType("application/x-msdownload");// 不同类型的文件对应不同的MIME类型
                                                                // // 重点突出
            // inline在浏览器中直接显示，不提示用户下载
            // attachment弹出对话框，提示用户进行下载保存本地
            // 默认为inline方式
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            wirthExcelWB.write(out);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != out) {
                try {
                    out.close();
                    out = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
