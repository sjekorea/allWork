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
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value="/companyHome")
	public ModelAndView companyHome(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/companyHome");
		
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


}
