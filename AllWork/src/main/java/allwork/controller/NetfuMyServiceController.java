package allwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.CommonUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.MakeQueryUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuMyServiceService;

@Controller
public class NetfuMyServiceController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;	
	
	
	/*
	 * 맟춤채용정보
	 */
	@RequestMapping(value="/fitRecruitList.do")
	public ModelAndView fitRecruitList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderRule", "nic.wdate desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 맞춤 채용정보 목록
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			List<Map<String, Object>> myServiceRecruitList = new ArrayList<Map<String, Object>>();
			if (myServiceMap != null && !myServiceMap.isEmpty()) {
				//맞춤서비스가 설정된 경우.
				commandMap = MakeQueryUtil.makeMyRecruitQuery(commandMap, myServiceMap);
				myServiceRecruitList = netfuMyServiceService.selectMyServiceRecruitList(commandMap.getMap());
			}

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
	public ModelAndView fitRecruitSetting(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitSetting");
		
		try{
			
			commandMap.put("pCode", "");
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			// 고용형태  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 급여종류  ( netfu_cate : type ='inid_pay' )
			commandMap.put("type", "inid_pay");
			List<Map<String, Object>> inidPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
						
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> msMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonText = mapper.writeValueAsString(msMap);
			
			mv.addObject("json", jsonText);
			mv.addObject("msMap", msMap);
			mv.addObject("jobList", jobList);
			mv.addObject("areaList", areaList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("inidPayList", inidPayList);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitRecruitSetting Exception !!!!! \n"+e.toString());
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
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderRule", "nir.wdate desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			
			// 맞춤 인재 정보 목록
			Map<String, Object> myServiceMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			List<Map<String, Object>> myServiceResumeList = new ArrayList<Map<String, Object>>();
			if (myServiceMap != null && !myServiceMap.isEmpty()) {
				//맞춤서비스가 설정된 경우.
				commandMap = MakeQueryUtil.makeMyResumeQuery(commandMap, myServiceMap);
				myServiceResumeList = netfuMyServiceService.selectMyServiceResumeList(commandMap.getMap());
			}
			
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
	

	/*
	 * 맞춤인재정보 설정
	 */
	@RequestMapping(value="/fitResumeSetting.do")
	public ModelAndView fitResumeSetting(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/fitResumeSetting");
		
		try{
			
			commandMap.put("pCode", "");
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			// 고용형태  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 급여종류  ( netfu_cate : type ='inid_pay' )
			commandMap.put("type", "inid_pay");
			List<Map<String, Object>> inidPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
						
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> msMap = netfuMyServiceService.selectNetfuMyServiceMap(commandMap.getMap());
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonText = mapper.writeValueAsString(msMap);
			
			mv.addObject("json", jsonText);
			mv.addObject("msMap", msMap);
			mv.addObject("jobList", jobList);
			mv.addObject("areaList", areaList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("inidPayList", inidPayList);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitResumeSetting Exception !!!!! \n"+e.toString());
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
	 * 맟춤채용정보 수정
	 */
	@RequestMapping(value="/updateMyService.ajax")
	public ModelAndView updateMyService(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuMyServiceService.updateNetfuMyService(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".updateMyService Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

}
