package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuConcernService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuScrapService;

@Controller
public class ScrapRecruitCompanyController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;
	
	@Resource(name="netfuConcernService")
	private NetfuConcernService netfuConcernService;
	
	
	/*
	 * 스크랩 채용정보
	 */
	@RequestMapping(value="/recruitScrapList")
	public ModelAndView recruitScrapList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/recruitScrapList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
			// 스크랩 공고
			List<Map<String, Object>> recruitScrapList = netfuScrapService.selectNetfuScrapList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitScrapList.size() > 0){
				totalSize = netfuScrapService.selectNetfuScrapCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("recruitScrapList", recruitScrapList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitScrapList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 스크랩 채용정보 등록
	 */
	@RequestMapping(value="/registScrap.ajax")
	public ModelAndView registNetfuScrap(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuScrapService.insertNetfuScrap(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registNetfuScrap Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 스크랩 채용정보 삭제
	 */
	@RequestMapping(value="/deleteRecruitScrapMulti.ajax")
	public ModelAndView deleteRecruitScrapMulti(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuScrapService.deleteNetfuScrapMulti(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".deleteRecruitScrapMulti Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	
	/*
	 * 관심기업 등록 여부
	 */
	@RequestMapping(value="/getNetfuConcernRegistCnt.ajax")
	public ModelAndView getNetfuConcernRegistCnt(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuConcernService.selectNetfuConcernRegistCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".getNetfuConcernRegistCnt Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 관심기업 목록
	 */
	@RequestMapping(value="/interestCompanyList")
	public ModelAndView interestCompanyList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/interestCompanyList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
			// 관심기업 목록
			List<Map<String, Object>> netfuConcernList = netfuConcernService.selectNetfuConcernList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(netfuConcernList.size() > 0){
				totalSize = netfuConcernService.selectNetfuConcernCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("netfuConcernList", netfuConcernList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".interestCompanyList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 관심기업 등록
	 */
	@RequestMapping(value="/registNetfuConcern.ajax")
	public ModelAndView registNetfuConcern(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuConcernService.insertNetfuConcern(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registNetfuConcern Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	

	/*
	 * 관심기업  삭제
	 */
	@RequestMapping(value="/deleteNetfuConcernMulti.ajax")
	public ModelAndView deleteNetfuConcernMulti(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuConcernService.deleteNetfuConcernMulti(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".deleteNetfuConcernMulti Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 면접 요청 기업
	 */
	@RequestMapping(value="/interviewRequestCompany")
	public ModelAndView interviewRequestCompany(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/interviewRequestCompany");
		
		return mv;
	}

}
