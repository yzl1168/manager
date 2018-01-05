package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuServiceInf;
import com.atguigu.util.MyUploadUtil;

@Controller
public class SpuController {
	@Autowired
	private SpuServiceInf spuServiceInf;
	@RequestMapping("/goto_spu_add/{success}")
	public String goto_spu_add(@PathVariable String success){
		return "manager_spu_add";
	}
	
	//接收商品发布的数据
	@RequestMapping(value="/spu_add",method=RequestMethod.POST)
	public ModelAndView spu_add(@RequestParam("files")MultipartFile[] files,T_MALL_PRODUCT spu){
		List<String> list_img = MyUploadUtil.uploadFiles(files);
		spu.setShp_tp(list_img.get(0));
		
		spuServiceInf.spu_add(spu,list_img);
		String success = "上传商品信息成功";
		ModelAndView mv = new ModelAndView("redirect:index.do");
		mv.addObject("success", success);
		return mv;
	}
}
