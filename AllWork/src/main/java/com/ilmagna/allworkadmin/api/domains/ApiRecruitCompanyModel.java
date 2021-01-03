package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecruitCompanyModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String strReg;
	private String prs;
	private String company_title;
	private String company_initial;
	private String contact_point;
	private String phone;
	private String email;
	private String business_type;
	private String whereis;
	private String strRegDate;
	private Integer order_view;
	private String memo;

	private String loc;
	private String jobForm;

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
	 * @return the strReg
	 */
	public String getStrReg() {
		return strReg;
	}
	/**
	 * @param strReg the strReg to set
	 */
	public void setStrReg(String strReg) {
		this.strReg = strReg;
	}
	/**
	 * @return the prs
	 */
	public String getPrs() {
		return prs;
	}
	/**
	 * @param prs the prs to set
	 */
	public void setPrs(String prs) {
		this.prs = prs;
	}
	/**
	 * @return the company_title
	 */
	public String getCompany_title() {
		return company_title;
	}
	/**
	 * @param company_title the company_title to set
	 */
	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}
	/**
	 * @return the company_initial
	 */
	public String getCompany_initial() {
		return company_initial;
	}
	/**
	 * @param company_initial the company_initial to set
	 */
	public void setCompany_initial(String company_initial) {
		this.company_initial = company_initial;
	}
	/**
	 * @return the contact_point
	 */
	public String getContact_point() {
		return contact_point;
	}
	/**
	 * @param contact_point the contact_point to set
	 */
	public void setContact_point(String contact_point) {
		this.contact_point = contact_point;
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
	 * @return the business_type
	 */
	public String getBusiness_type() {
		return business_type;
	}
	/**
	 * @param business_type the business_type to set
	 */
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	/**
	 * @return the whereis
	 */
	public String getWhereis() {
		return whereis;
	}
	/**
	 * @param whereis the whereis to set
	 */
	public void setWhereis(String whereis) {
		this.whereis = whereis;
	}
	/**
	 * @return the strRegDate
	 */
	public String getStrRegDate() {
		return strRegDate;
	}
	/**
	 * @param strRegDate the strRegDate to set
	 */
	public void setStrRegDate(String strRegDate) {
		this.strRegDate = strRegDate;
	}
	/**
	 * @return the order_view
	 */
	public Integer getOrder_view() {
		return order_view;
	}
	/**
	 * @param order_view the order_view to set
	 */
	public void setOrder_view(Integer order_view) {
		this.order_view = order_view;
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
	 * @return the loc
	 */
	public String getLoc() {
		return loc;
	}
	/**
	 * @param loc the loc to set
	 */
	public void setLoc(String loc) {
		this.loc = loc;
	}
	/**
	 * @return the jobForm
	 */
	public String getJobForm() {
		return jobForm;
	}
	/**
	 * @param jobForm the jobForm to set
	 */
	public void setJobForm(String jobForm) {
		this.jobForm = jobForm;
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
