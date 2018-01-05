package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.SkuServiceInf;

@Controller
public class SkuController {
	@Autowired
	private SkuServiceInf skuServiceInf;
	@RequestMapping("/goto_sku_add/{success}")
	public String index(ModelMap map,@PathVariable String success){
		map.addAttribute("success", success);
		return "manager_sku_add";
	}
	
	@ResponseBody
	@RequestMapping("/get_spu_by_class_2_id_tm_id")
	public Object get_spu_by_class_2_id_tm_id(Integer class_2_id,Integer pp_id){
		List<T_MALL_PRODUCT> list_spu = skuServiceInf.get_spu_by_class_2_id_tm_id(class_2_id,pp_id);
		return	list_spu;
	}
	
	@RequestMapping(value="/get_sku_attr_value_by_class2_id",method=RequestMethod.POST)
	public String get_attr_value_by_class2_id(Integer class_2_id,ModelMap map){
		List<OBJECT_MALL_ATTR_VALUE> list_object = skuServiceInf.get_attr_value_by_class2_id(class_2_id);
		map.addAttribute("list_object", list_object);
		return "manager_sku_inner";
	}
	
	@RequestMapping(value="/add_sku")
	public ModelAndView add_sku(MODEL_OBJECT_MALL_ATTR_VALUE momav,T_MALL_PRODUCT spu,T_MALL_SKU sku){
		List<OBJECT_MALL_ATTR_VALUE> attr_list = momav.getAttr_list();
		List<T_MALL_SKU_ATTR_VALUE> sku_list = new ArrayList<T_MALL_SKU_ATTR_VALUE>();
		sku.setShp_id(spu.getId());
		for(OBJECT_MALL_ATTR_VALUE attr : attr_list){
			if(attr.getId()!=null && attr.getList_value().get(0).getId()!=null){
				T_MALL_SKU_ATTR_VALUE t_mall_sku_attr_value = new T_MALL_SKU_ATTR_VALUE();
				t_mall_sku_attr_value.setShp_id(spu.getId());
				t_mall_sku_attr_value.setShxm_id(attr.getId());
				t_mall_sku_attr_value.setShxzh_id(attr.getList_value().get(0).getId());
				sku_list.add(t_mall_sku_attr_value);
			}
		}
		skuServiceInf.addSku(sku,sku_list);
		ModelAndView mv = new ModelAndView("redirect:index.do");
		mv.addObject("success", "添加sku成功！");
		return mv;
		
	}
}
