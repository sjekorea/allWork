package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiMemberModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String user_id;
	private String user_pw;
	private String password_que;
	private String password_chk;
	//private String junnum;			// 사용하지 않음.
	private String user_name;
	private String phone;				// 02-1234-5678
	private String hphone;				// 010-1234-5678
	private String birth;				// 1963-1-2
	private String sex;					// 성별 - man, woman
	private String strSex;
	private String email;
	private String use_mail;			// yes, no
	private String use_sms;
	private String use_push;
	private String post;
	private String address1;
	private String address2;
	private String strWdate;
	private String strLastLogin;
	private Date last_login_at;
	private String home;
	private String photo;
	private String p_chk;				// yes, no. 용도???
	private Integer user_type;			// 1, 2
	//private String last_school;		// 사용하지 않음.
	//private String high_school;		// 사용하지 않음.
	//private String university;		// 사용하지 않음.
	private String left;				// yes, no
	private String secession;			// 용도: 회워탈퇴 남김말.
	private String strLdate;
	private String memo;
	private Integer hit;
	private Integer tosa180422;			// 0, 1. 용도???
	private String strTosa180422Date;
	
	private String role_name;			// 개인회원, 기업회원
	private String token;				// Login 정보 token.
	private String push_token;			// FCM Push Notification을 위한 device token.

	private String new_pw;				// 비밀번호 변경.
	private Integer find_type;			// 1, 2. 사용자 ID와 비밀번호 찾는 방법.

	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the user_pw
	 */
	public String getUser_pw() {
		return user_pw;
	}
	/**
	 * @param user_pw the user_pw to set
	 */
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	/**
	 * @return the password_que
	 */
	public String getPassword_que() {
		return password_que;
	}
	/**
	 * @param password_que the password_que to set
	 */
	public void setPassword_que(String password_que) {
		this.password_que = password_que;
	}
	/**
	 * @return the password_chk
	 */
	public String getPassword_chk() {
		return password_chk;
	}
	/**
	 * @param password_chk the password_chk to set
	 */
	public void setPassword_chk(String password_chk) {
		this.password_chk = password_chk;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the hphone
	 */
	public String getHphone() {
		return hphone;
	}
	/**
	 * @param hphone the hphone to set
	 */
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}
	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/**
	 * @return the strSex
	 */
	public String getStrSex() {
		return strSex;
	}
	/**
	 * @param strSex the strSex to set
	 */
	public void setStrSex(String strSex) {
		this.strSex = strSex;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the use_mail
	 */
	public String getUse_mail() {
		return use_mail;
	}
	/**
	 * @param use_mail the use_mail to set
	 */
	public void setUse_mail(String use_mail) {
		this.use_mail = use_mail;
	}
	/**
	 * @return the use_sms
	 */
	public String getUse_sms() {
		return use_sms;
	}
	/**
	 * @param use_sms the use_sms to set
	 */
	public void setUse_sms(String use_sms) {
		this.use_sms = use_sms;
	}
	/**
	 * @return the use_push
	 */
	public String getUse_push() {
		return use_push;
	}
	/**
	 * @param use_push the use_push to set
	 */
	public void setUse_push(String use_push) {
		this.use_push = use_push;
	}
	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}
	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}
	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	/**
	 * @return the strWdate
	 */
	public String getStrWdate() {
		return strWdate;
	}
	/**
	 * @param strWdate the strWdate to set
	 */
	public void setStrWdate(String strWdate) {
		this.strWdate = strWdate;
	}
	/**
	 * @return the strLastLogin
	 */
	public String getStrLastLogin() {
		return strLastLogin;
	}
	/**
	 * @param strLastLogin the strLastLogin to set
	 */
	public void setStrLastLogin(String strLastLogin) {
		this.strLastLogin = strLastLogin;
	}
	/**
	 * @return the last_login_at
	 */
	public Date getLast_login_at() {
		return last_login_at;
	}
	/**
	 * @param last_login_at the last_login_at to set
	 */
	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
	}
	/**
	 * @return the home
	 */
	public String getHome() {
		return home;
	}
	/**
	 * @param home the home to set
	 */
	public void setHome(String home) {
		this.home = home;
	}
	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the p_chk
	 */
	public String getP_chk() {
		return p_chk;
	}
	/**
	 * @param p_chk the p_chk to set
	 */
	public void setP_chk(String p_chk) {
		this.p_chk = p_chk;
	}
	/**
	 * @return the user_type
	 */
	public Integer getUser_type() {
		return user_type;
	}
	/**
	 * @param user_type the user_type to set
	 */
	public void setUser_type(Integer user_type) {
		this.user_type = user_type;
	}
	/**
	 * @return the left
	 */
	public String getLeft() {
		return left;
	}
	/**
	 * @param left the left to set
	 */
	public void setLeft(String left) {
		this.left = left;
	}
	/**
	 * @return the secession
	 */
	public String getSecession() {
		return secession;
	}
	/**
	 * @param secession the secession to set
	 */
	public void setSecession(String secession) {
		this.secession = secession;
	}
	/**
	 * @return the strLdate
	 */
	public String getStrLdate() {
		return strLdate;
	}
	/**
	 * @param strLdate the strLdate to set
	 */
	public void setStrLdate(String strLdate) {
		this.strLdate = strLdate;
	}
	/**
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}
	/**
	 * @param memo the memo to set
	 */
	public void setMemo(String memo) {
		this.memo = memo;
	}
	/**
	 * @return the hit
	 */
	public Integer getHit() {
		return hit;
	}
	/**
	 * @param hit the hit to set
	 */
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	/**
	 * @return the tosa180422
	 */
	public Integer getTosa180422() {
		return tosa180422;
	}
	/**
	 * @param tosa180422 the tosa180422 to set
	 */
	public void setTosa180422(Integer tosa180422) {
		this.tosa180422 = tosa180422;
	}
	/**
	 * @return the strTosa180422Date
	 */
	public String getStrTosa180422Date() {
		return strTosa180422Date;
	}
	/**
	 * @param strTosa180422Date the strTosa180422Date to set
	 */
	public void setStrTosa180422Date(String strTosa180422Date) {
		this.strTosa180422Date = strTosa180422Date;
	}
	/**
	 * @return the role_name
	 */
	public String getRole_name() {
		return role_name;
	}
	/**
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	/**
	 * @return the token
	 */
	public String getToken() {
		return token;
	}
	/**
	 * @param token the token to set
	 */
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
	/**
	 * @return the new_pw
	 */
	public String getNew_pw() {
		return new_pw;
	}
	/**
	 * @param new_pw the new_pw to set
	 */
	public void setNew_pw(String new_pw) {
		this.new_pw = new_pw;
	}
	/**
	 * @return the find_type
	 */
	public Integer getFind_type() {
		return find_type;
	}
	/**
	 * @param find_type the find_type to set
	 */
	public void setFind_type(Integer find_type) {
		this.find_type = find_type;
	}
	/**
	 * @return the ids
	 */
	public List<Integer> getIds() {
		return ids;
	}
	/**
	 * @param ids the ids to set
	 */
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	/**
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}
	/**
	 * @param sidx the sidx to set
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	/**
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}
	/**
	 * @param sord the sord to set
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}
	/**
	 * @return the showAll
	 */
	public String getShowAll() {
		return showAll;
	}
	/**
	 * @param showAll the showAll to set
	 */
	public void setShowAll(String showAll) {
		this.showAll = showAll;
	}
}
