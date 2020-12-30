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
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.CommonUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuMyServiceService;

@Controller
public class NetfuMyServiceController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;
	
	
	/*
	 * 맟춤채용정보
	 */
	@RequestMapping(value="/fitRecruitList.do")
	public ModelAndView fitRecruitList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderRule", "nic.wdate desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
			// 맞춤 채용정보 목록
			List<Map<String, Object>> myServiceRecruitList = netfuMyServiceService.selectMyServiceRecruitList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(myServiceRecruitList.size() > 0){
				totalSize = netfuMyServiceService.selectMyServiceRecruitCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("myServiceMap", myServiceMap);
			mv.addObject("myServiceRecruitList", myServiceRecruitList);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("pageMap", pageMap);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitRecruitList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 맟춤채용정보 설정 화면
	 */
	@RequestMapping(value="/fitRecruitSetting.do")
	public ModelAndView fitRecruitSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitSetting");
		
		try{
			mv.addObject("careerRange", CommonUtil.getNumberRanage(1, 20));
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitRecruitSetting Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 맟춤채용정보 저장
	 */
	@RequestMapping(value="/registMyService.ajax")
	public ModelAndView registMyService(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuMyServiceService.insertNetfuMyService(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registMyService Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	

	/*
	 * 맞춤인재정보 설정
	 */
	@RequestMapping(value="/fitResumeSetting.do")
	public ModelAndView fitResumeSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/fitResumeSetting");
		
		try{
			mv.addObject("careerRange", CommonUtil.getNumberRanage(1, 20));
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitResumeSetting Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	

	/*
	 * 맟춤인재정보
	 */
	@RequestMapping(value="/fitResumeList.do")
	public ModelAndView fitResumeList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/fitResumeList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderRule", "nir.wdate desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			// 맞춤 인재 정보 목록
			List<Map<String, Object>> myServiceResumeList = netfuMyServiceService.selectMyServiceResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(myServiceResumeList.size() > 0){
				totalSize = netfuMyServiceService.selectMyServiceResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("myServiceMap", myServiceMap);
			mv.addObject("myServiceResumeList", myServiceResumeList);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("pageMap", pageMap);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitResumeList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}

}
