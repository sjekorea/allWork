package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiSiteBasicModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private String email;					//e-mail 발송 주소.
	private String callCenter;				//고객센터 연락처.
	private String hphone;					//SMS 발송 휴대폰 번호.
	private String agreement;				//개인회원 이용약관.
	private String agreement3;				//기업회원 이용약관.
	private String privacy;					//개인정보취급방침.
	private String mobileService;			//모바일 서비스 안내.
	private String mobilePaymentGuide;		//모바일 유료 안내.
	private String locGuide;				//위치기반서비스 이용약관.

	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

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
	 * @return the callCenter
	 */
	public String getCallCenter() {
		return callCenter;
	}
	/**
	 * @param callCenter the callCenter to set
	 */
	public void setCallCenter(String callCenter) {
		this.callCenter = callCenter;
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
	 * @return the agreement
	 */
	public String getAgreement() {
		return agreement;
	}
	/**
	 * @param agreement the agreement to set
	 */
	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}
	/**
	 * @return the agreement3
	 */
	public String getAgreement3() {
		return agreement3;
	}
	/**
	 * @param agreement3 the agreement3 to set
	 */
	public void setAgreement3(String agreement3) {
		this.agreement3 = agreement3;
	}
	/**
	 * @return the privacy
	 */
	public String getPrivacy() {
		return privacy;
	}
	/**
	 * @param privacy the privacy to set
	 */
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	/**
	 * @return the mobileService
	 */
	public String getMobileService() {
		return mobileService;
	}
	/**
	 * @param mobileService the mobileService to set
	 */
	public void setMobileService(String mobileService) {
		this.mobileService = mobileService;
	}
	/**
	 * @return the mobilePaymentGuide
	 */
	public String getMobilePaymentGuide() {
		return mobilePaymentGuide;
	}
	/**
	 * @param mobilePaymentGuide the mobilePaymentGuide to set
	 */
	public void setMobilePaymentGuide(String mobilePaymentGuide) {
		this.mobilePaymentGuide = mobilePaymentGuide;
	}
	/**
	 * @return the locGuide
	 */
	public String getLocGuide() {
		return locGuide;
	}
	/**
	 * @param locGuide the locGuide to set
	 */
	public void setLocGuide(String locGuide) {
		this.locGuide = locGuide;
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
