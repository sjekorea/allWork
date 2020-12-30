package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuConcernService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuScrapService;
import allwork.service.RecruitOtherService;

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

	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;		

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;		

	@Resource(name="recruitOtherService")
	private RecruitOtherService recruitOtherService;	
	
	
	/*
	 * 채용정보 검색
	 */
	@RequestMapping(value="/recruitSearch.do")
	public ModelAndView recruitSearch(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearch");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("taskJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearch Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 직무별
	 */
	@RequestMapping(value="/recruitSearchByDuty.do")
	public ModelAndView recruitSearchByDuty(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchByDuty");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearchByDuty Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 산업별
	 */
	@RequestMapping(value="/recruitSearchByIndustry.do")
	public ModelAndView recruitSearchByIndustry(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchByIndustry");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearchByIndustry Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 지역별
	 */
	@RequestMapping(value="/recruitSearchByArea.do")
	public ModelAndView recruitSearchByArea(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchByArea");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("areaList", areaList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearchByArea Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 알바 채용
	 */
	@RequestMapping(value="/recruitSearchForAlba.do")
	public ModelAndView recruitSearchForAlba(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchForAlba");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			commandMap.put("infoType", "2");
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("taskJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearch Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 프리랜서 채용
	 */
	@RequestMapping(value="/recruitSearchForFree.do")
	public ModelAndView recruitSearchForFree(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitSearchForFree");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			commandMap.put("infoType", "4");
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			commandMap.put("pCode", "");
			
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("taskJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitSearchForFree Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 기타 채용 정보
	 */
	@RequestMapping(value="/recruitOther.do")
	public ModelAndView recruitOther(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitOther");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = recruitOtherService.selectRecruitOtherList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = recruitOtherService.selectRecruitOtherCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitOther Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 상세
	 */
	@RequestMapping(value="/recruitDetail.do", method = RequestMethod.POST)
	public ModelAndView recruitDetail(CommandMap commandMap, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitDetail");
		
		try{
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 기업정보 select
			commandMap.put("uid", commandMap.get("companyUid"));
			Map<String, Object> companyMap = netfuCompanyService.selectNetfuCompanyMap(commandMap.getMap());
			
			// 채용정보 select
			commandMap.put("uid", commandMap.get("companyUid"));
			commandMap.put("no", commandMap.get("recruitNo"));
			Map<String, Object> recruitMap = netfuItemCompanyService.selectNetfuItemCompanyMap(commandMap.getMap());
			
			// 스크랩 여부
			commandMap.put("uid", commandMap.get("loginId"));
			commandMap.put("no", commandMap.get("recruitNo"));
			int scrapCnt = netfuScrapService.selectNetfuScrapRegistCnt(commandMap.getMap());
			
			// 관심기업 여부
			commandMap.put("uid", commandMap.get("loginId"));
			commandMap.put("no", commandMap.get("recruitNo"));
			int concernCnt = netfuConcernService.selectNetfuConcernRegistCnt(commandMap.getMap());
			
			// 등록 이력서 갯수
			commandMap.put("uid", commandMap.get("loginId"));
			int resumeCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("companyMap", companyMap);
			mv.addObject("recruitMap", recruitMap);
			mv.addObject("scrapCnt", scrapCnt);
			mv.addObject("concernCnt", concernCnt);
			mv.addObject("resumeCnt", resumeCnt);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitDetail Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	

	/*
	 * 진행중인 채용정보
	 */
	@RequestMapping(value="/recruitListProgress.do")
	public ModelAndView recruitListProgress(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitListProgress");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderRule", "nic.wdate desc");
				commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
				commandMap.put("bizIng", "no");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyListByCompany(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCntByCompany(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitListProgress Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	

	/*
	 * 마감된 채용정보
	 */
	@RequestMapping(value="/recruitListClosed.do")
	public ModelAndView recruitListClosed(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/recruit/recruitListClosed");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nic.wdate");
				commandMap.put("orderRule", "desc");
				commandMap.put("companyUid", (String)session.getAttribute("SE_LOGIN_ID"));
				commandMap.put("bizIng", "");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyListByCompany(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(recruitList.size() > 0){
				totalSize = netfuItemCompanyService.selectNetfuItemCompanyCntByCompany(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("recruitList", recruitList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitListClosed Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	
	

}
