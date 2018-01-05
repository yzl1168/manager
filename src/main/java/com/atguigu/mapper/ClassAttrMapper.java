package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_ATTR;

public interface ClassAttrMapper {

	List<OBJECT_MALL_ATTR_VALUE> select_attr_value_by_class2_id(Integer class_2_id);

	int insert_class_2_attr(OBJECT_MALL_ATTR_VALUE attr);

	int insert_class_2_values(Map<String, Object> paramMap);

	T_MALL_ATTR select_class_2_attr(T_MALL_ATTR param);


}
