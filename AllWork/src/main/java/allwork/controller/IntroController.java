package allwork.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

@Controller
public class IntroController {

	Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value="/introAbout.do")
	public ModelAndView introAbout(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/introAbout");
		
		return mv;
	}
	
	
	@RequestMapping(value="/introBusiness.do")
	public ModelAndView introBusiness(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/introBusiness");
		
		return mv;
	}
	
	
	@RequestMapping(value="/introLocation.do")
	public ModelAndView introLocation(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/introLocation");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership01.do")
	public ModelAndView partnership01(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership01");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership02.do")
	public ModelAndView partnership02(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership02");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership03.do")
	public ModelAndView partnership03(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership03");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership04.do")
	public ModelAndView partnership04(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership04");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership05.do")
	public ModelAndView partnership05(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership05");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership06.do")
	public ModelAndView partnership06(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership06");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership07.do")
	public ModelAndView partnership07(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership07");
		
		return mv;
	}
	
	
	@RequestMapping(value="/partnership08.do")
	public ModelAndView partnership08(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/introduction/partnership08");
		
		return mv;
	}
	
}
