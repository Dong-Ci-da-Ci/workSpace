package com.fh.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	/**
	 * <pre>uploadFile()   
	 * 创建人：赵龙辉 zhaolhj@163.com    
	 * 创建时间：2019年12月20日 下午12:05:47    
	 * 修改人：赵龙辉 zhaolhj@163.com    
	 * 修改时间：2019年12月20日 下午12:05:47    
	 * 修改备注： 上传图片
	 * @param request
	 * @param images
	 * @return</pre>
	 */
	public static Map<String,Object>  uploadFile(HttpServletRequest request,MultipartFile images){
		Map<String,Object> map = new HashMap<>();
		// 1.获取文件名
		String originalFilename = images.getOriginalFilename();
		
		// 2.获取项目路径
		String path = request.getServletContext().getRealPath("/images");
		File file = new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		
		// 3.给文件重命名
		// 3.1获取文件后缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
		// 3.2使用UUID生成新的文件名
		String newFileName = UUID.randomUUID().toString() + suffix;
		
		try {
			// 4.图片上传
			File f = new File(path + "/" +newFileName);
			images.transferTo(f);
			map.put("success", true);
			map.put("newFileName", newFileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			map.put("success", false);
		}
		
		return map;
	}
	//技术文件大小
	public static String calculateSize(long size){
		DecimalFormat df = new DecimalFormat("0.00");
		if (size < 1024) {
			return size+"B";
		} else if (size < 1024 * 1024) {
			return df.format((double)size / 1024)+"KB";
		} else if (size < 1024 * 1024 * 1024) {
			return df.format((double)size / (1024 * 1024))+"MB";
		} else {
			return df.format((double)size / (1024 * 1024 * 1024))+"GB";
		}
	}

}
