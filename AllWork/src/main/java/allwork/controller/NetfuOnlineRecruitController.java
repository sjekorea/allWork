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
			
			// 스크랩 공고
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
			
			// 스크랩 공고
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

}
