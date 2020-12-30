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
	 * 공지사항 목록
	 */
	@RequestMapping(value="/noticeList.do")
	public ModelAndView noticeList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/noticeList");
		
		return mv;
	}
	
	
	/*
	 * 공지사항 보기
	 */
	@RequestMapping(value="/noticeView.do")
	public ModelAndView noticeView(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/noticeView");
		
		return mv;
	}
	
	
	/*
	 * 공지사항 등록
	 */
	@RequestMapping(value="/noticeReg")
	public ModelAndView noticeReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/noticeReg");
		
		return mv;
	}
	

	/*
	 * 게시판 목록
	 */
	@RequestMapping(value="/boardList.do")
	public ModelAndView boardList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/boardList");
		
		return mv;
	}
	
	
	/*
	 * 게시판 보기
	 */
	@RequestMapping(value="/boardView.do")
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
