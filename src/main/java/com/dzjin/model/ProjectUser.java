package com.dzjin.model;

	/**
	* 表名：project_user
	* 作者：dzjin
	* 联系方式：dzjin5678@163.com
	* 创建时间：2018-05-11 13:49:00
	*/

public class ProjectUser {

	private int id;
	private int project_id;
	private int user_id;
	private String bind_date_time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBind_date_time() {
		return bind_date_time;
	}
	public void setBind_date_time(String bind_date_time) {
		this.bind_date_time = bind_date_time;
	}

	
}

