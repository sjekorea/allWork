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

@Controller
public class CompanyController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	/*
	 * 기업회원 홈
	 */
	@RequestMapping(value="/companyHome")
	public ModelAndView companyHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/companyHome");
		
		try{
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			mv.addObject("map", commandMap.getMap());
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".companyHome Exception !!!!! \n"+e.toString());
		}
		
		
		
		return mv;
	}
	
	
	/*
	 * 채용정보 등록
	 */
	@RequestMapping(value="/recruitInfoReg")
	public ModelAndView recruitInfoReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitInfoReg");
		
		return mv;
	}
	

	/*
	 * 진행중인 채용정보
	 */
	@RequestMapping(value="/recruitListProgress")
	public ModelAndView recruitListProgress(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitListProgress");
		
		return mv;
	}
	

	/*
	 * 마감된 채용정보
	 */
	@RequestMapping(value="/recruitListClosed")
	public ModelAndView recruitListClosed(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitListClosed");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색
	 */
	@RequestMapping(value="/personSearch")
	public ModelAndView personSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSearch");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 직무별
	 */
	@RequestMapping(value="/personSearchByDuty")
	public ModelAndView personSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSearchByDuty");
		
		return mv;
	}
	
	
	/*
	 * 스크랩 인재
	 */
	@RequestMapping(value="/personScrapList")
	public ModelAndView personScrapList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personScrapList");
		
		return mv;
	}
	

	/*
	 * 맞춤인재정보 설정
	 */
	@RequestMapping(value="/personSearchSetting")
	public ModelAndView personSearchSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSearchSetting");
		
		return mv;
	}
	

	/*
	 * 맟춤인재정보
	 */
	@RequestMapping(value="/personSettedList")
	public ModelAndView personSettedList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSettedList");
		
		return mv;
	}
	
	
	/*
	 * 입사지원 관리
	 */
	@RequestMapping(value="/companyApplicantList")
	public ModelAndView companyApplicantList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/companyApplicantList");
		
		return mv;
	}


}
