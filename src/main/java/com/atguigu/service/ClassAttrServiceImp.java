package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_MALL_ATTR_VALUE;
import com.atguigu.bean.T_MALL_ATTR;
import com.atguigu.mapper.ClassAttrMapper;

@Service
public class ClassAttrServiceImp implements ClassAttrServiceInf {
	@Autowired
	private ClassAttrMapper classAttrMapper;

	@Override
	public List<OBJECT_MALL_ATTR_VALUE> get_attr_value_by_class2_id(Integer class_2_id) {
		
		return classAttrMapper.select_attr_value_by_class2_id(class_2_id);
	}

	@Override
	public int save_class_2_attr_value(List<OBJECT_MALL_ATTR_VALUE> attr_list) {
		int i = 0;
		for (OBJECT_MALL_ATTR_VALUE attr : attr_list) {
			Map<String, Object> paramMap = new HashMap<String,Object>();
			paramMap.put("attr_id", attr.getId());
			paramMap.put("list_value", attr.getList_value());
			//批量插入属性值
			i = classAttrMapper.insert_class_2_values(paramMap);
		}
		return i;
	}

	@Override
	public T_MALL_ATTR query_class_2_attr(T_MALL_ATTR param) {
		return classAttrMapper.select_class_2_attr(param);
	}

	@Override
	public void save_class_2_attr(OBJECT_MALL_ATTR_VALUE attr) {
		 classAttrMapper.insert_class_2_attr(attr);
		
	}
	
}
