package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;

@Service
public class SkuServiceImp implements SkuServiceInf {
	@Autowired
	private SkuMapper skuMapper;
	@Override
	public List<T_MALL_PRODUCT> get_spu_by_class_2_id_tm_id(Integer class_2_id, Integer pp_id) {
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("flbh2", class_2_id);
		paramMap.put("pp_id", pp_id);
		List<T_MALL_PRODUCT> list_spu = skuMapper.select_spu_by_class_2_id_tm_id(paramMap);
		return list_spu;
	}
	@Override
	public List<OBJECT_MALL_ATTR_VALUE> get_attr_value_by_class2_id(Integer class_2_id) {
		List<OBJECT_MALL_ATTR_VALUE> list_object = skuMapper.select_attr_value_by_class2_id(class_2_id);
		return list_object;
	}
	@Override
	public void addSku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> sku_list) {
		int i = skuMapper.insert_sku(sku);
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("sku_id", sku.getId());
		paramMap.put("sku_list",sku_list);
		int j = skuMapper.insert_sku_attr_value(paramMap);
	}

}
