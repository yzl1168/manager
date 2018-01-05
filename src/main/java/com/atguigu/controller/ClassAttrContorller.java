package com.atguigu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_ATTR;
import com.atguigu.service.ClassAttrServiceInf;

@Controller
public class ClassAttrContorller {
	@Autowired
	private ClassAttrServiceInf classAttrServiceInf;
	@RequestMapping("/goto_attr/{success}")
	public String goto_attr(){
		return "manager_attr";
	}
	
	@ResponseBody
	@RequestMapping(value="/get_attr_value_by_class2_id_easyui",method=RequestMethod.POST)
	public List<OBJECT_MALL_ATTR_VALUE> get_attr_value_by_class2_id_easyui(Integer class_2_id){
		List<OBJECT_MALL_ATTR_VALUE> list_object = classAttrServiceInf.get_attr_value_by_class2_id(class_2_id);
		return list_object;
	}
	@RequestMapping(value="/get_attr_value_by_class2_id",method=RequestMethod.POST)
	public String get_attr_value_by_class2_id(Integer class_2_id,ModelMap map){
		List<OBJECT_MALL_ATTR_VALUE> list_object = classAttrServiceInf.get_attr_value_by_class2_id(class_2_id);
		map.put("list_object", list_object);
		return "manager_attr_inner";
	}
	
	@RequestMapping("/goto_class_2_attr_add/{class_2_id}/{class_2_name}")
	public String goto_class_2_attr_add(ModelMap map ,@PathVariable Integer class_2_id,@PathVariable String class_2_name,@RequestParam(defaultValue="0") Integer success){
		map.addAttribute("class_2_id", class_2_id);
		map.addAttribute("class_2_name", class_2_name);
		map.addAttribute("success",success);
		return "manager_attr_add";
	}
	
	@RequestMapping(value="/class_2_attr_add",method=RequestMethod.POST)
	public ModelAndView class_2_attr_add(MODEL_OBJECT_MALL_ATTR_VALUE momav,Integer class_2_id,String class_2_name,ModelMap map){
		List<OBJECT_MALL_ATTR_VALUE> attr_list = momav.getAttr_list();
		T_MALL_ATTR param = new T_MALL_ATTR();
		for (OBJECT_MALL_ATTR_VALUE attr : attr_list) {
			attr.setFlbh2(class_2_id);
			param.setFlbh2(class_2_id);
			String shxm_mch = attr.getShxm_mch();
			param.setShxm_mch(shxm_mch);
			T_MALL_ATTR db_t_mall_attr = classAttrServiceInf.query_class_2_attr(param);
			//已经存的属性流不插入
			if(db_t_mall_attr==null){
				 classAttrServiceInf.save_class_2_attr(attr);
			}else{
				attr.setId(db_t_mall_attr.getId());
			}
		}
		int i = classAttrServiceInf.save_class_2_attr_value(attr_list);
		ModelAndView mv = new ModelAndView("redirect:index.do");
		mv.addObject("class_2_id", class_2_id);
		mv.addObject("class_2_name", class_2_name);
		mv.addObject("success", 1);
		return mv;
		
	}
}
