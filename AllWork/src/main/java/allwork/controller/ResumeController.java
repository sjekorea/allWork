package allwork.controller;

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
import allwork.common.QueryParser;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;
import allwork.service.RecruitViewService;

@Controller
public class ResumeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;

	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;

	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;

	@Resource(name="netfuOnlineRecruitService")
	private NetfuOnlineRecruitService netfuOnlineRecruitService;

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;	

	@Resource(name="recruitViewService")
	private RecruitViewService recruitViewService;

	@Resource(name="netfuCompanyService")
	private NetfuCompanyService netfuCompanyService;
	
	
	/*
	 * 인재정보 검색
	 */
	@RequestMapping(value="/resumeSearch.do")
	public ModelAndView resumeSearch(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearch");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());

			// 검색 Query 생성.
			String strQueryBizType = QueryParser.genQueryResumeBizType((String) commandMap.get("inidType"));
			String strQueryIndustry = QueryParser.genQueryResumeIndustry((String) commandMap.get("inidAreaJob"));
			String strQueryArea = QueryParser.genQueryResumeArea((String) commandMap.get("inidArea"));
			String strQueryLicense = QueryParser.genQueryResumeLicense((String) commandMap.get("inidLicense"), netfuCateService);
			String strQueryCareer = QueryParser.genQueryResumeCareer((String) commandMap.get("inidCareer"));
			String strQuerySchool = QueryParser.genQueryResumeSchool((String) commandMap.get("inidSchool"));
			String strQueryJobForm = QueryParser.genQueryResumeJobForm((String) commandMap.get("inidJobform"));
			String strQueryPay = QueryParser.genQueryResumePay((String) commandMap.get("inidPay"));

			// 채용정보 검색 리스트
			commandMap.put("inidType", strQueryBizType);
			commandMap.put("inidAreaJob", strQueryIndustry);
			commandMap.put("inidArea", strQueryArea);
			commandMap.put("inidLicense", strQueryLicense);
			commandMap.put("inidCareer", strQueryCareer);
			commandMap.put("inidSchool", strQuerySchool);
			commandMap.put("inidJobform", strQueryJobForm);
			commandMap.put("inidPay", strQueryPay);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
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
			
			// 자격증  ( netfu_cate : type ='inid_mylskill' )
			commandMap.put("type", "inid_mylskill");
			List<Map<String, Object>> inidMySkillList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 경력별  ( netfu_cate : type ='job_career' )
			commandMap.put("type", "job_career");
			List<Map<String, Object>> jobCareerList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 학력별  ( netfu_cate : type ='job_school' )
			commandMap.put("type", "job_school");
			List<Map<String, Object>> jobSchoolList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 고용형태별  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 연봉별  ( netfu_cate : type ='job_pay' )
			commandMap.put("type", "job_pay");
			List<Map<String, Object>> jobPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("inidMySkillList", inidMySkillList);
			mv.addObject("jobCareerList", jobCareerList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("jobPayList", jobPayList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearch Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 직무별
	 */
	@RequestMapping(value="/resumeSearchByDuty.do")
	public ModelAndView resumeSearchByDuty(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchByDuty");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());

			// 검색 Query 생성.
			String strQueryBizType = QueryParser.genQueryResumeBizType((String) commandMap.get("inidType"));

			// 채용정보 검색 리스트
			commandMap.put("inidType", strQueryBizType);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
			commandMap.put("pCode", "");
			
			// 직무별  목록 ( netfu_cate : type = 'job' || 'task_job' )
			commandMap.put("type", "job");
			List<Map<String, Object>> jobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearchByDuty Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 산업별
	 */
	@RequestMapping(value="/resumeSearchByIndustry.do")
	public ModelAndView resumeSearchByIndustry(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchByIndustry");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());

			// 검색 Query 생성.
			String strQueryIndustry = QueryParser.genQueryResumeIndustry((String) commandMap.get("inidAreaJob"));

			// 채용정보 검색 리스트
			commandMap.put("inidAreaJob", strQueryIndustry);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
			commandMap.put("pCode", "");
			
			// 산업별 목록  ( netfu_cate : type = 'area_job' )
			commandMap.put("type", "area_job");
			List<Map<String, Object>> areaJobList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearchByIndustry Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 지역별
	 */
	@RequestMapping(value="/resumeSearchByArea.do")
	public ModelAndView resumeSearchByArea(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchByArea");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());

			// 검색 Query 생성.
			String strQueryArea = QueryParser.genQueryResumeArea((String) commandMap.get("inidArea"));

			// 채용정보 검색 리스트
			commandMap.put("inidArea", strQueryArea);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
			commandMap.put("pCode", "");
			
			// 지역별  ( netfu_cate : type ='area' )
			commandMap.put("type", "area");
			List<Map<String, Object>> areaList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("areaList", areaList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearchByArea Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 알바 지원
	 */
	@RequestMapping(value="/resumeSearchForAlba.do")
	public ModelAndView resumeSearchForAlba(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchForAlba");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			commandMap.put("infoType", "2");
			
			//System.out.println("INFO_TYPE : "+(String)commandMap.get("infoType"));

			// 검색 Query 생성.
			String strQueryBizType = QueryParser.genQueryResumeBizType((String) commandMap.get("inidType"));
			String strQueryIndustry = QueryParser.genQueryResumeIndustry((String) commandMap.get("inidAreaJob"));
			String strQueryArea = QueryParser.genQueryResumeArea((String) commandMap.get("inidArea"));
			String strQueryLicense = QueryParser.genQueryResumeLicense((String) commandMap.get("inidLicense"), netfuCateService);
			String strQueryCareer = QueryParser.genQueryResumeCareer((String) commandMap.get("inidCareer"));
			String strQuerySchool = QueryParser.genQueryResumeSchool((String) commandMap.get("inidSchool"));
			String strQueryJobForm = QueryParser.genQueryResumeJobForm((String) commandMap.get("inidJobform"));
			String strQueryPay = QueryParser.genQueryResumePay((String) commandMap.get("inidPay"));

			// 채용정보 검색 리스트
			commandMap.put("inidType", strQueryBizType);
			commandMap.put("inidAreaJob", strQueryIndustry);
			commandMap.put("inidArea", strQueryArea);
			commandMap.put("inidLicense", strQueryLicense);
			commandMap.put("inidCareer", strQueryCareer);
			commandMap.put("inidSchool", strQuerySchool);
			commandMap.put("inidJobform", strQueryJobForm);
			commandMap.put("inidPay", strQueryPay);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
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
			
			// 자격증  ( netfu_cate : type ='inid_mylskill' )
			commandMap.put("type", "inid_mylskill");
			List<Map<String, Object>> inidMySkillList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 경력별  ( netfu_cate : type ='job_career' )
			commandMap.put("type", "job_career");
			List<Map<String, Object>> jobCareerList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 학력별  ( netfu_cate : type ='job_school' )
			commandMap.put("type", "job_school");
			List<Map<String, Object>> jobSchoolList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 고용형태별  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 연봉별  ( netfu_cate : type ='job_pay' )
			commandMap.put("type", "job_pay");
			List<Map<String, Object>> jobPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("inidMySkillList", inidMySkillList);
			mv.addObject("jobCareerList", jobCareerList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("jobPayList", jobPayList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearchForAlba Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 알바 지원
	 */
	@RequestMapping(value="/resumeSearchForFree.do")
	public ModelAndView resumeSearchForFree(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchForFree");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			commandMap.put("infoType", "4");

			// 검색 Query 생성.
			String strQueryBizType = QueryParser.genQueryResumeBizType((String) commandMap.get("inidType"));
			String strQueryIndustry = QueryParser.genQueryResumeIndustry((String) commandMap.get("inidAreaJob"));
			String strQueryArea = QueryParser.genQueryResumeArea((String) commandMap.get("inidArea"));
			String strQueryLicense = QueryParser.genQueryResumeLicense((String) commandMap.get("inidLicense"), netfuCateService);
			String strQueryCareer = QueryParser.genQueryResumeCareer((String) commandMap.get("inidCareer"));
			String strQuerySchool = QueryParser.genQueryResumeSchool((String) commandMap.get("inidSchool"));
			String strQueryJobForm = QueryParser.genQueryResumeJobForm((String) commandMap.get("inidJobform"));
			String strQueryPay = QueryParser.genQueryResumePay((String) commandMap.get("inidPay"));

			// 채용정보 검색 리스트
			commandMap.put("inidType", strQueryBizType);
			commandMap.put("inidAreaJob", strQueryIndustry);
			commandMap.put("inidArea", strQueryArea);
			commandMap.put("inidLicense", strQueryLicense);
			commandMap.put("inidCareer", strQueryCareer);
			commandMap.put("inidSchool", strQuerySchool);
			commandMap.put("inidJobform", strQueryJobForm);
			commandMap.put("inidPay", strQueryPay);
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			List<Map<String, Object>> payResumeList = netfuItemResumeService.selectPayResumeList(commandMap.getMap());
			
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
			
			// 자격증  ( netfu_cate : type ='inid_mylskill' )
			commandMap.put("type", "inid_mylskill");
			List<Map<String, Object>> inidMySkillList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 경력별  ( netfu_cate : type ='job_career' )
			commandMap.put("type", "job_career");
			List<Map<String, Object>> jobCareerList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 학력별  ( netfu_cate : type ='job_school' )
			commandMap.put("type", "job_school");
			List<Map<String, Object>> jobSchoolList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 고용형태별  ( netfu_cate : type ='job_type' )
			commandMap.put("type", "job_type");
			List<Map<String, Object>> jobTypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 연봉별  ( netfu_cate : type ='job_pay' )
			commandMap.put("type", "job_pay");
			List<Map<String, Object>> jobPayList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("jobList", jobList);
			mv.addObject("areaJobList", areaJobList);
			mv.addObject("areaList", areaList);
			mv.addObject("inidMySkillList", inidMySkillList);
			mv.addObject("jobCareerList", jobCareerList);
			mv.addObject("jobSchoolList", jobSchoolList);
			mv.addObject("jobTypeList", jobTypeList);
			mv.addObject("jobPayList", jobPayList);
			mv.addObject("resumeList", resumeList);
			mv.addObject("payResumeList", payResumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeSearchForFree Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 인재정보 상세
	 */
	@RequestMapping(value="/resumeDetail.do")
	public ModelAndView resumeDetail(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeDetail");
		
		try{
			
			String service2Flag = (String)session.getAttribute("SE_SERVICE2");
		
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			// 열람 정보 저장
			commandMap.put("no", commandMap.get("resumeNo"));
			commandMap.put("toUid", commandMap.get("personUid"));
			commandMap.put("viewType", "resume");
			recruitViewService.insertRecruitView(commandMap.getMap());
			
			// 유료 열람 서비스 count down
			if("Y".equals(service2Flag)){
				netfuMemberService.updateViewCount(commandMap.getMap());
				int viewCount = ConvertUtil.checkNullToInt(((Integer)session.getAttribute("SE_VIEW_COUNT")).toString());
				if((viewCount - 1) < 0){
					netfuMemberService.updatePayService2Info(commandMap.getMap());
					session.setAttribute("SE_SERVICE2", "");
				}
				session.setAttribute("SE_VIEW_COUNT", (viewCount - 1));
			}
			
			
			// 회사정보 
			commandMap.put("uid", commandMap.get("companyUid"));
			Map<String, Object> companyMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			// 개인회원정보 -- uid 
			commandMap.put("uid", commandMap.get("personUid"));
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			// 이력서 정보 -- uid, no
			commandMap.put("uid", commandMap.get("personUid"));
			commandMap.put("no", commandMap.get("resumeNo"));
			Map<String, Object> resumeMap = netfuItemResumeService.selectNetfuItemResumeMap(commandMap.getMap());
			
			// 스크랩 여부 
			commandMap.put("uid", commandMap.get("companyUid"));
			commandMap.put("no", commandMap.get("resumeNo"));
			int scrapCnt = netfuScrapService.selectNetfuScrapRegistCnt(commandMap.getMap());
			
			// 면접 제의 여부
			commandMap.put("uid", commandMap.get("companyUid"));
			commandMap.put("toUid", commandMap.get("personUid"));
			commandMap.put("toNo", commandMap.get("resumeNo"));
			commandMap.put("toType", "interview");
			int interviewCnt = netfuOnlineRecruitService.selectNetfuOnlineRecruitRegistCnt(commandMap.getMap());
			
			// 등록 채용정보 갯수
			commandMap.put("uid", commandMap.get("companyUid"));
			commandMap.put("bizIng", "yes");
			commandMap.put("recruitColumn", CommonColumnUtil.getRecruitColumn());
			int recruitCnt = netfuItemCompanyService.selectNetfuItemCompanyCntByCompany(commandMap.getMap());
			
			// 진행중인 채용정보 목록
			List<Map<String, Object>> recruitList = netfuItemCompanyService.selectNetfuItemCompanyProceess(commandMap.getMap());
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, String> resumeEducation = mapper.readValue((String)resumeMap.get("education2"), Map.class);
			Map<String, String> resumeCareer = mapper.readValue((String)resumeMap.get("career2"), Map.class);
			Map<String, String> resumeLicense = mapper.readValue((String)resumeMap.get("license2"), Map.class);
			Map<String, String> resumeLanguage = mapper.readValue((String)resumeMap.get("language2"), Map.class);
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("memberMap", memberMap);
			mv.addObject("companyMap", companyMap);
			mv.addObject("resumeMap", resumeMap);
			
			mv.addObject("scrapCnt", scrapCnt);
			mv.addObject("interviewCnt", interviewCnt);
			mv.addObject("recruitCnt", recruitCnt);
			mv.addObject("recruitList", recruitList);
			
			mv.addObject("resumeEducation", resumeEducation);
			mv.addObject("resumeCareer", resumeCareer);
			mv.addObject("resumeLicense", resumeLicense);
			mv.addObject("resumeLanguage", resumeLanguage);
			
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeDetail Exception !!!!! \n"+e.toString());
		}
		
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
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			int rstCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			e.printStackTrace();
			log.debug(this.getClass().getName()+" selectNetfuItemResumeCnt.ajax Exception!!!!  "+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 등록된 이력서 목록
	 */
	@RequestMapping(value="/resumeList.do")
	public ModelAndView resumeList(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/resume/resumeList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
				commandMap.put("orderField", "nir.no");
				commandMap.put("orderRule", "desc");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("allFlag", "Y");
			commandMap.put("resumeColumn", CommonColumnUtil.getResumeColumn());
			
			// 채용정보 검색 리스트
			List<Map<String, Object>> resumeList = netfuItemResumeService.selectNetfuItemResumeList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(resumeList.size() > 0){
				totalSize = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("resumeList", resumeList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumeList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
		
	}
	
	
	/*
	 * 이력서 정보 삭제
	 */
	@RequestMapping(value="/deleteResumeMulti.ajax")
	public ModelAndView deleteResumeMulti(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = netfuItemResumeService.deleteNetfuItemResumeMulti(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".deleteResumeMulti Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

}
