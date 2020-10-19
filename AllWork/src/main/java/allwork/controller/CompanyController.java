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
			log.info(this.getClass().getName()+".personalHome Exception !!!!! \n"+e.toString());
		}
		
		
		
		return mv;
	}
	
	
	@RequestMapping(value="/recruitInfoReg")
	public ModelAndView recruitInfoReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/recruitInfoReg");
		
		return mv;
	}
	
	
	@RequestMapping(value="/personSearch")
	public ModelAndView personSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSearch");
		
		return mv;
	}
	
	
	@RequestMapping(value="/personSearchByDuty")
	public ModelAndView personSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/personSearchByDuty");
		
		return mv;
	}


}
