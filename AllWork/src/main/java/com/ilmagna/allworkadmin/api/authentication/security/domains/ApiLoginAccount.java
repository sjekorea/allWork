package com.ilmagna.allworkadmin.api.authentication.security.domains;

import java.io.Serializable;
import java.util.Date;

import org.joda.time.DateTime;

public class ApiLoginAccount implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -2567040620340949370L;
	
	private Integer id;
	private Integer user_type;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String token;
	private String push_token;			// FCM Push Notification을 위한 device token.
	private String description;
	private DateTime last_login_at;

	private String delete_flag;
	private DateTime create_at;
	private String create_by;
	private Date update_at;
	private String update_by;
	
	private String role_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getUser_type() {
		return user_type;
	}
	public void setUser_type(Integer user_type) {
		this.user_type = user_type;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	/**
	 * @return the push_token
	 */
	public String getPush_token() {
		return push_token;
	}
	/**
	 * @param push_token the push_token to set
	 */
	public void setPush_token(String push_token) {
		this.push_token = push_token;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public DateTime getLast_login_at() {
		return last_login_at;
	}
	public void setLast_login_at(DateTime last_login_at) {
		this.last_login_at = last_login_at;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	public DateTime getCreate_at() {
		return create_at;
	}
	public void setCreate_at(DateTime create_at) {
		this.create_at = create_at;
	}
	public String getCreate_by() {
		return create_by;
	}
	public void setCreate_by(String create_by) {
		this.create_by = create_by;
	}
	public Date getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(Date update_at) {
		this.update_at = update_at;
	}
	public String getUpdate_by() {
		return update_by;
	}
	public void setUpdate_by(String update_by) {
		this.update_by = update_by;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
}