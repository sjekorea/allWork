package allwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;
import com.ilmagna.allworkadmin.ai.services.AiMatchingRecruitService;
import com.ilmagna.allworkadmin.ai.services.AiMatchingResumeService;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;

import allwork.common.CommandMap;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuMyServiceService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuOpenResumeService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuCateService;
import allwork.service.NetfuConcernService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuScrapService;
import allwork.service.RecruitItemService;
import allwork.service.RecruitViewService;
import allwork.common.util.PaginationUtil;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.CommonUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.FileUtils;
import allwork.common.util.MakeQueryUtil;

@Controller
public class PersonController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;
	
	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;
	
	@Resource(name="recruitItemService")
	private RecruitItemService recruitItemService;
	
	@Resource(name="netfuOnlineRecruitService")
	private NetfuOnlineRecruitService netfuOnlineRecruitService;
	
	@Resource(name="netfuConcernService")
	private NetfuConcernService netfuConcernService;
	
	@Resource(name="netfuOpenResumeService")
	private NetfuOpenResumeService netfuOpenResumeService;
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;		

	@Resource(name="recruitViewService")
	private RecruitViewService recruitViewService;		

	@Resource(name="fileUtils") 
	private FileUtils fileUtils;			
	
	//(begin) 2020.12.30 by s.yoo
	@Resource(name="aiMatchingRecruitService")
	protected AiMatchingRecruitService matchingRecruitService;
	@Resource(name="aiMatchingResumeService")
	protected AiMatchingResumeService matchingResumeService;
	//(end) 2020.12.30 by s.yoo

	@Value("${upload.path.photo}")
	private String filePathPhoto;
	
	/*
	 * 개인 회원 홈
	 */
	@RequestMapping(value="/personHome.do")
	public ModelAndView personHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/personHome");
		int pageSize = 10;
		//int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			// 온라인 입사지원 수
			int onlineRecruitCnt = netfuOnlineRecruitService.selectOnlineRecruitCnt(commandMap.getMap());
			
			// 스크랩한 채용정보
			int netfuOpenResumeCnt = netfuOpenResumeService.selectNetfuOpenResumeCnt(commandMap.getMap());
			
			// 스크랩한 채용정보
			int netfuScrapCnt = netfuScrapService.selectRecruitScrapCnt(commandMap.getMap());
			
			// 관심기업 공고
			int netfuConcernCnt = netfuConcernService.selectNetfuConcernRegistCnt(commandMap.getMap());
			
			//(begin) 2020.12.30 by s.yoo
			/*
			// 추천 채용정보
			List<Map<String, Object>> recommandRecruitList = recruitItemService.selectRecommandRecruitList(commandMap.getMap());
			*/
			// AI 추천 맞춤 채용정보 목록
			AiMatchingResumeModel modelResume = new AiMatchingResumeModel();
			modelResume.setUid((String) commandMap.get("loginId"));
			AiMatchingResumeModel item = matchingResumeService.getResumeByMember(modelResume);
			
			List<AiMatchingRecommendationModel> recommandRecruitList = new ArrayList<AiMatchingRecommendationModel>();
			if (item != null && item.getData() != null)
				recommandRecruitList = item.getData();
			//(end) 2020.12.30 by s.yoo
			
			// 맞춤 채용 정보
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			List<Map<String, Object>> myServiceRecruitList = new ArrayList<Map<String, Object>>();
			if (myServiceMap != null && !myServiceMap.isEmpty()) {
				//맞춤서비스가 설정된 경우.
				commandMap = MakeQueryUtil.makeMyRecruitQuery(commandMap, myServiceMap);
				myServiceRecruitList = netfuMyServiceService.selectMyServiceRecruitList(commandMap.getMap());
			}
			
			// 스크랩 공고
			List<Map<String, Object>> recruitScrapList = netfuScrapService.selectRecruitScrapList(commandMap.getMap());
			
			// 열람정보  검색 리스트
			//commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			//commandMap.put("pageSize", pageSize);
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());			
			List<Map<String, Object>> recruitViewList = recruitViewService.selectRecruitViewList(commandMap.getMap());

			mv.addObject("memberMap", memberMap);
			mv.addObject("onlineRecruitCnt", onlineRecruitCnt);
			mv.addObject("netfuOpenResumeCnt", netfuOpenResumeCnt);
			mv.addObject("netfuScrapCnt", netfuScrapCnt);
			mv.addObject("netfuConcernCnt", netfuConcernCnt);
			mv.addObject("recommandRecruitList", recommandRecruitList);
			mv.addObject("myServiceRecruitList", myServiceRecruitList);
			mv.addObject("recruitScrapList", recruitScrapList);
			mv.addObject("recruitViewList", recruitViewList);
			
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".personHome Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 이력서 등록 페이지 이동
	 */
	@RequestMapping(value="/resumeInfoReg.do")
	public ModelAndView resumeInfoReg(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/resumeInfoReg");
		
		try{
			
			commandMap.put("personUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			
			// 회원정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());

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
			
			// 학력-상태  ( netfu_cate : type ='job_state' )
			commandMap.put("type", "job_state");
			List<Map<String, Object>> jobStateList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 자격증  ( netfu_cate : type ='inid_mylskill' )
			commandMap.put("type", "inid_mylskill");
			List<Map<String, Object>> inidMylskillList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("inidPayList", inidPayList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("jobStateList", jobStateList);
			mv.addObject("inidMylskillList", inidMylskillList);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".resumeInfoReg Exception!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 이력서 등록 처리
	 */
	@RequestMapping(value="/registResume.do")
	public void registResume(CommandMap commandMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//ModelAndView mv = new ModelAndView();
		//String attachFileName = "";
		//String alertMsg = "";
		//String redirectUrl = "";
		try{
			
			commandMap = fileUtils.uploadFileMap(commandMap, request); // 첨부파일 업로드
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			netfuItemResumeService.insertNetfuItemResume(commandMap.getMap()); // 채용공고 저장
			CommonUtil.Alert("등록되었습니다.", "/resumeList.do", request, response);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".registResume Exception !!!!! \n"+e.toString());
			CommonUtil.Alert("등록에 실패 하였습니다.", "/personHome.do", request, response);
		}
	}
	
	
	/*
	 * 이력서 수정 페이지 이동
	 */
	@RequestMapping(value="/resumeInfoUpt.do")
	public ModelAndView resumeInfoUpt(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/resumeInfoUpt");
		
		try{
			
			commandMap.put("personUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			// 회원정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());

			// 이력서 정보 -- uid, no
			commandMap.put("uid", commandMap.get("personUid"));
			commandMap.put("no", commandMap.get("resumeNo"));
			Map<String, Object> resumeMap = netfuItemResumeService.selectNetfuItemResumeMap(commandMap.getMap());
						
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
			
			// 학력-상태  ( netfu_cate : type ='job_state' )
			commandMap.put("type", "job_state");
			List<Map<String, Object>> jobStateList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 자격증  ( netfu_cate : type ='inid_mylskill' )
			commandMap.put("type", "inid_mylskill");
			List<Map<String, Object>> inidMylskillList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, String> resumeEducation = mapper.readValue((String)resumeMap.get("education2"), Map.class);
			Map<String, String> resumeCareer = mapper.readValue((String)resumeMap.get("career2"), Map.class);
			Map<String, String> resumeLicense = mapper.readValue((String)resumeMap.get("license2"), Map.class);
			Map<String, String> resumeLanguage = mapper.readValue((String)resumeMap.get("language2"), Map.class);
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("memberMap", memberMap);
			mv.addObject("resumeMap", resumeMap);
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("inidPayList", inidPayList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("jobStateList", jobStateList);
			mv.addObject("inidMylskillList", inidMylskillList);

			mv.addObject("resumeEducation", resumeEducation);
			mv.addObject("resumeCareer", resumeCareer);
			mv.addObject("resumeLicense", resumeLicense);
			mv.addObject("resumeLanguage", resumeLanguage);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".resumeInfoUpt Exception!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 이력서수정 처리
	 */
	@RequestMapping(value="/updateResume.do")
	public void updateResume(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		//String attachFileName = "";
		//String alertMsg = "";
		//String redirectUrl = "";
		try{
			
			//첨부파일 Upload.
			String strInidPhoto = "";
			MultipartFile fileInidPhoto = request.getFile("inidPhoto");
			if(fileInidPhoto != null && !fileInidPhoto.isEmpty()) {
				strInidPhoto = ApiCommonUtils.uploadPhotoFile("inidPhoto", (String)session.getAttribute("SE_LOGIN_ID"), fileInidPhoto, filePathPhoto);
				commandMap.put("inidPhoto", strInidPhoto);
			}else{
				commandMap.put("inidPhoto", (String)commandMap.get("orgInidPhoto"));
			}
			
			String strPortfolio = "";
			MultipartFile filePortfolio = request.getFile("portfolioFile");
			if(filePortfolio != null && !filePortfolio.isEmpty()) {
				strPortfolio = ApiCommonUtils.uploadPhotoFile("portfolioFile", (String)session.getAttribute("SE_LOGIN_ID"), filePortfolio, filePathPhoto);
				commandMap.put("portfolioFile", strPortfolio);
			}else{
				commandMap.put("portfolioFile", (String)commandMap.get("orgportfolioFile"));
			}
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			netfuItemResumeService.updateNetfuItemResume(commandMap.getMap()); // 이력서 수정
			CommonUtil.Alert("수정되었습니다.", "/resumeList.do", request, response);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".registResume Exception !!!!! \n"+e.toString());
			CommonUtil.Alert("수정에 실패 하였습니다.", "/personHome.do", request, response);
		}
	}
	
	/*
	 * 이력서 공개/비공개 설정
	 */
	@RequestMapping(value="/updateNetfuItemResumeSecret.ajax")
	public ModelAndView updateNetfuItemResumeSecret(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuItemResumeService.updateNetfuItemResumeSecret(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.debug(this.getClass().getName()+" updateNetfuItemResumeSecret.ajax Exception!!!!  "+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 내가 열람한 기업 정보
	 */
	@RequestMapping(value="/recruitViewList.do")
	public ModelAndView recruitViewList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/recruitViewList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 열람정보  검색 리스트
			List<Map<String, Object>> recruitViewList = recruitViewService.selectRecruitViewList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitViewList.size() > 0){
				totalSize = recruitViewService.selectRecruitViewCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("recruitViewList", recruitViewList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitViewList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
}
