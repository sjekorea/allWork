package allwork.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

public class FitPersonController {
	

	/*
	 * 맞춤인재정보 설정
	 */
	@RequestMapping(value="/fitPersonSetting")
	public ModelAndView fitPersonSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/fitPersonSetting");
		
		return mv;
	}
	

	/*
	 * 맟춤인재정보
	 */
	@RequestMapping(value="/fitPersonList")
	public ModelAndView fitPersonList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/fitPersonList");
		
		return mv;
	}

}
