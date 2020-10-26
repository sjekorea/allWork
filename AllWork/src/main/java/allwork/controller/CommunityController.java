package allwork.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;

@Controller
public class CommunityController {
	
	Logger log = Logger.getLogger(this.getClass());
	

	/*
	 * 게시판 목록
	 */
	@RequestMapping(value="/boardList")
	public ModelAndView boardList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/boardList");
		
		return mv;
	}
	
	
	/*
	 * 게시판 보기
	 */
	@RequestMapping(value="/boardView")
	public ModelAndView boardView(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/boardView");
		
		return mv;
	}
	
	
	/*
	 * 게시판 등록
	 */
	@RequestMapping(value="/boardReg")
	public ModelAndView boardReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/boardReg");
		
		return mv;
	}

}
