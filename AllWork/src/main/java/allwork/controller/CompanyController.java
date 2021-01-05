package allwork.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecruitModel;
import com.ilmagna.allworkadmin.ai.services.AiMatchingRecruitService;
import com.ilmagna.allworkadmin.ai.services.AiMatchingResumeService;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.CommonUtil;
import allwork.common.util.FileUtils;
import allwork.common.util.MakeQueryUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuMyServiceService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;
import allwork.service.RecruitViewService;

@Controller
public class CompanyController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	@Resource(name="netfuCompanyService")
	private NetfuCompanyService netfuCompanyService;
	
	@Resource(name="netfuOnlineRecruitService")
	private NetfuOnlineRecruitService netfuOnlineRecruitService;
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;	

	@Resource(name="fileUtils") 
	private FileUtils fileUtils;			

	@Resource(name="recruitViewService")
	private RecruitViewService recruitViewService;	

	//(begin) 2020.12.30 by s.yoo
	@Resource(name="aiMatchingRecruitService")
	protected AiMatchingRecruitService matchingRecruitService;
	@Resource(name="aiMatchingResumeService")
	protected AiMatchingResumeService matchingResumeService;
	//(end) 2020.12.30 by s.yoo

   	//(begin) 2021.01.04 by s.yoo
	//회사 Logo 및 첨부파일의 Upload 경로명.
	@Value("${upload.path.photo}")
	private String filePathPhoto;
   	//(end) 2021.01.04 by s.yoo

	
	/*
	 * 기업회원 홈
	 */
	@RequestMapping(value="/companyHome.do")
	public ModelAndView companyHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/companyHome");
		
		try{
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("searchType", (String)session.getAttribute("SE_USER_TYPE"));
			commandMap.put("orderRule", "nic.wdate desc");
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			commandMap.put("start", 0);
			commandMap.put("pageSize", 3);
			commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("bizIng", "no");
			// 진행중인 채용정보
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyListByCompany(commandMap.getMap());
			
			commandMap.put("pageSize", 10);
			commandMap.put("orderRule", "nir.wdate desc");
			
			//(begin) 2020.12.30 by s.yoo
			// AI 추천 맞춤 인재 정보 목록
			AiMatchingRecruitModel modelRecruit = new AiMatchingRecruitModel();
			modelRecruit.setUid((String) commandMap.get("loginId"));
			AiMatchingRecruitModel item = matchingRecruitService.getRecruitByCompany(modelRecruit);
			
			List<AiMatchingRecommendationModel> recommandResumeList = new ArrayList<AiMatchingRecommendationModel>();
			if (item != null && item.getData() != null)
				recommandResumeList = item.getData();
			//(end) 2020.12.30 by s.yoo

			// 맞춤 인재 정보 목록
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			commandMap = MakeQueryUtil.makeMyResumeQuery(commandMap, myServiceMap);
			List<Map<String, Object>> myServiceResumeList = netfuMyServiceService.selectMyServiceResumeList(commandMap.getMap());
			
			// 스크랩 이력서 정보
			List<Map<String, Object>> resumeScrapList = netfuScrapService.selectResumeScrapList(commandMap.getMap());
			
			// 최근 본 인재
			List<Map<String, Object>> resumeViewList = recruitViewService.selectResumeViewList(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("recruitList", recruitList);
			mv.addObject("recommandResumeList", recommandResumeList);	//++2020.12.30 by s.yoo
			mv.addObject("myServiceResumeList", myServiceResumeList);
			mv.addObject("resumeScrapList", resumeScrapList);
			mv.addObject("resumeViewList", resumeViewList);
			mv.addObject("map", commandMap.getMap());
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".companyHome Exception !!!!! \n"+e.toString());
		}
		
		
		return mv;
	}
	
	
	/*
	 * 채용정보 등록 페이지 이동
	 */
	@RequestMapping(value="/recruitInfoReg.do")
	public ModelAndView recruitInfoReg(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/recruitInfoReg");
		
		try{
			
			commandMap.put("personUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			
			// 회원정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			// 기업정보 조회
			Map<String, Object> companyMap = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());
			
			commandMap.put("pCode", "");
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 고용형태  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 급여종류  ( netfu_cate : type ='inid_pay' )
			commandMap.put("type", "inid_pay");
			List<Map<String, Object>> inidPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 최종학력  ( netfu_cate : type ='job_school' )
			commandMap.put("type", "job_school");
			List<Map<String, Object>> jobSchoolList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 우대조건  ( netfu_cate : type ='preferential' )
			commandMap.put("type", "preferential");
			List<Map<String, Object>> preferentialList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 제출서류  ( netfu_cate : type ='job_paper' )
			commandMap.put("type", "job_paper");
			List<Map<String, Object>> jobPaperList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 접수방법  ( netfu_cate : type ='job_recipient' )
			commandMap.put("type", "job_recipient");
			List<Map<String, Object>> jobRecipientList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("companyMap", companyMap);
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("inidPayList", inidPayList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("preferentialList", preferentialList);
			mv.addObject("jobPaperList", jobPaperList);
			mv.addObject("jobRecipientList", jobRecipientList);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitInfoReg Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 등록 처리
	 */
	@RequestMapping(value="/registRecruit.do")
	public void registRecruit(CommandMap commandMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		String attachFileName = "";
		String alertMsg = "";
		String redirectUrl = "";
		try{
			
			
			attachFileName = fileUtils.uploadFile(commandMap.getMap(), request); // 첨부파일 업로드

			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("bizFormFile", attachFileName);
			netfuItemCompanyService.insertNetfuItemCompany(commandMap.getMap()); // 채용공고 저장
			CommonUtil.Alert("등록되었습니다.", "/recruitListProgress.do", request, response);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".registRecruit Exception !!!!! \n"+e.toString());
			CommonUtil.Alert("등록에 실패 하였습니다.", "/companyHome.do", request, response);
		}
	}
	
	
	/*
	 *  유료 채용광고 서비스 신청
	 */
	@RequestMapping(value="/recruitApplyForPay.do")
	public ModelAndView recruitApplyForPay(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitApplyForPay");
		
		return mv;
	}
	
	
	/*
	 * 채용검색 서비스 신청
	 */
	@RequestMapping(value="/resumeSearchApplyForPay.do")
	public ModelAndView resumeApplyPayService(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/resumeSearchApplyForPay");
		
		return mv;
	}
	
	
	/*
	 * 결제 내역 조회 - 채용공고 검색
	 */
	@RequestMapping(value="/resumeSearchPaidList.do")
	public ModelAndView resumePaidServiceList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/resumeSearchPaidList");
		
		return mv;
	}



	/*
	 * 기업정보 수정 페이지 이동
	 */
	//(begin) 2021.01.04 by s.yoo
	@RequestMapping(value="/companyModify.do")
	public ModelAndView companyModify(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/company/companyModify");

		try {
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 상장여부 ( netfu_cate : type = 'biz_list')
			commandMap.put("type", "biz_list");
			List<Map<String, Object>> bizList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 기업 형태( netfu_cate : type = 'biz_form')
			commandMap.put("type", "biz_form");
			List<Map<String, Object>> bizFormList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			//기업회원의 Company 정보 전달.
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> mapResult = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());		
			
			//[Smart Editor 지원] bizVision과 bizHistory에 있는 쌍따옴표(")를 단일따옴표(')로 변환.
			mapResult.put("bizVision", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) mapResult.get("bizVision")));
			mapResult.put("bizHistory", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) mapResult.get("bizHistory")));

			//View 표출.
			mv.addObject("rstCnt", 2);
			mv.addObject("map", mapResult);
			mv.addObject("businesstypeList", businesstypeList);
			mv.addObject("bizList", bizList);
			mv.addObject("bizFormList", bizFormList);
		}catch(Exception e){
			log.info(this.getClass().getName()+".companyModify Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	
	@RequestMapping(value="/companyModifyProcess.do")
	public ModelAndView companyModifyProcess(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("/company/companyModify");

		try {
			String uid = (String) commandMap.get("uid");
			
			//첨부파일 Upload.
			String strFileLogo = "";
			MultipartFile fileLogo = request.getFile("fileLogo");
			if(fileLogo != null && !fileLogo.isEmpty()) {
				strFileLogo = ApiCommonUtils.uploadPhotoFile("logo", uid, fileLogo, filePathPhoto);
			}
			String strFilePhoto1 = "";
			MultipartFile filePhoto1 = request.getFile("filePhoto1");
			if(filePhoto1 != null && !filePhoto1.isEmpty()) {
				strFilePhoto1 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto1, filePathPhoto);
			}
			String strFilePhoto2 = "";
			MultipartFile filePhoto2 = request.getFile("filePhoto2");
			if(filePhoto2 != null && !filePhoto2.isEmpty()) {
				strFilePhoto2 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto2, filePathPhoto);
			}
			String strFilePhoto3 = "";
			MultipartFile filePhoto3 = request.getFile("filePhoto3");
			if(filePhoto3 != null && !filePhoto3.isEmpty()) {
				strFilePhoto3 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto3, filePathPhoto);
			}
			String strFilePhoto4 = "";
			MultipartFile filePhoto4 = request.getFile("filePhoto4");
			if(filePhoto4 != null && !filePhoto4.isEmpty()) {
				strFilePhoto4 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto4, filePathPhoto);
			}
			
			//[Smart Editor 지원] bizVision과 bizHistory에 있는 쌍따옴표(")를 단일따옴표(')로 변환.
			commandMap.put("bizVision", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) commandMap.get("bizVision")));
			commandMap.put("bizHistory", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) commandMap.get("bizHistory")));

			//기업정보 등록.
			int rstCnt = 0;
			//commandMap.put("loginId", uid);
			if (!ApiCommonUtils.isNullOrEmpty(strFileLogo))	commandMap.put("bizLogo", strFileLogo);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto1))	commandMap.put("photo1", strFilePhoto1);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto2))	commandMap.put("photo2", strFilePhoto2);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto3))	commandMap.put("photo3", strFilePhoto3);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto4))	commandMap.put("photo4", strFilePhoto4);
			Map<String, Object> mapResult = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());
			if (!mapResult.isEmpty()) {
				netfuCompanyService.updateNetfuCompany(commandMap.getMap());
				rstCnt = 1;
			}
				
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".companyModifyProcess Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	//(end) 2021.01.04 by s.yoo

}
