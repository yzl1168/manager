package com.atguigu.service;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_ATTR;

public interface ClassAttrServiceInf {

	List<OBJECT_MALL_ATTR_VALUE> get_attr_value_by_class2_id(Integer class_2_id);

	int save_class_2_attr_value(List<OBJECT_MALL_ATTR_VALUE> attr_list);

	T_MALL_ATTR query_class_2_attr(T_MALL_ATTR param);

	void save_class_2_attr(OBJECT_MALL_ATTR_VALUE attr);

}
