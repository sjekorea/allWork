package allwork.controller;

import java.util.ArrayList;
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
import allwork.vo.NetfuBannerVo;
import allwork.vo.NetfuItemCompanyVo;

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

			// 롤배너 정보 - 상단 롤배너
			//(TBD)
			List<Map<String, Object>> rollBannerListTop = homeCommonService.selectMainTopRollBannerList(commandMap.getMap());

			// 롤배너 정보 - 하단 롤배너
			List<Map<String, Object>> rollBannerList = homeCommonService.selectMainRollBannerList(commandMap.getMap());
			List<NetfuBannerVo> rollBannerList02 = new ArrayList<NetfuBannerVo>();
			if (rollBannerList.size() > 6) {
				for (int index = 6; index < rollBannerList.size(); index++)
					rollBannerList02.add((NetfuBannerVo) rollBannerList.get(index));
			}
			
			//전체 일반채용공고 개수.
			int totalRecruitCount = 0;
			totalRecruitCount = recruitOtherService.selectRecruitOtherCnt(commandMap.getMap());

			//금일등록 일반채용공고 개수.
			int todayRecruitCount = 0;
			for (int interval = 0; interval < 7; interval++) {
				commandMap.put("interval", interval);
				todayRecruitCount = recruitOtherService.selectTodayRecruitOtherCnt(commandMap.getMap());
				if (todayRecruitCount > 100) break;
			}
	
			// 채용정보 1 - 유료 채용공고 우선적으로 표출. 유료채용공고가 부족한 경우에는 일반정보 추가.
			List<NetfuItemCompanyVo> mainRecruitList = new ArrayList<NetfuItemCompanyVo>();
			List<Map<String, Object>> mainRecruitList1 = homeCommonService.selectMainPayRecruitList(commandMap.getMap());
			for (int j = 0; j < mainRecruitList1.size(); j++) {
				NetfuItemCompanyVo item = (NetfuItemCompanyVo) mainRecruitList1.get(j);
				mainRecruitList.add(item);
			}
			if(mainRecruitList.size() < 6) {
				List<Map<String, Object>> mainRecruitList2 = homeCommonService.selectMainRecruitList(commandMap.getMap());
				for (int i = mainRecruitList.size(), j = 0; i < 6 && j < mainRecruitList2.size(); i++, j++) {
					NetfuItemCompanyVo item = (NetfuItemCompanyVo) mainRecruitList2.get(j);
					mainRecruitList.add(item);
				}
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
			
			// 일반채용정보
			commandMap.put("pageSize", 8);
			List<Map<String, Object>> recruitOtherList = recruitOtherService.selectRecruitOtherList(commandMap.getMap());
			
			mv.addObject("bannerList", bannerList);
			mv.addObject("rollBannerListTop", rollBannerListTop);
			mv.addObject("rollBannerList", rollBannerList);
			mv.addObject("rollBannerList02", rollBannerList02);
			mv.addObject("totalRecruitCount", totalRecruitCount);
			mv.addObject("todayRecruitCount", todayRecruitCount);
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
			mv.addObject("map", commandMap.getMap());
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
			mv.addObject("map", commandMap.getMap());
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".indexResumeSearchList Exception !!!!! \n"+e.toString());
		}
		//(end) 2020.12.30 by s.yoo

		return mv;
	}
	
}
