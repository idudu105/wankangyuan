package com.xtkong.model;

public class SourceFiled {
	private int csf_id; // 采集源字段ID
	private String csf_name; // 采集字段名
	private int cs_id; // 采集源ID
	private String type; // 类型
	private String check; // 校验规则
	private boolean enumerated; // 是否可枚举 0 不可；1 可枚举
	private boolean not_null; // 是否必填 0 可空；1 必填
	private String description;//字段描述信息
	private String error_msg; // 错误信息提示
	private String create_datetime; // 创建时间
	private int create_uid; // 创建人
	private String update_datetime; // 更新时间
	private int update_uid; // 更新人

	private String creator; // 创建人
	private String updater; // 更新人
	
	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public int getCsf_id() {
		return csf_id;
	}

	public void setCsf_id(int csf_id) {
		this.csf_id = csf_id;
	}

	public int getCs_id() {
		return cs_id;
	}

	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}

	public String getCsf_name() {
		return csf_name;
	}

	public void setCsf_name(String csf_name) {
		this.csf_name = csf_name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public boolean isEnumerated() {
		return enumerated;
	}

	public void setEnumerated(boolean enumerated) {
		this.enumerated = enumerated;
	}

	public boolean isNot_null() {
		return not_null;
	}

	public void setNot_null(boolean not_null) {
		this.not_null = not_null;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getError_msg() {
		return error_msg;
	}

	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
	}

	public String getCreate_datetime() {
		return create_datetime;
	}

	public void setCreate_datetime(String create_datetime) {
		this.create_datetime = create_datetime;
	}

	public int getCreate_uid() {
		return create_uid;
	}

	public void setCreate_uid(int create_uid) {
		this.create_uid = create_uid;
	}

	public String getUpdate_datetime() {
		return update_datetime;
	}

	public void setUpdate_datetime(String update_datetime) {
		this.update_datetime = update_datetime;
	}

	public int getUpdate_uid() {
		return update_uid;
	}

	public void setUpdate_uid(int update_uid) {
		this.update_uid = update_uid;
	}

}
