package allwork.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

@Controller
public class RecruitController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	/*
	 * 채용정보 검색
	 */
	@RequestMapping(value="/recruitSearch")
	public ModelAndView recruitSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearch");
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 직무별
	 */
	@RequestMapping(value="/recruitSearchByDuty")
	public ModelAndView recruitSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchByDuty");
		
		return mv;
	}
	
	

	/*
	 * 채용정보 상세
	 */
	@RequestMapping(value="/recruitDetail")
	public ModelAndView recruitDetail(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitDetail");
		
		return mv;
	}
	

	

	/*
	 * 진행중인 채용정보
	 */
	@RequestMapping(value="/recruitListProgress")
	public ModelAndView recruitListProgress(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitListProgress");
		
		return mv;
	}
	

	/*
	 * 마감된 채용정보
	 */
	@RequestMapping(value="/recruitListClosed")
	public ModelAndView recruitListClosed(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitListClosed");
		
		return mv;
	}
	

}
