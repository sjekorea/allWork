package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiRecruitModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String uid;
	private Integer infoType;					//일반직, 알바, 프리랜서
	private String bizName;						//회사명
	private String bizTitle;					//공고제목
	private String bizPost;						//X -> 우편번호
	private String bizAddress1;					//X -> 주소
	private String bizAddress2;
	private String strAddress;
	private String strAddressMini;
	private String bizType1;					//직종
	private String bizType2;
	private String bizType3;
	private String bizType4;
	private String bizType5;
	private String bizType6;
	private String strBizType;
	private String bizPosition;					//X -> 직책
	private String bizArea1;					//근무지역
	private String bizArea2;
	private String bizArea3;
	private String bizArea4;
	private String bizArea5;
	private String bizArea6;
	private String strArea;
	private String bizBusiness;					//담당업무
	private String bizMen;						//채용인원
	private String bizJobfrom;					//고용형태
	private String strJobForm;
	private String strPay;
	private String payType;					//급여 종류 - 연봉, 월급, ..., 시급.
	private String bizPay;						//급여.
	private String bizWelfare;					//복리후생
	private String strWelfare;
	private String bizAge;						//나이
	private String strAge;
	private String bizSex;						//성별
	private String strSex;
	private String bizAbility;					//학력 - 1 : "고등학교졸업", 2 : "대학졸업(2~3년)", 3 : "대학교졸업(4년)", 4 : "석사", 5 :  "박사", 100 : "학력무관"
	private String strAbility;
	private String bizPreferential;				//우대사항
	private String strPreference;
	private Integer bizCareer;					//경력.
	private String strBizCareer;
	private String bizDetail;					//세부내용
	private String bizEndDay;					//마감일
	private String bizEndType;					//마감방법 - 마감일(input), 채용시(get), 상시채용(often).
	private String strEndCond;
	private String bizIng;
	private String bizMethod;					//지원방법
	private String strMethod;
	private String bizPerson;					//담당자
	private String bizPemail;
	private String bizPphone;
	private String strWdate;					//등록일
	private String strUwdate;
	private String strJwdate;
	private String strService1;
	private String strService2;
	private String strService3;
	private String strService4;
	private String strService5;
	private String strService6;
	private String strService7;
	private String strService8;
	private String strService9;
	private String strService10;
	private String strService11;
	private String strService100;
	private String biz_paper;					//제출서류
	private String strPaper;
	private String bizForm;
	private String bizFormFile;
	private String smsSend;
	private String bizPage;
	private Integer hit;						//조회수.
	private String typeR;						//???
	private Integer orderView;
	private String memo;						//관리자 메모.

	private Integer findCompanyInfo;			//검색조건 - 기업정보 등록현황.
	private String searchLoc;					//검색조건 - 지역.
	private String searchBizType;				//검색조건 - 직무.
	String fromDate, toDate;					//검색조건 - 채용마감일.

	private ApiCompanyModel company;
	private String memberUid;					//이력서 등록현황을 검사하는 개인회원 사용자 ID.
	private Integer resumeCount;				//사용자가 등록한 이력서 개수.
	
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
	 * @return the bizName
	 */
	public String getBizName() {
		return bizName;
	}
	/**
	 * @param bizName the bizName to set
	 */
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	/**
	 * @return the bizTitle
	 */
	public String getBizTitle() {
		return bizTitle;
	}
	/**
	 * @param bizTitle the bizTitle to set
	 */
	public void setBizTitle(String bizTitle) {
		this.bizTitle = bizTitle;
	}
	/**
	 * @return the bizPost
	 */
	public String getBizPost() {
		return bizPost;
	}
	/**
	 * @param bizPost the bizPost to set
	 */
	public void setBizPost(String bizPost) {
		this.bizPost = bizPost;
	}
	/**
	 * @return the bizAddress1
	 */
	public String getBizAddress1() {
		return bizAddress1;
	}
	/**
	 * @param bizAddress1 the bizAddress1 to set
	 */
	public void setBizAddress1(String bizAddress1) {
		this.bizAddress1 = bizAddress1;
	}
	/**
	 * @return the bizAddress2
	 */
	public String getBizAddress2() {
		return bizAddress2;
	}
	/**
	 * @param bizAddress2 the bizAddress2 to set
	 */
	public void setBizAddress2(String bizAddress2) {
		this.bizAddress2 = bizAddress2;
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
	 * @return the bizType1
	 */
	public String getBizType1() {
		return bizType1;
	}
	/**
	 * @param bizType1 the bizType1 to set
	 */
	public void setBizType1(String bizType1) {
		this.bizType1 = bizType1;
	}
	/**
	 * @return the bizType2
	 */
	public String getBizType2() {
		return bizType2;
	}
	/**
	 * @param bizType2 the bizType2 to set
	 */
	public void setBizType2(String bizType2) {
		this.bizType2 = bizType2;
	}
	/**
	 * @return the bizType3
	 */
	public String getBizType3() {
		return bizType3;
	}
	/**
	 * @param bizType3 the bizType3 to set
	 */
	public void setBizType3(String bizType3) {
		this.bizType3 = bizType3;
	}
	/**
	 * @return the bizType4
	 */
	public String getBizType4() {
		return bizType4;
	}
	/**
	 * @param bizType4 the bizType4 to set
	 */
	public void setBizType4(String bizType4) {
		this.bizType4 = bizType4;
	}
	/**
	 * @return the bizType5
	 */
	public String getBizType5() {
		return bizType5;
	}
	/**
	 * @param bizType5 the bizType5 to set
	 */
	public void setBizType5(String bizType5) {
		this.bizType5 = bizType5;
	}
	/**
	 * @return the bizType6
	 */
	public String getBizType6() {
		return bizType6;
	}
	/**
	 * @param bizType6 the bizType6 to set
	 */
	public void setBizType6(String bizType6) {
		this.bizType6 = bizType6;
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
	 * @return the bizPosition
	 */
	public String getBizPosition() {
		return bizPosition;
	}
	/**
	 * @param bizPosition the bizPosition to set
	 */
	public void setBizPosition(String bizPosition) {
		this.bizPosition = bizPosition;
	}
	/**
	 * @return the bizArea1
	 */
	public String getBizArea1() {
		return bizArea1;
	}
	/**
	 * @param bizArea1 the bizArea1 to set
	 */
	public void setBizArea1(String bizArea1) {
		this.bizArea1 = bizArea1;
	}
	/**
	 * @return the bizArea2
	 */
	public String getBizArea2() {
		return bizArea2;
	}
	/**
	 * @param bizArea2 the bizArea2 to set
	 */
	public void setBizArea2(String bizArea2) {
		this.bizArea2 = bizArea2;
	}
	/**
	 * @return the bizArea3
	 */
	public String getBizArea3() {
		return bizArea3;
	}
	/**
	 * @param bizArea3 the bizArea3 to set
	 */
	public void setBizArea3(String bizArea3) {
		this.bizArea3 = bizArea3;
	}
	/**
	 * @return the bizArea4
	 */
	public String getBizArea4() {
		return bizArea4;
	}
	/**
	 * @param bizArea4 the bizArea4 to set
	 */
	public void setBizArea4(String bizArea4) {
		this.bizArea4 = bizArea4;
	}
	/**
	 * @return the bizArea5
	 */
	public String getBizArea5() {
		return bizArea5;
	}
	/**
	 * @param bizArea5 the bizArea5 to set
	 */
	public void setBizArea5(String bizArea5) {
		this.bizArea5 = bizArea5;
	}
	/**
	 * @return the bizArea6
	 */
	public String getBizArea6() {
		return bizArea6;
	}
	/**
	 * @param bizArea6 the bizArea6 to set
	 */
	public void setBizArea6(String bizArea6) {
		this.bizArea6 = bizArea6;
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
	 * @return the bizBusiness
	 */
	public String getBizBusiness() {
		return bizBusiness;
	}
	/**
	 * @param bizBusiness the bizBusiness to set
	 */
	public void setBizBusiness(String bizBusiness) {
		this.bizBusiness = bizBusiness;
	}
	/**
	 * @return the bizMen
	 */
	public String getBizMen() {
		return bizMen;
	}
	/**
	 * @param bizMen the bizMen to set
	 */
	public void setBizMen(String bizMen) {
		this.bizMen = bizMen;
	}
	/**
	 * @return the bizJobfrom
	 */
	public String getBizJobfrom() {
		return bizJobfrom;
	}
	/**
	 * @param bizJobfrom the bizJobfrom to set
	 */
	public void setBizJobfrom(String bizJobfrom) {
		this.bizJobfrom = bizJobfrom;
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
	 * @return the bizPay
	 */
	public String getBizPay() {
		return bizPay;
	}
	/**
	 * @param bizPay the bizPay to set
	 */
	public void setBizPay(String bizPay) {
		this.bizPay = bizPay;
	}
	/**
	 * @return the bizWelfare
	 */
	public String getBizWelfare() {
		return bizWelfare;
	}
	/**
	 * @param bizWelfare the bizWelfare to set
	 */
	public void setBizWelfare(String bizWelfare) {
		this.bizWelfare = bizWelfare;
	}
	/**
	 * @return the strWelfare
	 */
	public String getStrWelfare() {
		return strWelfare;
	}
	/**
	 * @param strWelfare the strWelfare to set
	 */
	public void setStrWelfare(String strWelfare) {
		this.strWelfare = strWelfare;
	}
	/**
	 * @return the bizAge
	 */
	public String getBizAge() {
		return bizAge;
	}
	/**
	 * @param bizAge the bizAge to set
	 */
	public void setBizAge(String bizAge) {
		this.bizAge = bizAge;
	}
	/**
	 * @return the strAge
	 */
	public String getStrAge() {
		return strAge;
	}
	/**
	 * @param strAge the strAge to set
	 */
	public void setStrAge(String strAge) {
		this.strAge = strAge;
	}
	/**
	 * @return the bizSex
	 */
	public String getBizSex() {
		return bizSex;
	}
	/**
	 * @param bizSex the bizSex to set
	 */
	public void setBizSex(String bizSex) {
		this.bizSex = bizSex;
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
	 * @return the bizAbility
	 */
	public String getBizAbility() {
		return bizAbility;
	}
	/**
	 * @param bizAbility the bizAbility to set
	 */
	public void setBizAbility(String bizAbility) {
		this.bizAbility = bizAbility;
	}
	/**
	 * @return the strAbility
	 */
	public String getStrAbility() {
		return strAbility;
	}
	/**
	 * @param strAbility the strAbility to set
	 */
	public void setStrAbility(String strAbility) {
		this.strAbility = strAbility;
	}
	/**
	 * @return the bizPreferential
	 */
	public String getBizPreferential() {
		return bizPreferential;
	}
	/**
	 * @param bizPreferential the bizPreferential to set
	 */
	public void setBizPreferential(String bizPreferential) {
		this.bizPreferential = bizPreferential;
	}
	/**
	 * @return the strPreference
	 */
	public String getStrPreference() {
		return strPreference;
	}
	/**
	 * @param strPreference the strPreference to set
	 */
	public void setStrPreference(String strPreference) {
		this.strPreference = strPreference;
	}
	/**
	 * @return the bizCareer
	 */
	public Integer getBizCareer() {
		return bizCareer;
	}
	/**
	 * @param bizCareer the bizCareer to set
	 */
	public void setBizCareer(Integer bizCareer) {
		this.bizCareer = bizCareer;
	}
	/**
	 * @return the strBizCareer
	 */
	public String getStrBizCareer() {
		return strBizCareer;
	}
	/**
	 * @param strBizCareer the strBizCareer to set
	 */
	public void setStrBizCareer(String strBizCareer) {
		this.strBizCareer = strBizCareer;
	}
	/**
	 * @return the bizDetail
	 */
	public String getBizDetail() {
		return bizDetail;
	}
	/**
	 * @param bizDetail the bizDetail to set
	 */
	public void setBizDetail(String bizDetail) {
		this.bizDetail = bizDetail;
	}
	/**
	 * @return the bizEndDay
	 */
	public String getBizEndDay() {
		return bizEndDay;
	}
	/**
	 * @param bizEndDay the bizEndDay to set
	 */
	public void setBizEndDay(String bizEndDay) {
		this.bizEndDay = bizEndDay;
	}
	/**
	 * @return the bizEndType
	 */
	public String getBizEndType() {
		return bizEndType;
	}
	/**
	 * @param bizEndType the bizEndType to set
	 */
	public void setBizEndType(String bizEndType) {
		this.bizEndType = bizEndType;
	}
	/**
	 * @return the strEndCond
	 */
	public String getStrEndCond() {
		return strEndCond;
	}
	/**
	 * @param strEndCond the strEndCond to set
	 */
	public void setStrEndCond(String strEndCond) {
		this.strEndCond = strEndCond;
	}
	/**
	 * @return the bizIng
	 */
	public String getBizIng() {
		return bizIng;
	}
	/**
	 * @param bizIng the bizIng to set
	 */
	public void setBizIng(String bizIng) {
		this.bizIng = bizIng;
	}
	/**
	 * @return the bizMethod
	 */
	public String getBizMethod() {
		return bizMethod;
	}
	/**
	 * @param bizMethod the bizMethod to set
	 */
	public void setBizMethod(String bizMethod) {
		this.bizMethod = bizMethod;
	}
	/**
	 * @return the strMethod
	 */
	public String getStrMethod() {
		return strMethod;
	}
	/**
	 * @param strMethod the strMethod to set
	 */
	public void setStrMethod(String strMethod) {
		this.strMethod = strMethod;
	}
	/**
	 * @return the bizPerson
	 */
	public String getBizPerson() {
		return bizPerson;
	}
	/**
	 * @param bizPerson the bizPerson to set
	 */
	public void setBizPerson(String bizPerson) {
		this.bizPerson = bizPerson;
	}
	/**
	 * @return the bizPemail
	 */
	public String getBizPemail() {
		return bizPemail;
	}
	/**
	 * @param bizPemail the bizPemail to set
	 */
	public void setBizPemail(String bizPemail) {
		this.bizPemail = bizPemail;
	}
	/**
	 * @return the bizPphone
	 */
	public String getBizPphone() {
		return bizPphone;
	}
	/**
	 * @param bizPphone the bizPphone to set
	 */
	public void setBizPphone(String bizPphone) {
		this.bizPphone = bizPphone;
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
	 * @return the strService1
	 */
	public String getStrService1() {
		return strService1;
	}
	/**
	 * @param strService1 the strService1 to set
	 */
	public void setStrService1(String strService1) {
		this.strService1 = strService1;
	}
	/**
	 * @return the strService2
	 */
	public String getStrService2() {
		return strService2;
	}
	/**
	 * @param strService2 the strService2 to set
	 */
	public void setStrService2(String strService2) {
		this.strService2 = strService2;
	}
	/**
	 * @return the strService3
	 */
	public String getStrService3() {
		return strService3;
	}
	/**
	 * @param strService3 the strService3 to set
	 */
	public void setStrService3(String strService3) {
		this.strService3 = strService3;
	}
	/**
	 * @return the strService4
	 */
	public String getStrService4() {
		return strService4;
	}
	/**
	 * @param strService4 the strService4 to set
	 */
	public void setStrService4(String strService4) {
		this.strService4 = strService4;
	}
	/**
	 * @return the strService5
	 */
	public String getStrService5() {
		return strService5;
	}
	/**
	 * @param strService5 the strService5 to set
	 */
	public void setStrService5(String strService5) {
		this.strService5 = strService5;
	}
	/**
	 * @return the strService6
	 */
	public String getStrService6() {
		return strService6;
	}
	/**
	 * @param strService6 the strService6 to set
	 */
	public void setStrService6(String strService6) {
		this.strService6 = strService6;
	}
	/**
	 * @return the strService7
	 */
	public String getStrService7() {
		return strService7;
	}
	/**
	 * @param strService7 the strService7 to set
	 */
	public void setStrService7(String strService7) {
		this.strService7 = strService7;
	}
	/**
	 * @return the strService8
	 */
	public String getStrService8() {
		return strService8;
	}
	/**
	 * @param strService8 the strService8 to set
	 */
	public void setStrService8(String strService8) {
		this.strService8 = strService8;
	}
	/**
	 * @return the strService9
	 */
	public String getStrService9() {
		return strService9;
	}
	/**
	 * @param strService9 the strService9 to set
	 */
	public void setStrService9(String strService9) {
		this.strService9 = strService9;
	}
	/**
	 * @return the strService10
	 */
	public String getStrService10() {
		return strService10;
	}
	/**
	 * @param strService10 the strService10 to set
	 */
	public void setStrService10(String strService10) {
		this.strService10 = strService10;
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
	 * @return the strService100
	 */
	public String getStrService100() {
		return strService100;
	}
	/**
	 * @param strService100 the strService100 to set
	 */
	public void setStrService100(String strService100) {
		this.strService100 = strService100;
	}
	/**
	 * @return the biz_paper
	 */
	public String getBiz_paper() {
		return biz_paper;
	}
	/**
	 * @param biz_paper the biz_paper to set
	 */
	public void setBiz_paper(String biz_paper) {
		this.biz_paper = biz_paper;
	}
	/**
	 * @return the strPaper
	 */
	public String getStrPaper() {
		return strPaper;
	}
	/**
	 * @param strPaper the strPaper to set
	 */
	public void setStrPaper(String strPaper) {
		this.strPaper = strPaper;
	}
	/**
	 * @return the bizForm
	 */
	public String getBizForm() {
		return bizForm;
	}
	/**
	 * @param bizForm the bizForm to set
	 */
	public void setBizForm(String bizForm) {
		this.bizForm = bizForm;
	}
	/**
	 * @return the bizFormFile
	 */
	public String getBizFormFile() {
		return bizFormFile;
	}
	/**
	 * @param bizFormFile the bizFormFile to set
	 */
	public void setBizFormFile(String bizFormFile) {
		this.bizFormFile = bizFormFile;
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
	 * @return the bizPage
	 */
	public String getBizPage() {
		return bizPage;
	}
	/**
	 * @param bizPage the bizPage to set
	 */
	public void setBizPage(String bizPage) {
		this.bizPage = bizPage;
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
	 * @return the typeR
	 */
	public String getTypeR() {
		return typeR;
	}
	/**
	 * @param typeR the typeR to set
	 */
	public void setTypeR(String typeR) {
		this.typeR = typeR;
	}
	/**
	 * @return the orderView
	 */
	public Integer getOrderView() {
		return orderView;
	}
	/**
	 * @param orderView the orderView to set
	 */
	public void setOrderView(Integer orderView) {
		this.orderView = orderView;
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
	 * @return the findCompanyInfo
	 */
	public Integer getFindCompanyInfo() {
		return findCompanyInfo;
	}
	/**
	 * @param findCompanyInfo the findCompanyInfo to set
	 */
	public void setFindCompanyInfo(Integer findCompanyInfo) {
		this.findCompanyInfo = findCompanyInfo;
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
	 * @return the company
	 */
	public ApiCompanyModel getCompany() {
		return company;
	}
	/**
	 * @param company the company to set
	 */
	public void setCompany(ApiCompanyModel company) {
		this.company = company;
	}
	/**
	 * @return the memberUid
	 */
	public String getMemberUid() {
		return memberUid;
	}
	/**
	 * @param memberUid the memberUid to set
	 */
	public void setMemberUid(String memberUid) {
		this.memberUid = memberUid;
	}
	/**
	 * @return the resumeCount
	 */
	public Integer getResumeCount() {
		return resumeCount;
	}
	/**
	 * @param resumeCount the resumeCount to set
	 */
	public void setResumeCount(Integer resumeCount) {
		this.resumeCount = resumeCount;
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
