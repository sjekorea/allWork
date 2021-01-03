package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;
import com.ilmagna.allworkadmin.migration.domains.ResumeCareerModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeEducationModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLanguageModel;
import com.ilmagna.allworkadmin.migration.domains.ResumeLicenseModel;

public class ApiResumeModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String uid;
	private Integer info_type;					//일반직, 알바, 프리랜서
	private String name;						//회원이름
	private String inid_photo;					//사진
	private String inid_hphone;					//연락처
	private String inid_email;
	private String inid_phone;
	private String strAddress;
	private String strAddressMini;
	private String inid_post;					//우편번호
	private String inid_address1;				//주소
	private String inid_address2;
	private String inid_home;					//홈페이지
	private String inid_title;					//이력서 제목
	private Integer indi_condition;				//현재상태 - 미취업, 취업중, 구직희망 안함.
	private String strArea;
	private String inid_area1;					//근무지역
	private String inid_area2;
	private String inid_area3;
	private String inid_area4;
	private String inid_area5;
	private String inid_area6;
	private String strBizType;
	private String inid_type1;					//직종
	private String inid_type2;
	private String inid_type3;
	private String inid_type4;
	private String inid_type5;
	private String inid_type6;
	private String inid_type7;
	private String inid_type8;
	private String inid_type9;
	private String inid_mylskill;				//보유기술
	private String strJobForm;
	private String inid_jobform;				//고용형태
	private String strPay;
	private String pay_type;					//급여종류.
	private String inid_pay;					//급여.
	private String inid_last_school;			//최종학력
	private String inid_career;					//경력.
	private String inid_license;				//자격증.
	private String inid_languages;				//외국어 능력.
	private String inid_introduce;				//자기소개서
	private String inid_secret;					//이력서 비공개.
	private String strSecret;
	private String strWdate;					//등록일
	private String strUwdate;
	private String strJwdate;
	private Integer hit;						//조회수.
	private String strService11;				//???
	private String strService12;
	private String strService13;
	private String strService14;
	private String strService15;
	private String strService16;
	private String strService17;
	private String strService101;
	private String strSex;
	private String inid_sex;					//성별
	private String sms_send;					//SMS 수신동의.
	private String a_insert;					//???
	private String memo;						//관리자 메모.
	
	private String education2;					//JSON 형식으로 변환된 최종학력
	private String career2;						//JSON 형식으로 변환된 경력.
	private String license2;					//JSON 형식으로 변환된 자격증.
	private String language2;					//JSON 형식으로 변환된 외국어 능력.

	private ResumeEducationModel modelEducation;
	private ResumeCareerModel modelCareer;
	private ResumeLicenseModel modelLicense;
	private ResumeLanguageModel modelLanguage;
	
	private String birth;						//생년월일.

	private String search_loc;					//검색조건 - 지역.
	private String search_biz_type;				//검색조건 - 직무.
	String fromDate, toDate;

	private ApiMemberModel member;
	private String company_uid;					//채용공고 등록현황을 검사하는 기업회원 사용자 ID.
	private Integer recruit_count;				//사용자가 등록한 채용공고 개수.

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
	 * @return the info_type
	 */
	public Integer getInfo_type() {
		return info_type;
	}
	/**
	 * @param info_type the info_type to set
	 */
	public void setInfo_type(Integer info_type) {
		this.info_type = info_type;
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
	 * @return the inid_photo
	 */
	public String getInid_photo() {
		return inid_photo;
	}
	/**
	 * @param inid_photo the inid_photo to set
	 */
	public void setInid_photo(String inid_photo) {
		this.inid_photo = inid_photo;
	}
	/**
	 * @return the inid_hphone
	 */
	public String getInid_hphone() {
		return inid_hphone;
	}
	/**
	 * @param inid_hphone the inid_hphone to set
	 */
	public void setInid_hphone(String inid_hphone) {
		this.inid_hphone = inid_hphone;
	}
	/**
	 * @return the inid_email
	 */
	public String getInid_email() {
		return inid_email;
	}
	/**
	 * @param inid_email the inid_email to set
	 */
	public void setInid_email(String inid_email) {
		this.inid_email = inid_email;
	}
	/**
	 * @return the inid_phone
	 */
	public String getInid_phone() {
		return inid_phone;
	}
	/**
	 * @param inid_phone the inid_phone to set
	 */
	public void setInid_phone(String inid_phone) {
		this.inid_phone = inid_phone;
	}
	/**
	 * @return the strAddress
	 */
	public String getStrAddress() {
		return strAddress;
	}
	/**
	 * @param strAddress the strAddress to set
	 */
	public void setStrAddress(String strAddress) {
		this.strAddress = strAddress;
	}
	/**
	 * @return the strAddressMini
	 */
	public String getStrAddressMini() {
		return strAddressMini;
	}
	/**
	 * @param strAddressMini the strAddressMini to set
	 */
	public void setStrAddressMini(String strAddressMini) {
		this.strAddressMini = strAddressMini;
	}
	/**
	 * @return the inid_post
	 */
	public String getInid_post() {
		return inid_post;
	}
	/**
	 * @param inid_post the inid_post to set
	 */
	public void setInid_post(String inid_post) {
		this.inid_post = inid_post;
	}
	/**
	 * @return the inid_address1
	 */
	public String getInid_address1() {
		return inid_address1;
	}
	/**
	 * @param inid_address1 the inid_address1 to set
	 */
	public void setInid_address1(String inid_address1) {
		this.inid_address1 = inid_address1;
	}
	/**
	 * @return the inid_address2
	 */
	public String getInid_address2() {
		return inid_address2;
	}
	/**
	 * @param inid_address2 the inid_address2 to set
	 */
	public void setInid_address2(String inid_address2) {
		this.inid_address2 = inid_address2;
	}
	/**
	 * @return the inid_home
	 */
	public String getInid_home() {
		return inid_home;
	}
	/**
	 * @param inid_home the inid_home to set
	 */
	public void setInid_home(String inid_home) {
		this.inid_home = inid_home;
	}
	/**
	 * @return the inid_title
	 */
	public String getInid_title() {
		return inid_title;
	}
	/**
	 * @param inid_title the inid_title to set
	 */
	public void setInid_title(String inid_title) {
		this.inid_title = inid_title;
	}
	/**
	 * @return the indi_condition
	 */
	public Integer getIndi_condition() {
		return indi_condition;
	}
	/**
	 * @param indi_condition the indi_condition to set
	 */
	public void setIndi_condition(Integer indi_condition) {
		this.indi_condition = indi_condition;
	}
	/**
	 * @return the strArea
	 */
	public String getStrArea() {
		return strArea;
	}
	/**
	 * @param strArea the strArea to set
	 */
	public void setStrArea(String strArea) {
		this.strArea = strArea;
	}
	/**
	 * @return the inid_area1
	 */
	public String getInid_area1() {
		return inid_area1;
	}
	/**
	 * @param inid_area1 the inid_area1 to set
	 */
	public void setInid_area1(String inid_area1) {
		this.inid_area1 = inid_area1;
	}
	/**
	 * @return the inid_area2
	 */
	public String getInid_area2() {
		return inid_area2;
	}
	/**
	 * @param inid_area2 the inid_area2 to set
	 */
	public void setInid_area2(String inid_area2) {
		this.inid_area2 = inid_area2;
	}
	/**
	 * @return the inid_area3
	 */
	public String getInid_area3() {
		return inid_area3;
	}
	/**
	 * @param inid_area3 the inid_area3 to set
	 */
	public void setInid_area3(String inid_area3) {
		this.inid_area3 = inid_area3;
	}
	/**
	 * @return the inid_area4
	 */
	public String getInid_area4() {
		return inid_area4;
	}
	/**
	 * @param inid_area4 the inid_area4 to set
	 */
	public void setInid_area4(String inid_area4) {
		this.inid_area4 = inid_area4;
	}
	/**
	 * @return the inid_area5
	 */
	public String getInid_area5() {
		return inid_area5;
	}
	/**
	 * @param inid_area5 the inid_area5 to set
	 */
	public void setInid_area5(String inid_area5) {
		this.inid_area5 = inid_area5;
	}
	/**
	 * @return the inid_area6
	 */
	public String getInid_area6() {
		return inid_area6;
	}
	/**
	 * @param inid_area6 the inid_area6 to set
	 */
	public void setInid_area6(String inid_area6) {
		this.inid_area6 = inid_area6;
	}
	/**
	 * @return the strBizType
	 */
	public String getStrBizType() {
		return strBizType;
	}
	/**
	 * @param strBizType the strBizType to set
	 */
	public void setStrBizType(String strBizType) {
		this.strBizType = strBizType;
	}
	/**
	 * @return the inid_type1
	 */
	public String getInid_type1() {
		return inid_type1;
	}
	/**
	 * @param inid_type1 the inid_type1 to set
	 */
	public void setInid_type1(String inid_type1) {
		this.inid_type1 = inid_type1;
	}
	/**
	 * @return the inid_type2
	 */
	public String getInid_type2() {
		return inid_type2;
	}
	/**
	 * @param inid_type2 the inid_type2 to set
	 */
	public void setInid_type2(String inid_type2) {
		this.inid_type2 = inid_type2;
	}
	/**
	 * @return the inid_type3
	 */
	public String getInid_type3() {
		return inid_type3;
	}
	/**
	 * @param inid_type3 the inid_type3 to set
	 */
	public void setInid_type3(String inid_type3) {
		this.inid_type3 = inid_type3;
	}
	/**
	 * @return the inid_type4
	 */
	public String getInid_type4() {
		return inid_type4;
	}
	/**
	 * @param inid_type4 the inid_type4 to set
	 */
	public void setInid_type4(String inid_type4) {
		this.inid_type4 = inid_type4;
	}
	/**
	 * @return the inid_type5
	 */
	public String getInid_type5() {
		return inid_type5;
	}
	/**
	 * @param inid_type5 the inid_type5 to set
	 */
	public void setInid_type5(String inid_type5) {
		this.inid_type5 = inid_type5;
	}
	/**
	 * @return the inid_type6
	 */
	public String getInid_type6() {
		return inid_type6;
	}
	/**
	 * @param inid_type6 the inid_type6 to set
	 */
	public void setInid_type6(String inid_type6) {
		this.inid_type6 = inid_type6;
	}
	/**
	 * @return the inid_type7
	 */
	public String getInid_type7() {
		return inid_type7;
	}
	/**
	 * @param inid_type7 the inid_type7 to set
	 */
	public void setInid_type7(String inid_type7) {
		this.inid_type7 = inid_type7;
	}
	/**
	 * @return the inid_type8
	 */
	public String getInid_type8() {
		return inid_type8;
	}
	/**
	 * @param inid_type8 the inid_type8 to set
	 */
	public void setInid_type8(String inid_type8) {
		this.inid_type8 = inid_type8;
	}
	/**
	 * @return the inid_type9
	 */
	public String getInid_type9() {
		return inid_type9;
	}
	/**
	 * @param inid_type9 the inid_type9 to set
	 */
	public void setInid_type9(String inid_type9) {
		this.inid_type9 = inid_type9;
	}
	/**
	 * @return the inid_mylskill
	 */
	public String getInid_mylskill() {
		return inid_mylskill;
	}
	/**
	 * @param inid_mylskill the inid_mylskill to set
	 */
	public void setInid_mylskill(String inid_mylskill) {
		this.inid_mylskill = inid_mylskill;
	}
	/**
	 * @return the strJobForm
	 */
	public String getStrJobForm() {
		return strJobForm;
	}
	/**
	 * @param strJobForm the strJobForm to set
	 */
	public void setStrJobForm(String strJobForm) {
		this.strJobForm = strJobForm;
	}
	/**
	 * @return the inid_jobform
	 */
	public String getInid_jobform() {
		return inid_jobform;
	}
	/**
	 * @param inid_jobform the inid_jobform to set
	 */
	public void setInid_jobform(String inid_jobform) {
		this.inid_jobform = inid_jobform;
	}
	/**
	 * @return the strPay
	 */
	public String getStrPay() {
		return strPay;
	}
	/**
	 * @param strPay the strPay to set
	 */
	public void setStrPay(String strPay) {
		this.strPay = strPay;
	}
	/**
	 * @return the pay_type
	 */
	public String getPay_type() {
		return pay_type;
	}
	/**
	 * @param pay_type the pay_type to set
	 */
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	/**
	 * @return the inid_pay
	 */
	public String getInid_pay() {
		return inid_pay;
	}
	/**
	 * @param inid_pay the inid_pay to set
	 */
	public void setInid_pay(String inid_pay) {
		this.inid_pay = inid_pay;
	}
	/**
	 * @return the inid_last_school
	 */
	public String getInid_last_school() {
		return inid_last_school;
	}
	/**
	 * @param inid_last_school the inid_last_school to set
	 */
	public void setInid_last_school(String inid_last_school) {
		this.inid_last_school = inid_last_school;
	}
	/**
	 * @return the inid_career
	 */
	public String getInid_career() {
		return inid_career;
	}
	/**
	 * @param inid_career the inid_career to set
	 */
	public void setInid_career(String inid_career) {
		this.inid_career = inid_career;
	}
	/**
	 * @return the inid_license
	 */
	public String getInid_license() {
		return inid_license;
	}
	/**
	 * @param inid_license the inid_license to set
	 */
	public void setInid_license(String inid_license) {
		this.inid_license = inid_license;
	}
	/**
	 * @return the inid_languages
	 */
	public String getInid_languages() {
		return inid_languages;
	}
	/**
	 * @param inid_languages the inid_languages to set
	 */
	public void setInid_languages(String inid_languages) {
		this.inid_languages = inid_languages;
	}
	/**
	 * @return the inid_introduce
	 */
	public String getInid_introduce() {
		return inid_introduce;
	}
	/**
	 * @param inid_introduce the inid_introduce to set
	 */
	public void setInid_introduce(String inid_introduce) {
		this.inid_introduce = inid_introduce;
	}
	/**
	 * @return the inid_secret
	 */
	public String getInid_secret() {
		return inid_secret;
	}
	/**
	 * @param inid_secret the inid_secret to set
	 */
	public void setInid_secret(String inid_secret) {
		this.inid_secret = inid_secret;
	}
	/**
	 * @return the strSecret
	 */
	public String getStrSecret() {
		return strSecret;
	}
	/**
	 * @param strSecret the strSecret to set
	 */
	public void setStrSecret(String strSecret) {
		this.strSecret = strSecret;
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
	 * @return the strUwdate
	 */
	public String getStrUwdate() {
		return strUwdate;
	}
	/**
	 * @param strUwdate the strUwdate to set
	 */
	public void setStrUwdate(String strUwdate) {
		this.strUwdate = strUwdate;
	}
	/**
	 * @return the strJwdate
	 */
	public String getStrJwdate() {
		return strJwdate;
	}
	/**
	 * @param strJwdate the strJwdate to set
	 */
	public void setStrJwdate(String strJwdate) {
		this.strJwdate = strJwdate;
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
	 * @return the strService11
	 */
	public String getStrService11() {
		return strService11;
	}
	/**
	 * @param strService11 the strService11 to set
	 */
	public void setStrService11(String strService11) {
		this.strService11 = strService11;
	}
	/**
	 * @return the strService12
	 */
	public String getStrService12() {
		return strService12;
	}
	/**
	 * @param strService12 the strService12 to set
	 */
	public void setStrService12(String strService12) {
		this.strService12 = strService12;
	}
	/**
	 * @return the strService13
	 */
	public String getStrService13() {
		return strService13;
	}
	/**
	 * @param strService13 the strService13 to set
	 */
	public void setStrService13(String strService13) {
		this.strService13 = strService13;
	}
	/**
	 * @return the strService14
	 */
	public String getStrService14() {
		return strService14;
	}
	/**
	 * @param strService14 the strService14 to set
	 */
	public void setStrService14(String strService14) {
		this.strService14 = strService14;
	}
	/**
	 * @return the strService15
	 */
	public String getStrService15() {
		return strService15;
	}
	/**
	 * @param strService15 the strService15 to set
	 */
	public void setStrService15(String strService15) {
		this.strService15 = strService15;
	}
	/**
	 * @return the strService16
	 */
	public String getStrService16() {
		return strService16;
	}
	/**
	 * @param strService16 the strService16 to set
	 */
	public void setStrService16(String strService16) {
		this.strService16 = strService16;
	}
	/**
	 * @return the strService17
	 */
	public String getStrService17() {
		return strService17;
	}
	/**
	 * @param strService17 the strService17 to set
	 */
	public void setStrService17(String strService17) {
		this.strService17 = strService17;
	}
	/**
	 * @return the strService101
	 */
	public String getStrService101() {
		return strService101;
	}
	/**
	 * @param strService101 the strService101 to set
	 */
	public void setStrService101(String strService101) {
		this.strService101 = strService101;
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
	 * @return the inid_sex
	 */
	public String getInid_sex() {
		return inid_sex;
	}
	/**
	 * @param inid_sex the inid_sex to set
	 */
	public void setInid_sex(String inid_sex) {
		this.inid_sex = inid_sex;
	}
	/**
	 * @return the sms_send
	 */
	public String getSms_send() {
		return sms_send;
	}
	/**
	 * @param sms_send the sms_send to set
	 */
	public void setSms_send(String sms_send) {
		this.sms_send = sms_send;
	}
	/**
	 * @return the a_insert
	 */
	public String getA_insert() {
		return a_insert;
	}
	/**
	 * @param a_insert the a_insert to set
	 */
	public void setA_insert(String a_insert) {
		this.a_insert = a_insert;
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
	 * @return the education2
	 */
	public String getEducation2() {
		return education2;
	}
	/**
	 * @param education2 the education2 to set
	 */
	public void setEducation2(String education2) {
		this.education2 = education2;
	}
	/**
	 * @return the career2
	 */
	public String getCareer2() {
		return career2;
	}
	/**
	 * @param career2 the career2 to set
	 */
	public void setCareer2(String career2) {
		this.career2 = career2;
	}
	/**
	 * @return the license2
	 */
	public String getLicense2() {
		return license2;
	}
	/**
	 * @param license2 the license2 to set
	 */
	public void setLicense2(String license2) {
		this.license2 = license2;
	}
	/**
	 * @return the language2
	 */
	public String getLanguage2() {
		return language2;
	}
	/**
	 * @param language2 the language2 to set
	 */
	public void setLanguage2(String language2) {
		this.language2 = language2;
	}
	/**
	 * @return the modelEducation
	 */
	public ResumeEducationModel getModelEducation() {
		return modelEducation;
	}
	/**
	 * @param modelEducation the modelEducation to set
	 */
	public void setModelEducation(ResumeEducationModel modelEducation) {
		this.modelEducation = modelEducation;
	}
	/**
	 * @return the modelCareer
	 */
	public ResumeCareerModel getModelCareer() {
		return modelCareer;
	}
	/**
	 * @param modelCareer the modelCareer to set
	 */
	public void setModelCareer(ResumeCareerModel modelCareer) {
		this.modelCareer = modelCareer;
	}
	/**
	 * @return the modelLicense
	 */
	public ResumeLicenseModel getModelLicense() {
		return modelLicense;
	}
	/**
	 * @param modelLicense the modelLicense to set
	 */
	public void setModelLicense(ResumeLicenseModel modelLicense) {
		this.modelLicense = modelLicense;
	}
	/**
	 * @return the modelLanguage
	 */
	public ResumeLanguageModel getModelLanguage() {
		return modelLanguage;
	}
	/**
	 * @param modelLanguage the modelLanguage to set
	 */
	public void setModelLanguage(ResumeLanguageModel modelLanguage) {
		this.modelLanguage = modelLanguage;
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
	 * @return the search_loc
	 */
	public String getSearch_loc() {
		return search_loc;
	}
	/**
	 * @param search_loc the search_loc to set
	 */
	public void setSearch_loc(String search_loc) {
		this.search_loc = search_loc;
	}
	/**
	 * @return the search_biz_type
	 */
	public String getSearch_biz_type() {
		return search_biz_type;
	}
	/**
	 * @param search_biz_type the search_biz_type to set
	 */
	public void setSearch_biz_type(String search_biz_type) {
		this.search_biz_type = search_biz_type;
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
	 * @return the member
	 */
	public ApiMemberModel getMember() {
		return member;
	}
	/**
	 * @param member the member to set
	 */
	public void setMember(ApiMemberModel member) {
		this.member = member;
	}
	/**
	 * @return the company_uid
	 */
	public String getCompany_uid() {
		return company_uid;
	}
	/**
	 * @param company_uid the company_uid to set
	 */
	public void setCompany_uid(String company_uid) {
		this.company_uid = company_uid;
	}
	/**
	 * @return the recruit_count
	 */
	public Integer getRecruit_count() {
		return recruit_count;
	}
	/**
	 * @param recruit_count the recruit_count to set
	 */
	public void setRecruit_count(Integer recruit_count) {
		this.recruit_count = recruit_count;
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
