package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuServiceInf {

	List<T_MALL_PRODUCT> get_spu_by_class_2_id_tm_id(Integer class_2_id, Integer pp_id);

	List<OBJECT_MALL_ATTR_VALUE> get_attr_value_by_class2_id(Integer class_2_id);

	void addSku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> sku_list);

}
