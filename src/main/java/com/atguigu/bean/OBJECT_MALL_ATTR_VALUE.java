package com.atguigu.bean;

import java.util.Date;
import java.util.List;

public class OBJECT_MALL_ATTR_VALUE {
	private Integer id,flbh2;
	private String shxm_mch,shfqy;
	private Date chjshj;
	private List<T_MALL_VALUE> list_value;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFlbh2() {
		return flbh2;
	}
	public void setFlbh2(Integer flbh2) {
		this.flbh2 = flbh2;
	}
	public String getShxm_mch() {
		return shxm_mch;
	}
	public void setShxm_mch(String shxm_mch) {
		this.shxm_mch = shxm_mch;
	}
	public String getShfqy() {
		return shfqy;
	}
	public void setShfqy(String shfqy) {
		this.shfqy = shfqy;
	}
	public Date getChjshj() {
		return chjshj;
	}
	public void setChjshj(Date chjshj) {
		this.chjshj = chjshj;
	}
	public List<T_MALL_VALUE> getList_value() {
		return list_value;
	}
	public void setList_value(List<T_MALL_VALUE> list_value) {
		this.list_value = list_value;
	}
}
