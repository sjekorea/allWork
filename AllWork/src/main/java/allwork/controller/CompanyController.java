package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
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
	
	@Resource(name="netfuOnlineRecruitService")
	private NetfuOnlineRecruitService netfuOnlineRecruitService;
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
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
			
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			commandMap.put("start", 0);
			commandMap.put("pageSize", 3);
			commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("bizIng", "no");
			// 진행중인 채용정보
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyListByCompany(commandMap.getMap());
		
			
			commandMap.put("pageSize", 10);
			commandMap.put("orderRule", "wdate desc");
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
	 * 채용정보 등록
	 */
	@RequestMapping(value="/recruitInfoReg.do")
	public ModelAndView recruitInfoReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitInfoReg");
		
		return mv;
	}


}
