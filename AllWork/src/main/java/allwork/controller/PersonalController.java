package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuScrapService;

@Controller
public class PersonalController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;
	
	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;
	
	@RequestMapping(value="/personalHome")
	public ModelAndView personalHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/personal/personalHome");
		
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			// 등록된 이력서 갯수
			int netfuItemResumeCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			// 온라인 입사지원 수
			int netfuItemCompanyCnt = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
			// 스크랩한 채용정보
			int netfuScrapCnt = netfuScrapService.selectNetfuScrapCnt(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			//log.info("########### memberMap : \n"+memberMap.toString());
			mv.addObject("netfuItemResumeCnt", netfuItemResumeCnt);
			mv.addObject("netfuItemCompanyCnt", netfuItemCompanyCnt);
			mv.addObject("netfuScrapCnt", netfuScrapCnt);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".personalHome Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="/recruitSearch")
	public ModelAndView recruitSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/personal/recruitSearch");
		
		return mv;
	}
	
	
	@RequestMapping(value="/recruitSearchByDuty")
	public ModelAndView recruitSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/personal/recruitSearchByDuty");
		
		return mv;
	}

	
	@RequestMapping(value="/resumeInfoReg")
	public ModelAndView resumeInfoReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/personal/resumeInfoReg");
		
		return mv;
	}
}
