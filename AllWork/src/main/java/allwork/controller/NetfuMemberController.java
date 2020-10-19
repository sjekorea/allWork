package allwork.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuMemberService;


@Controller
public class NetfuMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	
	@RequestMapping(value="/personalJoin.do")
	public ModelAndView personalJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/personal/personalJoin");
		
		return mv;
	}
	
	
	@RequestMapping(value="/companyJoin.do")
	public ModelAndView companyJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/companyJoin");
		
		return mv;
	}

}
