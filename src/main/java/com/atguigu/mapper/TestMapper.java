package com.atguigu.mapper;

import java.util.List;

import com.atguigu.bean.T_MALL_CLASS_1;
import com.atguigu.bean.T_MALL_CLASS_2;

public interface TestMapper {
	List<T_MALL_CLASS_1> selet_class_1();

	List<T_MALL_CLASS_2> selet_class_2_by_class_1_id(Integer id);
}
