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
	private Integer infoType;					//일반직, 알바, 프리랜서
	private String name;						//회원이름
	private String inidPhoto;					//사진
	private String inidHphone;					//연락처
	private String inidEmail;
	private String inidPhone;
	private String strAddress;
	private String strAddressMini;
	private String inidPost;					//우편번호
	private String inidAddress1;				//주소
	private String inidAddress2;
	private String inidHome;					//홈페이지
	private String inidTitle;					//이력서 제목
	private Integer indiCondition;				//현재상태 - 미취업, 취업중, 구직희망 안함.
	private String strArea;
	private String inidArea1;					//근무지역
	private String inidArea2;
	private String inidArea3;
	private String inidArea4;
	private String inidArea5;
	private String inidArea6;
	private String strBizType;
	private String inidType1;					//직종
	private String inidType2;
	private String inidType3;
	private String inidType4;
	private String inidType5;
	private String inidType6;
	private String inidType7;
	private String inidType8;
	private String inidType9;
	private String inidMylskill;				//보유기술
	private String strJobForm;
	private String inidJobform;					//고용형태
	private String strPay;
	private String payType;						//급여종류.
	private String inidPay;						//급여.
	private String inidLastSchool;				//최종학력
	private String inidCareer;					//경력.
	private String inidLicense;					//자격증.
	private String inidLanguages;				//외국어 능력.
	private String inidIntroduce;				//자기소개서
	private String inidSecret;					//이력서 비공개.
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
	private String inidSex;						//성별
	private String smsSend;						//SMS 수신동의.
	private String aInsert;						//???
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

	private String searchLoc;					//검색조건 - 지역.
	private String searchBizType;				//검색조건 - 직무.
	String fromDate, toDate;

	private ApiMemberModel member;
	private String companyUid;					//채용공고 등록현황을 검사하는 기업회원 사용자 ID.
	private Integer recruitCount;				//사용자가 등록한 채용공고 개수.

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
	 * @return the infoType
	 */
	public Integer getInfoType() {
		return infoType;
	}
	/**
	 * @param infoType the infoType to set
	 */
	public void setInfoType(Integer infoType) {
		this.infoType = infoType;
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
	 * @return the inidPhoto
	 */
	public String getInidPhoto() {
		return inidPhoto;
	}
	/**
	 * @param inidPhoto the inidPhoto to set
	 */
	public void setInidPhoto(String inidPhoto) {
		this.inidPhoto = inidPhoto;
	}
	/**
	 * @return the inidHphone
	 */
	public String getInidHphone() {
		return inidHphone;
	}
	/**
	 * @param inidHphone the inidHphone to set
	 */
	public void setInidHphone(String inidHphone) {
		this.inidHphone = inidHphone;
	}
	/**
	 * @return the inidEmail
	 */
	public String getInidEmail() {
		return inidEmail;
	}
	/**
	 * @param inidEmail the inidEmail to set
	 */
	public void setInidEmail(String inidEmail) {
		this.inidEmail = inidEmail;
	}
	/**
	 * @return the inidPhone
	 */
	public String getInidPhone() {
		return inidPhone;
	}
	/**
	 * @param inidPhone the inidPhone to set
	 */
	public void setInidPhone(String inidPhone) {
		this.inidPhone = inidPhone;
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
	 * @return the inidPost
	 */
	public String getInidPost() {
		return inidPost;
	}
	/**
	 * @param inidPost the inidPost to set
	 */
	public void setInidPost(String inidPost) {
		this.inidPost = inidPost;
	}
	/**
	 * @return the inidAddress1
	 */
	public String getInidAddress1() {
		return inidAddress1;
	}
	/**
	 * @param inidAddress1 the inidAddress1 to set
	 */
	public void setInidAddress1(String inidAddress1) {
		this.inidAddress1 = inidAddress1;
	}
	/**
	 * @return the inidAddress2
	 */
	public String getInidAddress2() {
		return inidAddress2;
	}
	/**
	 * @param inidAddress2 the inidAddress2 to set
	 */
	public void setInidAddress2(String inidAddress2) {
		this.inidAddress2 = inidAddress2;
	}
	/**
	 * @return the inidHome
	 */
	public String getInidHome() {
		return inidHome;
	}
	/**
	 * @param inidHome the inidHome to set
	 */
	public void setInidHome(String inidHome) {
		this.inidHome = inidHome;
	}
	/**
	 * @return the inidTitle
	 */
	public String getInidTitle() {
		return inidTitle;
	}
	/**
	 * @param inidTitle the inidTitle to set
	 */
	public void setInidTitle(String inidTitle) {
		this.inidTitle = inidTitle;
	}
	/**
	 * @return the indiCondition
	 */
	public Integer getIndiCondition() {
		return indiCondition;
	}
	/**
	 * @param indiCondition the indiCondition to set
	 */
	public void setIndiCondition(Integer indiCondition) {
		this.indiCondition = indiCondition;
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
	 * @return the inidArea1
	 */
	public String getInidArea1() {
		return inidArea1;
	}
	/**
	 * @param inidArea1 the inidArea1 to set
	 */
	public void setInidArea1(String inidArea1) {
		this.inidArea1 = inidArea1;
	}
	/**
	 * @return the inidArea2
	 */
	public String getInidArea2() {
		return inidArea2;
	}
	/**
	 * @param inidArea2 the inidArea2 to set
	 */
	public void setInidArea2(String inidArea2) {
		this.inidArea2 = inidArea2;
	}
	/**
	 * @return the inidArea3
	 */
	public String getInidArea3() {
		return inidArea3;
	}
	/**
	 * @param inidArea3 the inidArea3 to set
	 */
	public void setInidArea3(String inidArea3) {
		this.inidArea3 = inidArea3;
	}
	/**
	 * @return the inidArea4
	 */
	public String getInidArea4() {
		return inidArea4;
	}
	/**
	 * @param inidArea4 the inidArea4 to set
	 */
	public void setInidArea4(String inidArea4) {
		this.inidArea4 = inidArea4;
	}
	/**
	 * @return the inidArea5
	 */
	public String getInidArea5() {
		return inidArea5;
	}
	/**
	 * @param inidArea5 the inidArea5 to set
	 */
	public void setInidArea5(String inidArea5) {
		this.inidArea5 = inidArea5;
	}
	/**
	 * @return the inidArea6
	 */
	public String getInidArea6() {
		return inidArea6;
	}
	/**
	 * @param inidArea6 the inidArea6 to set
	 */
	public void setInidArea6(String inidArea6) {
		this.inidArea6 = inidArea6;
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
	 * @return the inidType1
	 */
	public String getInidType1() {
		return inidType1;
	}
	/**
	 * @param inidType1 the inidType1 to set
	 */
	public void setInidType1(String inidType1) {
		this.inidType1 = inidType1;
	}
	/**
	 * @return the inidType2
	 */
	public String getInidType2() {
		return inidType2;
	}
	/**
	 * @param inidType2 the inidType2 to set
	 */
	public void setInidType2(String inidType2) {
		this.inidType2 = inidType2;
	}
	/**
	 * @return the inidType3
	 */
	public String getInidType3() {
		return inidType3;
	}
	/**
	 * @param inidType3 the inidType3 to set
	 */
	public void setInidType3(String inidType3) {
		this.inidType3 = inidType3;
	}
	/**
	 * @return the inidType4
	 */
	public String getInidType4() {
		return inidType4;
	}
	/**
	 * @param inidType4 the inidType4 to set
	 */
	public void setInidType4(String inidType4) {
		this.inidType4 = inidType4;
	}
	/**
	 * @return the inidType5
	 */
	public String getInidType5() {
		return inidType5;
	}
	/**
	 * @param inidType5 the inidType5 to set
	 */
	public void setInidType5(String inidType5) {
		this.inidType5 = inidType5;
	}
	/**
	 * @return the inidType6
	 */
	public String getInidType6() {
		return inidType6;
	}
	/**
	 * @param inidType6 the inidType6 to set
	 */
	public void setInidType6(String inidType6) {
		this.inidType6 = inidType6;
	}
	/**
	 * @return the inidType7
	 */
	public String getInidType7() {
		return inidType7;
	}
	/**
	 * @param inidType7 the inidType7 to set
	 */
	public void setInidType7(String inidType7) {
		this.inidType7 = inidType7;
	}
	/**
	 * @return the inidType8
	 */
	public String getInidType8() {
		return inidType8;
	}
	/**
	 * @param inidType8 the inidType8 to set
	 */
	public void setInidType8(String inidType8) {
		this.inidType8 = inidType8;
	}
	/**
	 * @return the inidType9
	 */
	public String getInidType9() {
		return inidType9;
	}
	/**
	 * @param inidType9 the inidType9 to set
	 */
	public void setInidType9(String inidType9) {
		this.inidType9 = inidType9;
	}
	/**
	 * @return the inidMylskill
	 */
	public String getInidMylskill() {
		return inidMylskill;
	}
	/**
	 * @param inidMylskill the inidMylskill to set
	 */
	public void setInidMylskill(String inidMylskill) {
		this.inidMylskill = inidMylskill;
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
	 * @return the inidJobform
	 */
	public String getInidJobform() {
		return inidJobform;
	}
	/**
	 * @param inidJobform the inidJobform to set
	 */
	public void setInidJobform(String inidJobform) {
		this.inidJobform = inidJobform;
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
	 * @return the payType
	 */
	public String getPayType() {
		return payType;
	}
	/**
	 * @param payType the payType to set
	 */
	public void setPayType(String payType) {
		this.payType = payType;
	}
	/**
	 * @return the inidPay
	 */
	public String getInidPay() {
		return inidPay;
	}
	/**
	 * @param inidPay the inidPay to set
	 */
	public void setInidPay(String inidPay) {
		this.inidPay = inidPay;
	}
	/**
	 * @return the inidLastSchool
	 */
	public String getInidLastSchool() {
		return inidLastSchool;
	}
	/**
	 * @param inidLastSchool the inidLastSchool to set
	 */
	public void setInidLastSchool(String inidLastSchool) {
		this.inidLastSchool = inidLastSchool;
	}
	/**
	 * @return the inidCareer
	 */
	public String getInidCareer() {
		return inidCareer;
	}
	/**
	 * @param inidCareer the inidCareer to set
	 */
	public void setInidCareer(String inidCareer) {
		this.inidCareer = inidCareer;
	}
	/**
	 * @return the inidLicense
	 */
	public String getInidLicense() {
		return inidLicense;
	}
	/**
	 * @param inidLicense the inidLicense to set
	 */
	public void setInidLicense(String inidLicense) {
		this.inidLicense = inidLicense;
	}
	/**
	 * @return the inidLanguages
	 */
	public String getInidLanguages() {
		return inidLanguages;
	}
	/**
	 * @param inidLanguages the inidLanguages to set
	 */
	public void setInidLanguages(String inidLanguages) {
		this.inidLanguages = inidLanguages;
	}
	/**
	 * @return the inidIntroduce
	 */
	public String getInidIntroduce() {
		return inidIntroduce;
	}
	/**
	 * @param inidIntroduce the inidIntroduce to set
	 */
	public void setInidIntroduce(String inidIntroduce) {
		this.inidIntroduce = inidIntroduce;
	}
	/**
	 * @return the inidSecret
	 */
	public String getInidSecret() {
		return inidSecret;
	}
	/**
	 * @param inidSecret the inidSecret to set
	 */
	public void setInidSecret(String inidSecret) {
		this.inidSecret = inidSecret;
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
	 * @return the inidSex
	 */
	public String getInidSex() {
		return inidSex;
	}
	/**
	 * @param inidSex the inidSex to set
	 */
	public void setInidSex(String inidSex) {
		this.inidSex = inidSex;
	}
	/**
	 * @return the smsSend
	 */
	public String getSmsSend() {
		return smsSend;
	}
	/**
	 * @param smsSend the smsSend to set
	 */
	public void setSmsSend(String smsSend) {
		this.smsSend = smsSend;
	}
	/**
	 * @return the aInsert
	 */
	public String getaInsert() {
		return aInsert;
	}
	/**
	 * @param aInsert the aInsert to set
	 */
	public void setaInsert(String aInsert) {
		this.aInsert = aInsert;
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
	 * @return the searchLoc
	 */
	public String getSearchLoc() {
		return searchLoc;
	}
	/**
	 * @param searchLoc the searchLoc to set
	 */
	public void setSearchLoc(String searchLoc) {
		this.searchLoc = searchLoc;
	}
	/**
	 * @return the searchBizType
	 */
	public String getSearchBizType() {
		return searchBizType;
	}
	/**
	 * @param searchBizType the searchBizType to set
	 */
	public void setSearchBizType(String searchBizType) {
		this.searchBizType = searchBizType;
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
	 * @return the companyUid
	 */
	public String getCompanyUid() {
		return companyUid;
	}
	/**
	 * @param companyUid the companyUid to set
	 */
	public void setCompanyUid(String companyUid) {
		this.companyUid = companyUid;
	}
	/**
	 * @return the recruitCount
	 */
	public Integer getRecruitCount() {
		return recruitCount;
	}
	/**
	 * @param recruitCount the recruitCount to set
	 */
	public void setRecruitCount(Integer recruitCount) {
		this.recruitCount = recruitCount;
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
