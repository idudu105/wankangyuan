package com.xtkong.model;

public class FormatField {
	private int ff_id;// 格式字段ID
	private String ff_name;	// 格式字段名
	private int ft_id;	// 格式类型ID
	public int getFf_id() {
		return ff_id;
	}
	public void setFf_id(int ff_id) {
		this.ff_id = ff_id;
	}
	public int getFt_id() {
		return ft_id;
	}
	public void setFt_id(int ft_id) {
		this.ft_id = ft_id;
	}
	public String getFf_name() {
		return ff_name;
	}
	public void setFf_name(String ff_name) {
		this.ff_name = ff_name;
	}

}
