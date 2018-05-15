package com.xtkong.model;

import java.util.List;

public class FormatType {
	private int ft_id;// 格式类型ID
	private int higher_ft_id;// 上层格式类型ID:1表示顶层，格式化数据类别
	private String ft_name; // 格式类型名
	private int cs_id; // 采集源ID
	private List<FormatType> formatTypeFloders;

	public int getFt_id() {
		return ft_id;
	}

	public void setFt_id(int ft_id) {
		this.ft_id = ft_id;
	}

	public int getHigher_ft_id() {
		return higher_ft_id;
	}

	public void setHigher_ft_id(int higher_ft_id) {
		this.higher_ft_id = higher_ft_id;
	}

	public String getFt_name() {
		return ft_name;
	}

	public void setFt_name(String ft_name) {
		this.ft_name = ft_name;
	}

	public int getCs_id() {
		return cs_id;
	}

	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}

	public List<FormatType> getFormatTypeFloders() {
		return formatTypeFloders;
	}

	public void setFormatTypeFloders(List<FormatType> formatTypeFloders) {
		this.formatTypeFloders = formatTypeFloders;
	}

}
