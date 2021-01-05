package allwork.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.ai.domains.AiMatchingRecommendationModel;
import com.ilmagna.allworkadmin.ai.domains.AiMatchingResumeModel;
import com.ilmagna.allworkadmin.ai.services.AiMatchingRecruitService;
import com.ilmagna.allworkadmin.ai.services.AiMatchingResumeService;

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
import allwork.common.util.ConvertUtil;
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
	
	//(begin) 2020.12.30 by s.yoo
	@Resource(name="aiMatchingRecruitService")
	protected AiMatchingRecruitService matchingRecruitService;
	@Resource(name="aiMatchingResumeService")
	protected AiMatchingResumeService matchingResumeService;
	//(end) 2020.12.30 by s.yoo

	
	/*
	 * 개인 회원 홈
	 */
	@RequestMapping(value="/personHome.do")
	public ModelAndView personHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/personHome");
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
			commandMap = MakeQueryUtil.makeMyRecruitQuery(commandMap, myServiceMap);
			List<Map<String, Object>> myServiceRecruitList = netfuMyServiceService.selectMyServiceRecruitList(commandMap.getMap());
			
			// 스크랩 공고
			List<Map<String, Object>> recruitScrapList = netfuScrapService.selectRecruitScrapList(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("onlineRecruitCnt", onlineRecruitCnt);
			mv.addObject("netfuOpenResumeCnt", netfuOpenResumeCnt);
			mv.addObject("netfuScrapCnt", netfuScrapCnt);
			mv.addObject("netfuConcernCnt", netfuConcernCnt);
			mv.addObject("recommandRecruitList", recommandRecruitList);
			mv.addObject("myServiceRecruitList", myServiceRecruitList);
			mv.addObject("recruitScrapList", recruitScrapList);
			
		}catch(Exception e){
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
	public ModelAndView registResume(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuItemResumeService.insertNetfuItemResume(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registResume Exception !!!!! \n"+e.toString());
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
	
	
	/*
	 * 이력서 유료 게시 서비스 신청 
	 */
	@RequestMapping(value="/resumeApplyForPay.do")
	public ModelAndView recruitApplyPayService(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/resumeApplyForPay");
		
		return mv;
	}
	
	
	/*
	 * 결제 내역 조회 - 이력서 유료 게시
	 */
	@RequestMapping(value="/resumePaidList.do")
	public ModelAndView recruitPaidServiceList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/resumePaidList");
		
		return mv;
	}
	
}
