package com.fh.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

public class JsonUtil {
	
	public static void toJson(Object obj,HttpServletResponse response){
		//request是请求，response是响应客户端
		//我们需要手动处理一下response，将我们的json数据，手动返回给客户端
		//告诉response对象，内容格式是json格式的
		response.setContentType("application/json");
		//告诉response对象，编码格式是utf-8
		response.setCharacterEncoding("UTF-8");
		//将list转化为json数据
		String jsonString = JSON.toJSONString(obj);
		//往response里面放对应的json数据
		try {
			//拿到response的输出流，往里面放上json数据
			PrintWriter writer = response.getWriter();
			//使用writer的write方法将json数据放到输出流中
			writer.write(jsonString);
			//使用完毕之后，进行关流
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
