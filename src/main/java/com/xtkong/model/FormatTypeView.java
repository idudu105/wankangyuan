package com.xtkong.model;

public class FormatTypeView {
	private int ft_id;// 格式类型ID
	private int higher_ft_id;// 上层格式类型ID:1表示顶层，格式化数据类别
	private String ft_name; // 格式类型名
	private int cs_id; // 采集源ID
	private String creator;// 创建人
	private String create_datetime;// 创建时间
	private String updater;// 更新人
	private String update_datetime;// 更新时间
	private boolean is_view;// 状态
	private String higher_ft_name;// 格式化数据类别

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

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreate_datetime() {
		return create_datetime;
	}

	public void setCreate_datetime(String create_datetime) {
		this.create_datetime = create_datetime;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public String getUpdate_datetime() {
		return update_datetime;
	}

	public void setUpdate_datetime(String update_datetime) {
		this.update_datetime = update_datetime;
	}



	public boolean isIs_view() {
		return is_view;
	}

	public void setIs_view(boolean is_view) {
		this.is_view = is_view;
	}

	public String getHigher_ft_name() {
		return higher_ft_name;
	}

	public void setHigher_ft_name(String higher_ft_name) {
		this.higher_ft_name = higher_ft_name;
	}

}
