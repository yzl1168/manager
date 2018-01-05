package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuMapper {

	List<T_MALL_PRODUCT> select_spu_by_class_2_id_tm_id(Map<String, Object> paramMap);

	List<OBJECT_MALL_ATTR_VALUE> select_attr_value_by_class2_id(Integer class_2_id);

	int insert_sku(T_MALL_SKU sku);

	int insert_sku_attr_value(List<T_MALL_SKU_ATTR_VALUE> sku_list);

	int insert_sku_attr_value(Map<String, Object> paramMap);
	
}
