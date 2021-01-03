package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecruitOtherModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String strReg;						//최종갱신시각.
	private String prs;							//삭제상태.
	private String strBeg;						//데이터 등록일.
	private String company_title;				//회사명.
	private String phone;						//연락처.
	private String recruit_item;				//구인제목.
	private String whereis;						//근무처.
	private String job_type;					//직종 - 관련내용.
	private String men;							//채용인원.
	private String strWdate;					//워크넷 등록일.
	private String edate;						//채용 마감일
	private String strEdate;					//채용 마감일
	private Integer order_view;					//???
	private String memo;						//관리자 의견.
	private String wantedAuthNo;				//워크넷 키.
	private String salary;						//급여.
	private String preference;					//우대조건.

	String fromWDate, toWDate;
	String fromEDate, toEDate;
	String regDate;
	
	private Integer totalCount;
	private Integer procCount;
	private boolean isEndOfProc;
	
	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;


	public ApiRecruitOtherModel() {
		this.prs = "Y";
		this.company_title = "";				//회사명.
		this.phone = "";						//연락처.
		this.recruit_item = "";					//구인제목.
		this.whereis = "";						//근무처.
		this.job_type = "";						//직종 - 관련내용.
		this.men = "";							//채용인원.
		this.strWdate = "";						//워크넷 등록일.
		this.strEdate = "";						//채용 마감일
		this.order_view = 128;					//???
		this.memo = "";							//관리자 의견.
		this.wantedAuthNo = "";					//워크넷 키.
		this.salary = "";						//급여.
		this.preference = "";					//우대조건.
	}
	
	
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
	 * @return the strBeg
	 */
	public String getStrBeg() {
		return strBeg;
	}
	/**
	 * @param strBeg the strBeg to set
	 */
	public void setStrBeg(String strBeg) {
		this.strBeg = strBeg;
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
	 * @return the recruit_item
	 */
	public String getRecruit_item() {
		return recruit_item;
	}
	/**
	 * @param recruit_item the recruit_item to set
	 */
	public void setRecruit_item(String recruit_item) {
		this.recruit_item = recruit_item;
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
	 * @return the job_type
	 */
	public String getJob_type() {
		return job_type;
	}
	/**
	 * @param job_type the job_type to set
	 */
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	/**
	 * @return the men
	 */
	public String getMen() {
		return men;
	}
	/**
	 * @param men the men to set
	 */
	public void setMen(String men) {
		this.men = men;
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
	 * @return the edate
	 */
	public String getEdate() {
		return edate;
	}
	/**
	 * @param edate the edate to set
	 */
	public void setEdate(String edate) {
		this.edate = edate;
	}
	/**
	 * @return the strEdate
	 */
	public String getStrEdate() {
		return strEdate;
	}
	/**
	 * @param strEdate the strEdate to set
	 */
	public void setStrEdate(String strEdate) {
		this.strEdate = strEdate;
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
	 * @return the wantedAuthNo
	 */
	public String getWantedAuthNo() {
		return wantedAuthNo;
	}
	/**
	 * @param wantedAuthNo the wantedAuthNo to set
	 */
	public void setWantedAuthNo(String wantedAuthNo) {
		this.wantedAuthNo = wantedAuthNo;
	}
	/**
	 * @return the salary
	 */
	public String getSalary() {
		return salary;
	}
	/**
	 * @param salary the salary to set
	 */
	public void setSalary(String salary) {
		this.salary = salary;
	}
	/**
	 * @return the preference
	 */
	public String getPreference() {
		return preference;
	}
	/**
	 * @param preference the preference to set
	 */
	public void setPreference(String preference) {
		this.preference = preference;
	}
	/**
	 * @return the fromWDate
	 */
	public String getFromWDate() {
		return fromWDate;
	}
	/**
	 * @param fromWDate the fromWDate to set
	 */
	public void setFromWDate(String fromWDate) {
		this.fromWDate = fromWDate;
	}
	/**
	 * @return the toWDate
	 */
	public String getToWDate() {
		return toWDate;
	}
	/**
	 * @param toWDate the toWDate to set
	 */
	public void setToWDate(String toWDate) {
		this.toWDate = toWDate;
	}
	/**
	 * @return the fromEDate
	 */
	public String getFromEDate() {
		return fromEDate;
	}
	/**
	 * @param fromEDate the fromEDate to set
	 */
	public void setFromEDate(String fromEDate) {
		this.fromEDate = fromEDate;
	}
	/**
	 * @return the toEDate
	 */
	public String getToEDate() {
		return toEDate;
	}
	/**
	 * @param toEDate the toEDate to set
	 */
	public void setToEDate(String toEDate) {
		this.toEDate = toEDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	/**
	 * @return the totalCount
	 */
	public Integer getTotalCount() {
		return totalCount;
	}
	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	/**
	 * @return the procCount
	 */
	public Integer getProcCount() {
		return procCount;
	}
	/**
	 * @param procCount the procCount to set
	 */
	public void setProcCount(Integer procCount) {
		this.procCount = procCount;
	}
	
	/**
	 * @return the isEndOfProc
	 */
	public boolean isEndOfProc() {
		return isEndOfProc;
	}
	/**
	 * @param isEndOfProc the isEndOfProc to set
	 */
	public void setEndOfProc(boolean isEndOfProc) {
		this.isEndOfProc = isEndOfProc;
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
