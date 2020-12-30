package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.ConvertUtil;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuMyServiceService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMyServiceService")
	private NetfuMyServiceService netfuMyServiceService;
	
	@RequestMapping(value={"/", "/index.do"})
	public ModelAndView home(CommandMap commandMap, Locale locale) {
		
		log.info("Welcome home! The client locale is {}.");
		
		ModelAndView mv = new ModelAndView("/index");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mv.addObject("serverTime", formattedDate );
		
		return mv;
	}
	
	
	/*
	 * 통합 검색 결과 조회(개인회원용 ---> 채용정보 조회)
	 */
	@RequestMapping(value="/indexRecruitSearchList.do")
	public ModelAndView indexRecruitSearchList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/indexRecruitSearchList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 맞춤 채용 정보
			List<Map<String, Object>> myServiceRecruitList = netfuMyServiceService.selectMyServiceRecruitList(commandMap.getMap());
			
			mv.addObject("myServiceRecruitList", myServiceRecruitList);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".indexRecruitSearchList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 통합 검색 결과 조회(기업회원용 ---> 인재정보 조회)
	 */
	@RequestMapping(value="/indexResumeSearchList.do")
	public ModelAndView indexResumeSearchList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/indexResumeSearchList");
		
		return mv;
	}
	
}
