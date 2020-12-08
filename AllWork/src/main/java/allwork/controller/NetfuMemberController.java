package allwork.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuMemberService;


@Controller
public class NetfuMemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	
	@RequestMapping(value="/memberAgree1.do")
	public ModelAndView memberAgree1(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree1");
		
		return mv;
	}
	
	@RequestMapping(value="/memberAgree2.do")
	public ModelAndView memberAgree2(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree2");
		
		return mv;
	}
	
	@RequestMapping(value="/memberAgree3.do")
	public ModelAndView memberAgree3(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree3");
		
		return mv;
	}
	
	
	@RequestMapping(value="/personJoin.do")
	public ModelAndView personalJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/personJoin");
		
		return mv;
	}
	
	
	@RequestMapping(value="/companyJoin.do")
	public ModelAndView companyJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/companyJoin");
		
		return mv;
	}

	
	/*
	 * 회원가입(회원정보 등록)
	 */
	@RequestMapping(value="/registNetfuMember.ajax")
	public ModelAndView registNetfuMember(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuMemberService.insertNetfuMember(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registNetfuMember Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
}
