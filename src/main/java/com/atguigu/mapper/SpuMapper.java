package com.atguigu.mapper;

import java.util.Map;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuMapper {

	int  insert_into_t_mall_product(T_MALL_PRODUCT spu);

	void insert_into_t_mall_product_image(Map<String, Object> imgMap);

}
