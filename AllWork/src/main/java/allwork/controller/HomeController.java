package allwork.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.ai.domains.AiSearchModel;
import com.ilmagna.allworkadmin.ai.services.AiSearchService;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;
import com.ilmagna.allworkadmin.api.services.ApiRecruitItemService;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.service.HomeCommonService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuMyServiceService;
import allwork.service.RecruitOtherService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="homeCommonService")
	private HomeCommonService homeCommonService;	

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;	

	@Resource(name="recruitOtherService")
	private RecruitOtherService recruitOtherService;	
	

   	//(begin) 2020.12.30 by s.yoo
	@Resource(name="apiRecruitItemService")
	protected ApiRecruitItemService headhuntService;
	
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
		
		ModelAndView mv = new ModelAndView("/index");
		
		try{
			
			commandMap.put("start", 0);
			commandMap.put("pageSize", 8);
			commandMap.put("orderField", "nic.no");
			commandMap.put("orderRule", "desc");
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// banner 정보
			List<Map<String, Object>> bannerList = homeCommonService.selectMainBannerList(commandMap.getMap());
			
			// 롤 배너 정보
			List<Map<String, Object>> rollBannerList = homeCommonService.selectMainRollBannerList(commandMap.getMap());
			
			// 채용정보 1
			List<Map<String, Object>> mainRecruitList = homeCommonService.selectMainPayRecruitList(commandMap.getMap());
			if(mainRecruitList.size() <= 5){
				mainRecruitList = homeCommonService.selectMainRecruitList(commandMap.getMap());
			}
			
			//헤디헌팅 채용공고
			ApiRecruitItemModel model = new ApiRecruitItemModel();
			model.setShowAll("N");
			//model.setPagerEnableYn("Y");
			//model.setPage(1);
			//model.setRows(8);
			model.setStartIdx(0);
			model.setEndIdx(8);
			List<ApiRecruitItemModel> headhuntList = headhuntService.getRecruitItemList(model);

			// 기업회원 등록 채용공고
			commandMap.put("showAll", 0);

			commandMap.put("infoType", "1");
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			
			// 프리랜서 채용공고
			commandMap.put("infoType", "4");
			List<Map<String, Object>> recruitFreeList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			
			// 알바 채용공고
			commandMap.put("infoType", "2");
			List<Map<String, Object>> recruitAlbaList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			
			// 기타 채용정보
			commandMap.put("pageSize", 8);
			List<Map<String, Object>> recruitOtherList = recruitOtherService.selectRecruitOtherList(commandMap.getMap());
			
			mv.addObject("bannerList", bannerList);
			mv.addObject("rollBannerList", rollBannerList);
			mv.addObject("mainRecruitList", mainRecruitList);
			mv.addObject("headhuntList", headhuntList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("recruitFreeList", recruitFreeList);
			mv.addObject("recruitAlbaList", recruitAlbaList);
			mv.addObject("recruitOtherList", recruitOtherList);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".home Exception!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 통합 검색 결과 조회(개인회원용 ---> 채용정보 조회)
	 */
	@RequestMapping(value="/indexRecruitSearchList.do")
	public ModelAndView indexRecruitSearchList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/indexRecruitSearchList");
		
		try{
			
		   	//(begin) 2020.12.30 by s.yoo
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
