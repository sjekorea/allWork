package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuConcernService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;

@Controller
public class NetfuOnlineRecruitController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
	@Resource(name="netfuConcernService")
	private NetfuConcernService netfuConcernService;
	
	@Resource(name="netfuOnlineRecruitService")
	private NetfuOnlineRecruitService netfuOnlineRecruitService;

	
	/*
	 * 입사지원 여부
	 */
	@RequestMapping(value="/getNetfuOnlineRecruitRegistCnt.ajax")
	public ModelAndView getNetfuOnlineRecruitRegistCnt(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuOnlineRecruitService.selectNetfuOnlineRecruitRegistCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".getNetfuOnlineRecruitRegistCnt Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 면접 요청 기업
	 */
	@RequestMapping(value="/interviewRequestCompany.do")
	public ModelAndView interviewRequestCompany(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/interviewRequestCompany");
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
			
			// 면접 요청 기업
			List<Map<String, Object>> interviewRequestCompanyList = netfuOnlineRecruitService.selectInterviewRequestCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(interviewRequestCompanyList.size() > 0){
				totalSize = netfuOnlineRecruitService.selectInterviewRequestCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("list", interviewRequestCompanyList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".interviewRequestCompany Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 입사 지원 관리
	 */
	@RequestMapping(value="/personApplyList.do")
	public ModelAndView personApplicationList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/personApplyList");
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("applyType")))){
				commandMap.put("applyType", "online");
			}
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("searchType", (String)session.getAttribute("SE_USER_TYPE"));
			
			// 입사 지원 관리
			commandMap.put("applyType", "");
			List<Map<String, Object>> personApplyList = netfuOnlineRecruitService.selectApplyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(personApplyList.size() > 0){
				totalSize = netfuOnlineRecruitService.selectApplyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
						
			mv.addObject("map", commandMap.getMap());
			mv.addObject("totalSize", totalSize);
			mv.addObject("list", personApplyList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".personApplyList Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 입사 지원자 관리
	 */
	@RequestMapping(value="/companyApplicantList.do")
	public ModelAndView companyApplicantList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/companyApplicantList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("searchType", (String)session.getAttribute("SE_USER_TYPE"));
			
			// 입사 지원자 관리
			List<Map<String, Object>> companyApplicantList = netfuOnlineRecruitService.selectApplicantList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(companyApplicantList.size() > 0){
				totalSize = netfuOnlineRecruitService.selectApplicantCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			// 진행중인 채용정보
			commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyProceess(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("totalSize", totalSize);
			mv.addObject("list", companyApplicantList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".companyApplicantList Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 면접제의 요청관리
	 */
	@RequestMapping(value="/interviewSuggestList.do")
	public ModelAndView interviewSuggestList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/interviewSuggestList");
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("applyType", "interview");
			
			// 입사 지원자 관리
			List<Map<String, Object>> interviewList = netfuOnlineRecruitService.selectApplyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(interviewList.size() > 0){
				totalSize = netfuOnlineRecruitService.selectApplyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			// 진행중인 채용정보
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyProceess(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("totalSize", totalSize);
			mv.addObject("list", interviewList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".interviewSuggestList Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 입사지원 정보 저장
	 */
	@RequestMapping(value="/insertNetfuOnlineRecruit.ajax")
	public ModelAndView insertNetfuOnlineRecruit(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuOnlineRecruitService.insertNetfuOnlineRecruit(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".insertNetfuOnlineRecruit Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 입사지원 정보 삭제
	 */
	@RequestMapping(value="/deleteApplyMulti.ajax")
	public ModelAndView deleteApplyMulti(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuOnlineRecruitService.deleteNetfuOnlineRecruitMulti(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".deleteApplyMulti Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

}
