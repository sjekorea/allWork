package com.ilmagna.allworkadmin.admin.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class AdminBbsVocModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String uid;				//질문자 UID
	private String name;			//질문자 이름
	private String email;			//질문자 email
	private String phone;			//질문자 전화번호
	private String site;			//X
	private String subject;			//질문 제목.
	private String content;			//질문 내용.
	private String strWdate;		//문의일.

	private String cate;			//X
	private String strAdate;		//답변일.
	private String a_name;			//답변자 이름.
	private String a_subject;		//답변 제목.
	private String a_content;		//답변 내용.

	private String type;
	private String biz_name;
	private String biz_subject;

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
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the site
	 */
	public String getSite() {
		return site;
	}
	/**
	 * @param site the site to set
	 */
	public void setSite(String site) {
		this.site = site;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
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
	 * @return the cate
	 */
	public String getCate() {
		return cate;
	}
	/**
	 * @param cate the cate to set
	 */
	public void setCate(String cate) {
		this.cate = cate;
	}
	/**
	 * @return the strAdate
	 */
	public String getStrAdate() {
		return strAdate;
	}
	/**
	 * @param strAdate the strAdate to set
	 */
	public void setStrAdate(String strAdate) {
		this.strAdate = strAdate;
	}
	/**
	 * @return the a_name
	 */
	public String getA_name() {
		return a_name;
	}
	/**
	 * @param a_name the a_name to set
	 */
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	/**
	 * @return the a_subject
	 */
	public String getA_subject() {
		return a_subject;
	}
	/**
	 * @param a_subject the a_subject to set
	 */
	public void setA_subject(String a_subject) {
		this.a_subject = a_subject;
	}
	/**
	 * @return the a_content
	 */
	public String getA_content() {
		return a_content;
	}
	/**
	 * @param a_content the a_content to set
	 */
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the biz_name
	 */
	public String getBiz_name() {
		return biz_name;
	}
	/**
	 * @param biz_name the biz_name to set
	 */
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	/**
	 * @return the biz_subject
	 */
	public String getBiz_subject() {
		return biz_subject;
	}
	/**
	 * @param biz_subject the biz_subject to set
	 */
	public void setBiz_subject(String biz_subject) {
		this.biz_subject = biz_subject;
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
