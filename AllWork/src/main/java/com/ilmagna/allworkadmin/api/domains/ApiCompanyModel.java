package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiCompanyModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String uid;						// 기업에 대한 사용자 UID
	private String biz_no;					// 사업자번호.
	private String strBizCopY;				// 법인/개인사업자 구분.
	private String biz_copy;
	private String biz_name;				// 기업명
	private String biz_recharger;			// 대표자
	private String biz_subject;				// 사업내용
	private String biz_fonundation;			// 설립일
	private String biz_men;					// 인원수
	private String strBizList;				// 상장/비상장,기타
	private String biz_list;
	private String strBizForm;				// 기업형태
	private String biz_form;
	private String strCategory;				// 직종
	private String biz_category;
	private String biz_capital;				// 자본금
	private String biz_selling;				// 매출액
	private String biz_vision;				// 비전
	private String biz_history;				// 연혁
	private String biz_phone;				// 연락처
	private String biz_fax;					// FAX
	private String biz_post;				// 우편번호
	private String biz_address1;			// 주소
	private String biz_address2;
	private String biz_email;				// e-mail
	private String biz_home;				// 홈페이지
	private String biz_logo;				// Logo
	private String photo1;					// 사진
	private String photo2;
	private String photo3;
	private String photo4;
	private String biz_manager;				//채용담당자.
	private String manager;					//X->???
	private Integer admit;
	private String order_view;
	private String strKind;
	private String kind;
	private String memo;

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
	 * @return the biz_no
	 */
	public String getBiz_no() {
		return biz_no;
	}
	/**
	 * @param biz_no the biz_no to set
	 */
	public void setBiz_no(String biz_no) {
		this.biz_no = biz_no;
	}
	/**
	 * @return the strBizCopY
	 */
	public String getStrBizCopY() {
		return strBizCopY;
	}
	/**
	 * @param strBizCopY the strBizCopY to set
	 */
	public void setStrBizCopY(String strBizCopY) {
		this.strBizCopY = strBizCopY;
	}
	/**
	 * @return the biz_copy
	 */
	public String getBiz_copy() {
		return biz_copy;
	}
	/**
	 * @param biz_copy the biz_copy to set
	 */
	public void setBiz_copy(String biz_copy) {
		this.biz_copy = biz_copy;
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
	 * @return the biz_recharger
	 */
	public String getBiz_recharger() {
		return biz_recharger;
	}
	/**
	 * @param biz_recharger the biz_recharger to set
	 */
	public void setBiz_recharger(String biz_recharger) {
		this.biz_recharger = biz_recharger;
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
	 * @return the biz_fonundation
	 */
	public String getBiz_fonundation() {
		return biz_fonundation;
	}
	/**
	 * @param biz_fonundation the biz_fonundation to set
	 */
	public void setBiz_fonundation(String biz_fonundation) {
		this.biz_fonundation = biz_fonundation;
	}
	/**
	 * @return the biz_men
	 */
	public String getBiz_men() {
		return biz_men;
	}
	/**
	 * @param biz_men the biz_men to set
	 */
	public void setBiz_men(String biz_men) {
		this.biz_men = biz_men;
	}
	/**
	 * @return the strBizList
	 */
	public String getStrBizList() {
		return strBizList;
	}
	/**
	 * @param strBizList the strBizList to set
	 */
	public void setStrBizList(String strBizList) {
		this.strBizList = strBizList;
	}
	/**
	 * @return the biz_list
	 */
	public String getBiz_list() {
		return biz_list;
	}
	/**
	 * @param biz_list the biz_list to set
	 */
	public void setBiz_list(String biz_list) {
		this.biz_list = biz_list;
	}
	/**
	 * @return the strBizForm
	 */
	public String getStrBizForm() {
		return strBizForm;
	}
	/**
	 * @param strBizForm the strBizForm to set
	 */
	public void setStrBizForm(String strBizForm) {
		this.strBizForm = strBizForm;
	}
	/**
	 * @return the biz_form
	 */
	public String getBiz_form() {
		return biz_form;
	}
	/**
	 * @param biz_form the biz_form to set
	 */
	public void setBiz_form(String biz_form) {
		this.biz_form = biz_form;
	}
	/**
	 * @return the strCategory
	 */
	public String getStrCategory() {
		return strCategory;
	}
	/**
	 * @param strCategory the strCategory to set
	 */
	public void setStrCategory(String strCategory) {
		this.strCategory = strCategory;
	}
	/**
	 * @return the biz_category
	 */
	public String getBiz_category() {
		return biz_category;
	}
	/**
	 * @param biz_category the biz_category to set
	 */
	public void setBiz_category(String biz_category) {
		this.biz_category = biz_category;
	}
	/**
	 * @return the biz_capital
	 */
	public String getBiz_capital() {
		return biz_capital;
	}
	/**
	 * @param biz_capital the biz_capital to set
	 */
	public void setBiz_capital(String biz_capital) {
		this.biz_capital = biz_capital;
	}
	/**
	 * @return the biz_selling
	 */
	public String getBiz_selling() {
		return biz_selling;
	}
	/**
	 * @param biz_selling the biz_selling to set
	 */
	public void setBiz_selling(String biz_selling) {
		this.biz_selling = biz_selling;
	}
	/**
	 * @return the biz_vision
	 */
	public String getBiz_vision() {
		return biz_vision;
	}
	/**
	 * @param biz_vision the biz_vision to set
	 */
	public void setBiz_vision(String biz_vision) {
		this.biz_vision = biz_vision;
	}
	/**
	 * @return the biz_history
	 */
	public String getBiz_history() {
		return biz_history;
	}
	/**
	 * @param biz_history the biz_history to set
	 */
	public void setBiz_history(String biz_history) {
		this.biz_history = biz_history;
	}
	/**
	 * @return the biz_phone
	 */
	public String getBiz_phone() {
		return biz_phone;
	}
	/**
	 * @param biz_phone the biz_phone to set
	 */
	public void setBiz_phone(String biz_phone) {
		this.biz_phone = biz_phone;
	}
	/**
	 * @return the biz_fax
	 */
	public String getBiz_fax() {
		return biz_fax;
	}
	/**
	 * @param biz_fax the biz_fax to set
	 */
	public void setBiz_fax(String biz_fax) {
		this.biz_fax = biz_fax;
	}
	/**
	 * @return the biz_post
	 */
	public String getBiz_post() {
		return biz_post;
	}
	/**
	 * @param biz_post the biz_post to set
	 */
	public void setBiz_post(String biz_post) {
		this.biz_post = biz_post;
	}
	/**
	 * @return the biz_address1
	 */
	public String getBiz_address1() {
		return biz_address1;
	}
	/**
	 * @param biz_address1 the biz_address1 to set
	 */
	public void setBiz_address1(String biz_address1) {
		this.biz_address1 = biz_address1;
	}
	/**
	 * @return the biz_address2
	 */
	public String getBiz_address2() {
		return biz_address2;
	}
	/**
	 * @param biz_address2 the biz_address2 to set
	 */
	public void setBiz_address2(String biz_address2) {
		this.biz_address2 = biz_address2;
	}
	/**
	 * @return the biz_email
	 */
	public String getBiz_email() {
		return biz_email;
	}
	/**
	 * @param biz_email the biz_email to set
	 */
	public void setBiz_email(String biz_email) {
		this.biz_email = biz_email;
	}
	/**
	 * @return the biz_home
	 */
	public String getBiz_home() {
		return biz_home;
	}
	/**
	 * @param biz_home the biz_home to set
	 */
	public void setBiz_home(String biz_home) {
		this.biz_home = biz_home;
	}
	/**
	 * @return the biz_logo
	 */
	public String getBiz_logo() {
		return biz_logo;
	}
	/**
	 * @param biz_logo the biz_logo to set
	 */
	public void setBiz_logo(String biz_logo) {
		this.biz_logo = biz_logo;
	}
	/**
	 * @return the photo1
	 */
	public String getPhoto1() {
		return photo1;
	}
	/**
	 * @param photo1 the photo1 to set
	 */
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	/**
	 * @return the photo2
	 */
	public String getPhoto2() {
		return photo2;
	}
	/**
	 * @param photo2 the photo2 to set
	 */
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	/**
	 * @return the photo3
	 */
	public String getPhoto3() {
		return photo3;
	}
	/**
	 * @param photo3 the photo3 to set
	 */
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	/**
	 * @return the photo4
	 */
	public String getPhoto4() {
		return photo4;
	}
	/**
	 * @param photo4 the photo4 to set
	 */
	public void setPhoto4(String photo4) {
		this.photo4 = photo4;
	}
	/**
	 * @return the biz_manager
	 */
	public String getBiz_manager() {
		return biz_manager;
	}
	/**
	 * @param biz_manager the biz_manager to set
	 */
	public void setBiz_manager(String biz_manager) {
		this.biz_manager = biz_manager;
	}
	/**
	 * @return the manager
	 */
	public String getManager() {
		return manager;
	}
	/**
	 * @param manager the manager to set
	 */
	public void setManager(String manager) {
		this.manager = manager;
	}
	/**
	 * @return the admit
	 */
	public Integer getAdmit() {
		return admit;
	}
	/**
	 * @param admit the admit to set
	 */
	public void setAdmit(Integer admit) {
		this.admit = admit;
	}
	/**
	 * @return the order_view
	 */
	public String getOrder_view() {
		return order_view;
	}
	/**
	 * @param order_view the order_view to set
	 */
	public void setOrder_view(String order_view) {
		this.order_view = order_view;
	}
	/**
	 * @return the strKind
	 */
	public String getStrKind() {
		return strKind;
	}
	/**
	 * @param strKind the strKind to set
	 */
	public void setStrKind(String strKind) {
		this.strKind = strKind;
	}
	/**
	 * @return the kind
	 */
	public String getKind() {
		return kind;
	}
	/**
	 * @param kind the kind to set
	 */
	public void setKind(String kind) {
		this.kind = kind;
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
