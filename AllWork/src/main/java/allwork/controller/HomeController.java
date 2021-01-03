package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.ai.domains.AiSearchModel;
import com.ilmagna.allworkadmin.ai.services.AiSearchService;

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
	

   	//(begin) 2020.12.30 by s.yoo
	@Value("${ai.online}")
	private boolean ai_online;
	
	@Value("${ai.url.search.recruit.allwork}")
	private String ai_url_search_recruit_allwork;
	
	@Value("${ai.url.search.recruit.worknet}")
	private String ai_url_search_recruit_worknet;
	
	@Value("${ai.url.search.resume}")
	private String ai_url_search_resume;
	
	@Resource(name="aiSearchService")
	protected AiSearchService searchService;
   	//(end) 2020.12.30 by s.yoo

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
		
	   	//(begin) 2020.12.30 by s.yoo
		/*
		int pageSize = 10;
		int totalSize = 0;
		*/
		//(end) 2020.12.30 by s.yoo

		try{
			
		   	//(begin) 2020.12.30 by s.yoo
			/*
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
			*/

			//시멘틱 검색작업 수행.
			AiSearchModel modelSearch = new AiSearchModel();
			modelSearch.setKeyword((String) commandMap.get("q"));
			AiSearchModel item = searchService.procSearch(true, modelSearch, ai_online, ai_url_search_recruit_allwork, ai_url_search_recruit_worknet, ai_url_search_resume);

			//검색결과 View 표출.
			mv.addObject("item", item);
			//(end) 2020.12.30 by s.yoo
			
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
		
		//(begin) 2020.12.30 by s.yoo
		try{
			//시멘틱 검색작업 수행.
			AiSearchModel modelSearch = new AiSearchModel();
			modelSearch.setKeyword((String) commandMap.get("q"));
			AiSearchModel item = searchService.procSearch(false, modelSearch, ai_online, ai_url_search_recruit_allwork, ai_url_search_recruit_worknet, ai_url_search_resume);

			//검색결과 View 표출.
			mv.addObject("item", item);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".indexResumeSearchList Exception !!!!! \n"+e.toString());
		}
		//(end) 2020.12.30 by s.yoo

		return mv;
	}
	
}
