package com.atguigu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {
	public static List<String> uploadFiles(MultipartFile[] files){
		List<String> list_file = new ArrayList<String>();
		String uploadPath = "D:\\B2C\\maven_mall_manager_01\\src\\main\\webapp\\upload";
		for (MultipartFile file : files) {
			String originalFilename = file.getOriginalFilename();
			originalFilename = System.currentTimeMillis()+originalFilename;
			try {
				file.transferTo(new File(uploadPath+"/"+originalFilename));
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			list_file.add(originalFilename);
		}
		return list_file;
	}
}
