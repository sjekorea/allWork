/*
 * 개인회원과 기업회원에게 제공되는 맞춤형 추천정보(구인정보 또는 구직정보).
 */
package com.ilmagna.allworkadmin.ai.domains;

import java.io.Serializable;

import org.json.simple.JSONObject;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;
import com.ilmagna.allworkadmin.api.services.ApiCategoryService;


public class AiMatchingRecommendationModel implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
												//추천인재정보		올워크 추천채용정보		워크넷 추천채용정	보
	private Integer id;
	private Integer type;						//X				allwork(1)			worknet(2)
	private String recommend_id;				//이력서 ID		올워크 채용공고 ID		워크넷 채용공고 Key
	private String uid;							//구직자 사용자 ID	구인자 사용자 ID				Null/Empty String
	private String name;						//구직자 이름		구인회사 이름			구인회사이름
	private String title;						//X				채용공고 제목			채용공고 제목
	private String loc;							//희망근무지		근무지				근무지
	private String salary;						//희망급여			연봉					연봉
	//private String career;						//X				경력					경력
	private String job_type;					//직무			직무					직무
	private String strWdate;					//추천일자			채용공고 등록일			채용공고 등록일
	private String strEdate;					//X				채용마감일				채용마감일
	private String detail;						//보유기술			채용정보 상세내용			채용정보 상세내용
	private String job_form;					//고용형태			X					X
	
	private String inid_secret;					//이력서 공개상태		X					X
	private	String photo;						//구직자 사진.
	private String open;						//X				채용공고 공개상태			X
	
	private String biz_end_type;				//				채용마감 조건.
	private String biz_end_day;					//				채용마감 일.
	
	public AiMatchingRecommendationModel() {
		this.id				= 0;
		this.type			= 1;
		this.recommend_id	= "";
		this.uid			= "";
		this.name			= "";
		this.title			= "";
		this.loc			= "";
		this.salary			= "";
		//this.career			= "";
		this.job_type		= "";
		this.strWdate		= "";
		this.strEdate		= "";
		this.detail			= "";
		this.job_form		= "";
		
		this.inid_secret	= "yes";
		this.photo			= "";
		this.open			= "open";
		
		this.biz_end_type	= "get";
		this.biz_end_day	= "";
	}

	
	public boolean parseJsonObj(ApiCategoryService categoryService, JSONObject jsonObject) {
		boolean bResult = false;
		try {
			if (jsonObject == null) return bResult;
			
			//JSONObject를 Java Object로 변환.
			//String Integer = (String) jsonObject.get("Integer");
			//if (!ApiCommonUtils.isNullOrEmpty(Integer))
			//	this.setType(Integer);
			
			//급여
			String[] listPay = { "biz_pay", "inid_pay" };
			for (int i = 0; i < listPay.length; i++) {
				String salary = (String) jsonObject.get(listPay[i]);
				if (!ApiCommonUtils.isNullOrEmpty(salary)) {
					//연봉이 Code로 표현되어 있으면, 이름을 획득한다.
					ApiCategoryModel modelCategory = new ApiCategoryModel();
					modelCategory.setCode(salary);
					modelCategory = categoryService.getCategory(modelCategory);
					if (!ApiCommonUtils.isNullOrEmpty(modelCategory.getName()))
						salary = modelCategory.getName();

					//이름으로 표현된 연봉 등록.
					this.setSalary(salary);
				}				
			}
			
			//채용공고 또는 이력서 ID.
			String[] listNo = { "no" };
			for (int i = 0; i < listNo.length; i++) {
				try {
					//Integer로 전달되는 no -> 올워크의  채용공고 ID 또는 이력서 ID.
					String strNo = String.valueOf((Long) jsonObject.get(listNo[i]));
					if (!ApiCommonUtils.isNullOrEmpty(strNo)) {
						Integer no = Integer.parseInt(strNo);
						this.setRecommend_id("" + no);
						this.setType(1);						//올워크.
					}
				} catch(Exception ex) {
					try {
						//String으로 전달되는 no -> 워크넷의  채용공고 ID.
						String recommend_id = (String) jsonObject.get(listNo[i]);
						if (!ApiCommonUtils.isNullOrEmpty(recommend_id)) {
							this.setRecommend_id(recommend_id);					
							this.setType(2);					//워크넷.
						}
					} catch(Exception ex1 ) {
						ex1.printStackTrace();					
					}
				}				
			}
			
			//사용자 ID.
			String uid = (String) jsonObject.get("uid");
			if (!ApiCommonUtils.isNullOrEmpty(uid))
				this.setUid(uid);
			
			//회사명 또는 구직자 이름.
			String[] listName = { "biz_name", "name" };
			for (int i = 0; i < listName.length; i++) {
				String name = (String) jsonObject.get(listName[i]);
				if (!ApiCommonUtils.isNullOrEmpty(name))
					this.setName(name);				
			}
			
			//채용공고 또는 이력서 제목.
			String title = (String) jsonObject.get("title");
			if (!ApiCommonUtils.isNullOrEmpty(title))
				this.setTitle(title);
			
			//지역.
			String[] listArea = { "job_area", "inid_area" };
			for (int i = 0; i < listArea.length; i++) {
				String loc = (String) jsonObject.get(listArea[i]);
				if (!ApiCommonUtils.isNullOrEmpty(loc)) {
					loc = loc.replaceAll("\\^", " ");
					loc = loc.replaceAll("->", ">");
					this.setLoc(loc);
				}				
			}
			
			/*
			//경력
			String career = (String) jsonObject.get("career");
			if (!ApiCommonUtils.isNullOrEmpty(career))
				this.setCareer(career);
			*/
			
			//직무
			String[] listJobType = { "job_type", "inid_type" };
			for (int i = 0; i < listJobType.length; i++) {
				String job_type = (String) jsonObject.get(listJobType[i]);
				if (!ApiCommonUtils.isNullOrEmpty(job_type))
					this.setJob_type(job_type);				
			}
			
			//등록일.
			String strWdate = (String) jsonObject.get("wdate");
			if (!ApiCommonUtils.isNullOrEmpty(strWdate))
				this.setStrWdate(strWdate);
			
			//채용마감일.
			String strEndType = (String) jsonObject.get("biz_end_type");
			if (!ApiCommonUtils.isNullOrEmpty(strEndType))
				this.setBiz_end_type(strEndType);
			
			String strEndDay = (String) jsonObject.get("biz_end_day");
			if (!ApiCommonUtils.isNullOrEmpty(strEndDay))
				this.setBiz_end_day(strEndDay);
			
			//채용공고 또는 이력서 상세내용.
			String[] listDetail = { "skill", "biz_short", "tag_skill" };
			for (int i = 0; i < listDetail.length; i++) {
				String detail = (String) jsonObject.get(listDetail[i]);
				if (!ApiCommonUtils.isNullOrEmpty(detail))
					this.setDetail(detail);				
			}
			
			//고용형태.
			String[] listJobForm = { "job_form" };
			for (int i = 0; i < listJobForm.length; i++) {
				String jobForm = (String) jsonObject.get(listJobForm[i]);
				if (!ApiCommonUtils.isNullOrEmpty(jobForm))
					jobForm = jobForm.replaceAll("\\^", " ");
					this.setJob_form(jobForm);				
			}

			//작업결과 등록.
			bResult = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bResult;
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
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * @return the recommend_id
	 */
	public String getRecommend_id() {
		return recommend_id;
	}
	/**
	 * @param recommend_id the recommend_id to set
	 */
	public void setRecommend_id(String recommend_id) {
		this.recommend_id = recommend_id;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
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
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	/*
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	*/
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
	 * @return the detail
	 */
	public String getDetail() {
		return detail;
	}
	/**
	 * @param detail the detail to set
	 */
	public void setDetail(String detail) {
		this.detail = detail;
	}
	/**
	 * @return the job_form
	 */
	public String getJob_form() {
		return job_form;
	}
	/**
	 * @param job_form the job_form to set
	 */
	public void setJob_form(String job_form) {
		this.job_form = job_form;
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
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the open
	 */
	public String getOpen() {
		return open;
	}
	/**
	 * @param open the open to set
	 */
	public void setOpen(String open) {
		this.open = open;
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
}
