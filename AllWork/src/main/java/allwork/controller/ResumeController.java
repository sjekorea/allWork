package allwork.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

@Controller
public class ResumeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	/*
	 * 인재정보 검색
	 */
	@RequestMapping(value="/resumeSearch")
	public ModelAndView personSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearch");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 직무별
	 */
	@RequestMapping(value="/resumeSearchByDuty")
	public ModelAndView personSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchByDuty");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 상세
	 */
	@RequestMapping(value="/resumeDetail")
	public ModelAndView resumeDetail(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeDetail");
		
		return mv;
	}

}
