package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

@Controller
public class OthersController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/sitemap.do")
	public ModelAndView sitemap(CommandMap commandMap, Locale locale) {
		
		ModelAndView mv = new ModelAndView("/others/sitemap");
		
		return mv;
	}
	
	@RequestMapping(value="/privacyPolicy.do")
	public ModelAndView privacyPolicy(CommandMap commandMap, Locale locale) {
		
		ModelAndView mv = new ModelAndView("/others/privacyPolicy");
		
		return mv;
	}
	
	@RequestMapping(value="/termsOfService.do")
	public ModelAndView termsOfService(CommandMap commandMap, Locale locale) {
		
		ModelAndView mv = new ModelAndView("/others/termsOfService");
		
		return mv;
	}

}
