package allwork.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuItemResumeService;

@Controller
public class ResumeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;
	
	
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
	
	
	/*
	 * 등록된 이력서 갯수
	 */
	@RequestMapping(value="/selectNetfuItemResumeCnt.ajax")
	public ModelAndView selectNetfuItemResumeCnt(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.debug(this.getClass().getName()+" selectNetfuItemResumeCnt.ajax Exception!!!!  "+e.toString());
		}
		return mv;
	}

}
