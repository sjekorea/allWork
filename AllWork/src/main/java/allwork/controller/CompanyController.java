package allwork.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import allwork.common.util.ConvertUtil;
import allwork.common.util.FileUtils;
import allwork.common.util.MakeQueryUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuMyServiceService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;
import allwork.service.PaymentInfoService;
import allwork.service.RecruitViewService;
import allwork.vo.NetfuItemResumeVo;

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

	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;	

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
			commandMap.put("bizIng", "yes");
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
			//List<Map<String, Object>> myServiceResumeList = new ArrayList<Map<String, Object>>();
			List<NetfuItemResumeVo> myServiceResumeList = new ArrayList<NetfuItemResumeVo>();
			if (myServiceMap != null && !myServiceMap.isEmpty()) {
				//맞춤서비스가 설정된 경우.
				commandMap = MakeQueryUtil.makeMyResumeQuery(commandMap, myServiceMap);

				String service2Flag = ConvertUtil.checkNull((String) session.getAttribute("SE_SERVICE2"));
				boolean bPaidUser = service2Flag.equalsIgnoreCase("Y");
				myServiceResumeList = netfuMyServiceService.selectMyServiceResumeList(bPaidUser, commandMap.getMap());
			}
			
			// 스크랩 이력서 정보
			List<Map<String, Object>> resumeScrapList = netfuScrapService.selectResumeScrapList(commandMap.getMap());
			
			// 최근 본 인재
			List<Map<String, Object>> resumeViewList = recruitViewService.selectResumeViewList(commandMap.getMap());
			
			// 결제 정보
			int paymentTotal = paymentInfoService.selectPaymentTotal(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("recruitList", recruitList);
			mv.addObject("recommandResumeList", recommandResumeList);	//++2020.12.30 by s.yoo
			mv.addObject("myServiceResumeList", myServiceResumeList);
			mv.addObject("resumeScrapList", resumeScrapList);
			mv.addObject("resumeViewList", resumeViewList);
			mv.addObject("paymentTotal", paymentTotal);
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
	public void registRecruit(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) {
		
		//ModelAndView mv = new ModelAndView();
		//String attachFileName = "";
		//String alertMsg = "";
		//String redirectUrl = "";
		try{
			
			
			//attachFileName = fileUtils.uploadFile(commandMap.getMap(), request); // 첨부파일 업로드
			//commandMap.put("bizFormFile", attachFileName);
			
			//첨부파일 Upload.
			String strbizFormFile = "";
			MultipartFile filebizFormFile = request.getFile("bizFormFile");
			if(filebizFormFile != null && !filebizFormFile.isEmpty()) {
				strbizFormFile = ApiCommonUtils.uploadPhotoFile("bizFormFile", (String)session.getAttribute("SE_LOGIN_ID"), filebizFormFile, filePathPhoto);
				commandMap.put("bizFormFile", strbizFormFile);
			}else{
				commandMap.put("bizFormFile", "");
			}

			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			netfuItemCompanyService.insertNetfuItemCompany(commandMap.getMap()); // 채용공고 저장
			CommonUtil.Alert("등록되었습니다.", "/recruitListProgress.do", request, response);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".registRecruit Exception !!!!! \n"+e.toString());
			CommonUtil.Alert("오류가 발생해서 채용공고 등록에 실패 하였습니다.", "/companyHome.do", request, response);
		}
	}
	
	
	/*
	 * 채용정보 수정
	 */
	@RequestMapping(value="/recruitInfoUpt.do", method = RequestMethod.POST)
	public ModelAndView recruitInfoUpt(CommandMap commandMap, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView("/company/recruitInfoUpt");
		
		try{
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 개인회원 정보 select
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			// 기업정보 select
			commandMap.put("uid", commandMap.get("loginId"));
			Map<String, Object> companyMap = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());
			
			// 채용정보 select
			commandMap.put("uid", commandMap.get("loginId"));
			commandMap.put("no", commandMap.get("recruitNo"));
			Map<String, Object> recruitMap = netfuItemCompanyService.selectNetfuItemCompanyMap(commandMap.getMap());
			
			
			
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

			mv.addObject("map", commandMap.getMap());
			mv.addObject("memberMap", memberMap);
			mv.addObject("companyMap", companyMap);
			mv.addObject("recruitMap", recruitMap);
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
			log.info(this.getClass().getName()+".recruitInfoUpt Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 채용정보 수정 처리
	 */
	@RequestMapping(value="/updateRecruit.do")
	public void updateRecruit(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		//String attachFileName = "";
		//String alertMsg = "";
		//String redirectUrl = "";
		try{
			
			//첨부파일 Upload.
			String strbizFormFile = "";
			MultipartFile filebizFormFile = request.getFile("bizFormFile");
			if(filebizFormFile != null && !filebizFormFile.isEmpty()) {
				strbizFormFile = ApiCommonUtils.uploadPhotoFile("bizFormFile", (String)session.getAttribute("SE_LOGIN_ID"), filebizFormFile, filePathPhoto);
				commandMap.put("bizFormFile", strbizFormFile);
			}else{
				commandMap.put("bizFormFile", "");
			}
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			netfuItemCompanyService.updateNetfuItemCompany(commandMap.getMap()); // 채용공고 저장
			CommonUtil.Alert("등록되었습니다.", "/recruitListProgress.do", request, response);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".updateRecruit Exception !!!!! \n"+e.toString());
			CommonUtil.Alert("오류가 발생해서 채용공고 등록에 실패 하였습니다.", "/companyHome.do", request, response);
		}
	}

	
	/*
	 * 채용정보 삭제
	 */
	@RequestMapping(value="/deleteRecruitInfo.ajax")
	public ModelAndView deleteRecruitInfo(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuItemCompanyService.deleteNetfuItemCompany(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".deleteRecruitInfo Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 기업정보 상세보기
	 */
	@RequestMapping(value="/companyDetail.do")
	public ModelAndView companyDetail(CommandMap commandMap, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView("/company/companyDetail");
		
		try{
			
			// 기업정보 select
			commandMap.put("uid", (String)commandMap.get("company"));
			Map<String, Object> companyMap = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());

			mv.addObject("map", commandMap.getMap());
			mv.addObject("companyMap", companyMap);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".companyDetail Exception !!!!! \n"+e.toString());
		}
		return mv;
	}



	/*
	 * 기업정보 수정 페이지 이동
	 */
	//(begin) 2021.01.04 by s.yoo
	@RequestMapping(value="/companyModify.do")
	public ModelAndView companyModify(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/companyModify");

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
			
			/*
			//[Smart Editor 지원] bizVision과 bizHistory에 있는 쌍따옴표(")를 단일따옴표(')로 변환.
			mapResult.put("bizVision", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) mapResult.get("bizVision")));
			mapResult.put("bizHistory", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) mapResult.get("bizHistory")));
			*/

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
		ModelAndView mv = new ModelAndView("/login/companyModify");

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
			
			/*
			//[Smart Editor 지원] bizVision과 bizHistory에 있는 쌍따옴표(")를 단일따옴표(')로 변환.
			commandMap.put("bizVision", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) commandMap.get("bizVision")));
			commandMap.put("bizHistory", ApiCommonUtils.cnvtDoubleQuote2SingleQuote((String) commandMap.get("bizHistory")));
			*/

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
			
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 상장여부 ( netfu_cate : type = 'biz_list')
			commandMap.put("type", "biz_list");
			List<Map<String, Object>> bizList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 기업 형태( netfu_cate : type = 'biz_form')
			commandMap.put("type", "biz_form");
			List<Map<String, Object>> bizFormList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			//View 표출.
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("businesstypeList", businesstypeList);
			mv.addObject("bizList", bizList);
			mv.addObject("bizFormList", bizFormList);
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".companyModifyProcess Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	//(end) 2021.01.04 by s.yoo

}
