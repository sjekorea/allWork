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
	private Integer info_type;					//일반직, 알바, 프리랜서
	private String biz_name;					//회사명
	private String biz_title;					//공고제목
	private String biz_post;					//X -> 우편번호
	private String biz_address1;				//X -> 주소
	private String biz_address2;
	private String strAddress;
	private String strAddressMini;
	private String biz_type1;					//직종
	private String biz_type2;
	private String biz_type3;
	private String biz_type4;
	private String biz_type5;
	private String biz_type6;
	private String strBizType;
	private String biz_position;				//X -> 직책
	private String biz_area1;					//근무지역
	private String biz_area2;
	private String biz_area3;
	private String biz_area4;
	private String biz_area5;
	private String biz_area6;
	private String strArea;
	private String biz_business;				//담당업무
	private String biz_men;						//채용인원
	private String biz_jobfrom;					//고용형태
	private String strJobForm;
	private String strPay;
	private String pay_type;					//급여 종류 - 연봉, 월급, ..., 시급.
	private String biz_pay;						//급여.
	private String biz_welfare;					//복리후생
	private String strWelfare;
	private String biz_age;						//나이
	private String strAge;
	private String biz_sex;						//성별
	private String strSex;
	private String biz_ability;					//학력 - 1 : "고등학교졸업", 2 : "대학졸업(2~3년)", 3 : "대학교졸업(4년)", 4 : "석사", 5 :  "박사", 100 : "학력무관"
	private String strAbility;
	private String biz_preferential;			//우대사항
	private String strPreference;
	private Integer biz_career;					//경력.
	private String strBizCareer;
	private String biz_detail;					//세부내용
	private String biz_end_day;					//마감일
	private String biz_end_type;				//마감방법 - 마감일(input), 채용시(get), 상시채용(often).
	private String strEndCond;
	private String biz_ing;
	private String biz_method;					//지원방법
	private String strMethod;
	private String biz_person;					//담당자
	private String biz_pemail;
	private String biz_pphone;
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
	private String biz_form;
	private String biz_form_file;
	private String sms_send;
	private String biz_page;
	private Integer hit;						//조회수.
	private String type_r;						//???
	private Integer order_view;
	private String memo;						//관리자 메모.

	private Integer find_company_info;			//검색조건 - 기업정보 등록현황.
	private String search_loc;					//검색조건 - 지역.
	private String search_biz_type;				//검색조건 - 직무.
	String fromDate, toDate;					//검색조건 - 채용마감일.

	private ApiCompanyModel company;
	private String member_uid;					//이력서 등록현황을 검사하는 개인회원 사용자 ID.
	private Integer resume_count;				//사용자가 등록한 이력서 개수.
	
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
	 * @return the biz_title
	 */
	public String getBiz_title() {
		return biz_title;
	}
	/**
	 * @param biz_title the biz_title to set
	 */
	public void setBiz_title(String biz_title) {
		this.biz_title = biz_title;
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
	 * @return the biz_type1
	 */
	public String getBiz_type1() {
		return biz_type1;
	}
	/**
	 * @param biz_type1 the biz_type1 to set
	 */
	public void setBiz_type1(String biz_type1) {
		this.biz_type1 = biz_type1;
	}
	/**
	 * @return the biz_type2
	 */
	public String getBiz_type2() {
		return biz_type2;
	}
	/**
	 * @param biz_type2 the biz_type2 to set
	 */
	public void setBiz_type2(String biz_type2) {
		this.biz_type2 = biz_type2;
	}
	/**
	 * @return the biz_type3
	 */
	public String getBiz_type3() {
		return biz_type3;
	}
	/**
	 * @param biz_type3 the biz_type3 to set
	 */
	public void setBiz_type3(String biz_type3) {
		this.biz_type3 = biz_type3;
	}
	/**
	 * @return the biz_type4
	 */
	public String getBiz_type4() {
		return biz_type4;
	}
	/**
	 * @param biz_type4 the biz_type4 to set
	 */
	public void setBiz_type4(String biz_type4) {
		this.biz_type4 = biz_type4;
	}
	/**
	 * @return the biz_type5
	 */
	public String getBiz_type5() {
		return biz_type5;
	}
	/**
	 * @param biz_type5 the biz_type5 to set
	 */
	public void setBiz_type5(String biz_type5) {
		this.biz_type5 = biz_type5;
	}
	/**
	 * @return the biz_type6
	 */
	public String getBiz_type6() {
		return biz_type6;
	}
	/**
	 * @param biz_type6 the biz_type6 to set
	 */
	public void setBiz_type6(String biz_type6) {
		this.biz_type6 = biz_type6;
	}
	/**
	 * @return the biz_position
	 */
	public String getBiz_position() {
		return biz_position;
	}
	/**
	 * @param biz_position the biz_position to set
	 */
	public void setBiz_position(String biz_position) {
		this.biz_position = biz_position;
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
	 * @return the biz_area1
	 */
	public String getBiz_area1() {
		return biz_area1;
	}
	/**
	 * @param biz_area1 the biz_area1 to set
	 */
	public void setBiz_area1(String biz_area1) {
		this.biz_area1 = biz_area1;
	}
	/**
	 * @return the biz_area2
	 */
	public String getBiz_area2() {
		return biz_area2;
	}
	/**
	 * @param biz_area2 the biz_area2 to set
	 */
	public void setBiz_area2(String biz_area2) {
		this.biz_area2 = biz_area2;
	}
	/**
	 * @return the biz_area3
	 */
	public String getBiz_area3() {
		return biz_area3;
	}
	/**
	 * @param biz_area3 the biz_area3 to set
	 */
	public void setBiz_area3(String biz_area3) {
		this.biz_area3 = biz_area3;
	}
	/**
	 * @return the biz_area4
	 */
	public String getBiz_area4() {
		return biz_area4;
	}
	/**
	 * @param biz_area4 the biz_area4 to set
	 */
	public void setBiz_area4(String biz_area4) {
		this.biz_area4 = biz_area4;
	}
	/**
	 * @return the biz_area5
	 */
	public String getBiz_area5() {
		return biz_area5;
	}
	/**
	 * @param biz_area5 the biz_area5 to set
	 */
	public void setBiz_area5(String biz_area5) {
		this.biz_area5 = biz_area5;
	}
	/**
	 * @return the biz_area6
	 */
	public String getBiz_area6() {
		return biz_area6;
	}
	/**
	 * @param biz_area6 the biz_area6 to set
	 */
	public void setBiz_area6(String biz_area6) {
		this.biz_area6 = biz_area6;
	}
	/**
	 * @return the biz_business
	 */
	public String getBiz_business() {
		return biz_business;
	}
	/**
	 * @param biz_business the biz_business to set
	 */
	public void setBiz_business(String biz_business) {
		this.biz_business = biz_business;
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
	 * @return the biz_jobfrom
	 */
	public String getBiz_jobfrom() {
		return biz_jobfrom;
	}
	/**
	 * @param biz_jobfrom the biz_jobfrom to set
	 */
	public void setBiz_jobfrom(String biz_jobfrom) {
		this.biz_jobfrom = biz_jobfrom;
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
	 * @return the biz_pay
	 */
	public String getBiz_pay() {
		return biz_pay;
	}
	/**
	 * @param biz_pay the biz_pay to set
	 */
	public void setBiz_pay(String biz_pay) {
		this.biz_pay = biz_pay;
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
	 * @return the biz_welfare
	 */
	public String getBiz_welfare() {
		return biz_welfare;
	}
	/**
	 * @param biz_welfare the biz_welfare to set
	 */
	public void setBiz_welfare(String biz_welfare) {
		this.biz_welfare = biz_welfare;
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
	 * @return the biz_age
	 */
	public String getBiz_age() {
		return biz_age;
	}
	/**
	 * @param biz_age the biz_age to set
	 */
	public void setBiz_age(String biz_age) {
		this.biz_age = biz_age;
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
	 * @return the biz_sex
	 */
	public String getBiz_sex() {
		return biz_sex;
	}
	/**
	 * @param biz_sex the biz_sex to set
	 */
	public void setBiz_sex(String biz_sex) {
		this.biz_sex = biz_sex;
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
	 * @return the biz_ability
	 */
	public String getBiz_ability() {
		return biz_ability;
	}
	/**
	 * @param biz_ability the biz_ability to set
	 */
	public void setBiz_ability(String biz_ability) {
		this.biz_ability = biz_ability;
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
	 * @return the biz_preferential
	 */
	public String getBiz_preferential() {
		return biz_preferential;
	}
	/**
	 * @param biz_preferential the biz_preferential to set
	 */
	public void setBiz_preferential(String biz_preferential) {
		this.biz_preferential = biz_preferential;
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
	 * @return the biz_career
	 */
	public Integer getBiz_career() {
		return biz_career;
	}
	/**
	 * @param biz_career the biz_career to set
	 */
	public void setBiz_career(Integer biz_career) {
		this.biz_career = biz_career;
	}
	/**
	 * @return the biz_detail
	 */
	public String getBiz_detail() {
		return biz_detail;
	}
	/**
	 * @param biz_detail the biz_detail to set
	 */
	public void setBiz_detail(String biz_detail) {
		this.biz_detail = biz_detail;
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
	 * @return the biz_end_day
	 */
	public String getBiz_end_day() {
		return biz_end_day;
	}
	/**
	 * @param biz_end_day the biz_end_day to set
	 */
	public void setBiz_end_day(String biz_end_day) {
		this.biz_end_day = biz_end_day;
	}
	/**
	 * @return the biz_end_type
	 */
	public String getBiz_end_type() {
		return biz_end_type;
	}
	/**
	 * @param biz_end_type the biz_end_type to set
	 */
	public void setBiz_end_type(String biz_end_type) {
		this.biz_end_type = biz_end_type;
	}
	/**
	 * @return the biz_ing
	 */
	public String getBiz_ing() {
		return biz_ing;
	}
	/**
	 * @param biz_ing the biz_ing to set
	 */
	public void setBiz_ing(String biz_ing) {
		this.biz_ing = biz_ing;
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
	 * @return the biz_method
	 */
	public String getBiz_method() {
		return biz_method;
	}
	/**
	 * @param biz_method the biz_method to set
	 */
	public void setBiz_method(String biz_method) {
		this.biz_method = biz_method;
	}
	/**
	 * @return the biz_person
	 */
	public String getBiz_person() {
		return biz_person;
	}
	/**
	 * @param biz_person the biz_person to set
	 */
	public void setBiz_person(String biz_person) {
		this.biz_person = biz_person;
	}
	/**
	 * @return the biz_pemail
	 */
	public String getBiz_pemail() {
		return biz_pemail;
	}
	/**
	 * @param biz_pemail the biz_pemail to set
	 */
	public void setBiz_pemail(String biz_pemail) {
		this.biz_pemail = biz_pemail;
	}
	/**
	 * @return the biz_pphone
	 */
	public String getBiz_pphone() {
		return biz_pphone;
	}
	/**
	 * @param biz_pphone the biz_pphone to set
	 */
	public void setBiz_pphone(String biz_pphone) {
		this.biz_pphone = biz_pphone;
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
	 * @return the biz_form_file
	 */
	public String getBiz_form_file() {
		return biz_form_file;
	}
	/**
	 * @param biz_form_file the biz_form_file to set
	 */
	public void setBiz_form_file(String biz_form_file) {
		this.biz_form_file = biz_form_file;
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
	 * @return the biz_page
	 */
	public String getBiz_page() {
		return biz_page;
	}
	/**
	 * @param biz_page the biz_page to set
	 */
	public void setBiz_page(String biz_page) {
		this.biz_page = biz_page;
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
	 * @return the type_r
	 */
	public String getType_r() {
		return type_r;
	}
	/**
	 * @param type_r the type_r to set
	 */
	public void setType_r(String type_r) {
		this.type_r = type_r;
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
	 * @return the find_company_info
	 */
	public Integer getFind_company_info() {
		return find_company_info;
	}
	/**
	 * @param find_company_info the find_company_info to set
	 */
	public void setFind_company_info(Integer find_company_info) {
		this.find_company_info = find_company_info;
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
	 * @return the member_uid
	 */
	public String getMember_uid() {
		return member_uid;
	}
	/**
	 * @param member_uid the member_uid to set
	 */
	public void setMember_uid(String member_uid) {
		this.member_uid = member_uid;
	}
	/**
	 * @return the resume_count
	 */
	public Integer getResume_count() {
		return resume_count;
	}
	/**
	 * @param resume_count the resume_count to set
	 */
	public void setResume_count(Integer resume_count) {
		this.resume_count = resume_count;
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
