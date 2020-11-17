package allwork.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuConcernService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuScrapService;

@Controller
public class RecruitController {
	  
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;	

	@Resource(name="netfuCompanyService")
	private NetfuCompanyService netfuCompanyService;	

	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;	

	@Resource(name="netfuConcernService")
	private NetfuConcernService netfuConcernService;	
	
	
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
	@RequestMapping(value="/recruitDetail", method = RequestMethod.POST)
	public ModelAndView recruitDetail(CommandMap commandMap, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitDetail");
		
		try{
			
			System.out.println("RecruitController.recruitDetail ==> no : "+commandMap.getMap().get("no"));
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			// 기업정보 select
			Map<String, Object> companyMap = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());
			
			// 채용정보 select
			Map<String, Object> recruitMap = netfuItemCompanyService.selectNetfuItemCompanyMap(commandMap.getMap());
			
			// 스크랩 여부
			int scrapCnt = netfuScrapService.selectNetfuScrapCnt(commandMap.getMap());
			
			// 관심기업 여부
			int concernCnt = netfuConcernService.selectNetfuConcernRegistCnt(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("companyMap", companyMap);
			mv.addObject("recruitMap", recruitMap);
			mv.addObject("scrapCnt", scrapCnt);
			mv.addObject("concernCnt", concernCnt);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitDetail Exception !!!!! \n"+e.toString());
		}
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
