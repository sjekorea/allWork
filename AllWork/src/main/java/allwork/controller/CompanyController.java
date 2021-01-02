package allwork.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.CommonUtil;
import allwork.common.util.FileUtils;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuMyServiceService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;

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
			// 맞춤 인재 정보 목록
			List<Map<String, Object>> myServiceResumeList = netfuMyServiceService.selectMyServiceResumeList(commandMap.getMap());
			
			// 스크랩 이력서 정보
			List<Map<String, Object>> resumeScrapList = netfuScrapService.selectResumeScrapList(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("recruitList", recruitList);
			mv.addObject("myServiceResumeList", myServiceResumeList);
			mv.addObject("resumeScrapList", resumeScrapList);
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
	 * 면접제의 요청관리
	 */
	@RequestMapping(value="/interviewSuggestList.do")
	public ModelAndView interviewSuggestList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/interviewSuggestList");
		
		return mv;
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


}
