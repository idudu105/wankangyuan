package com.xtkong.model;

import java.util.List;

public class Source {
	private int cs_id;// 采集源ID
	private String cs_name;// 采集源名
	private boolean is_view;// 是否显示到前端 0不显示；1显示

	private List<SourceFiled> sourceFileds;

	public List<SourceFiled> getSourceFileds() {
		return sourceFileds;
	}

	public void setSourceFileds(List<SourceFiled> sourceFileds) {
		this.sourceFileds = sourceFileds;
	}

	public int getCs_id() {
		return cs_id;
	}

	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}

	public String getCs_name() {
		return cs_name;
	}

	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}

	public boolean isIs_view() {
		return is_view;
	}

	public void setIs_view(boolean is_view) {
		this.is_view = is_view;
	}
}