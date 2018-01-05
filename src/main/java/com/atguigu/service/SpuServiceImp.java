package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;

@Service
public class SpuServiceImp implements SpuServiceInf {
	@Autowired
	private SpuMapper spuMapper;
	
	@Override
	public void spu_add(T_MALL_PRODUCT spu, List<String> list_img) {
		//将前台传递过来的数据插入商品信息表
		int count_product = spuMapper.insert_into_t_mall_product(spu);
		//批量插入商品图片
		Map<String, Object> imgMap = new HashMap<String,Object>();
		imgMap.put("shp_id", spu.getId());
		imgMap.put("list_img", list_img);
		spuMapper.insert_into_t_mall_product_image(imgMap);
		
	}

	
}
