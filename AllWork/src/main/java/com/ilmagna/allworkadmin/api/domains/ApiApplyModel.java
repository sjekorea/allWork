package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiApplyModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String to_type;				//지원종류 - email: 이메일 입사지원, online: 온라인 입사지원, mobile: 모바일 입사지원, interview:면접요청. 
	private String type;				//X -> 지원위치 - job
	private String sub_type;			//X -> 채용, 알바, 교육, 헤드 - company
	private String uid;					//구직자의 사용자 ID.
	private String to_uid;				//구인업체의 사용자 ID.
	private Integer from_no;			//이력서 ID
	private Integer to_no;				//채용정보 ID
	private String opened;				//X -> 면접확정 상태.
	private String job_detail;			//입사지원 또는 면접요청 내용.
	private String strWdate;			//입사지원일 또는 면접요청일.

	private String userName;			//구직자 이름.
	private String strSex;
	private String birth;				//생년월일.
	private String resumeTitle;			//이력서 제목.

	private String companyName;			//구인회사 이름.
	private String jobTitle;			//채용정보 제목.

	String apply_type;					//입사지원을 검색하는 경우.
	String fromDate, toDate;

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
	 * @return the to_type
	 */
	public String getTo_type() {
		return to_type;
	}
	/**
	 * @param to_type the to_type to set
	 */
	public void setTo_type(String to_type) {
		this.to_type = to_type;
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
	 * @return the sub_type
	 */
	public String getSub_type() {
		return sub_type;
	}
	/**
	 * @param sub_type the sub_type to set
	 */
	public void setSub_type(String sub_type) {
		this.sub_type = sub_type;
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
	 * @return the to_uid
	 */
	public String getTo_uid() {
		return to_uid;
	}
	/**
	 * @param to_uid the to_uid to set
	 */
	public void setTo_uid(String to_uid) {
		this.to_uid = to_uid;
	}
	/**
	 * @return the to_no
	 */
	public Integer getTo_no() {
		return to_no;
	}
	/**
	 * @param to_no the to_no to set
	 */
	public void setTo_no(Integer to_no) {
		this.to_no = to_no;
	}
	/**
	 * @return the from_no
	 */
	public Integer getFrom_no() {
		return from_no;
	}
	/**
	 * @param from_no the from_no to set
	 */
	public void setFrom_no(Integer from_no) {
		this.from_no = from_no;
	}
	/**
	 * @return the opened
	 */
	public String getOpened() {
		return opened;
	}
	/**
	 * @param opened the opened to set
	 */
	public void setOpened(String opened) {
		this.opened = opened;
	}
	/**
	 * @return the job_detail
	 */
	public String getJob_detail() {
		return job_detail;
	}
	/**
	 * @param job_detail the job_detail to set
	 */
	public void setJob_detail(String job_detail) {
		this.job_detail = job_detail;
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}
	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	 * @return the resumeTitle
	 */
	public String getResumeTitle() {
		return resumeTitle;
	}
	/**
	 * @param resumeTitle the resumeTitle to set
	 */
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	/**
	 * @return the jobTitle
	 */
	public String getJobTitle() {
		return jobTitle;
	}
	/**
	 * @param jobTitle the jobTitle to set
	 */
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	/**
	 * @return the apply_type
	 */
	public String getApply_type() {
		return apply_type;
	}
	/**
	 * @param apply_type the apply_type to set
	 */
	public void setApply_type(String apply_type) {
		this.apply_type = apply_type;
	}
	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}
	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}
	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
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
