package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuScrapService;

@Controller
public class PersonController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	@Resource(name="netfuItemResumeService")
	private NetfuItemResumeService netfuItemResumeService;
	
	@Resource(name="netfuItemCompanyService")
	private NetfuItemCompanyService netfuItemCompanyService;
	
	@Resource(name="netfuScrapService")
	private NetfuScrapService netfuScrapService;
	
	
	/*
	 * 개인 회원 홈
	 */
	@RequestMapping(value="/personHome")
	public ModelAndView personHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/personHome");
		
		try{
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			// 등록된 이력서 갯수
			int netfuItemResumeCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			// 온라인 입사지원 수
			int netfuItemCompanyCnt = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
			// 스크랩한 채용정보
			int netfuScrapCnt = netfuScrapService.selectNetfuScrapCnt(commandMap.getMap());
			
			mv.addObject("memberMap", memberMap);
			//log.info("########### memberMap : \n"+memberMap.toString());
			mv.addObject("netfuItemResumeCnt", netfuItemResumeCnt);
			mv.addObject("netfuItemCompanyCnt", netfuItemCompanyCnt);
			mv.addObject("netfuScrapCnt", netfuScrapCnt);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".personHome Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색
	 */
	@RequestMapping(value="/recruitSearch")
	public ModelAndView recruitSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/recruitSearch");
		
		return mv;
	}
	
	
	/*
	 * 채용정보 검색 - 직무별
	 */
	@RequestMapping(value="/recruitSearchByDuty")
	public ModelAndView recruitSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/recruitSearchByDuty");
		
		return mv;
	}
	
	
	/*
	 * 이력서 등록
	 */
	@RequestMapping(value="/resumeInfoReg")
	public ModelAndView resumeInfoReg(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/resumeInfoReg");
		
		return mv;
	}
	
	
	/*
	 * 입사 지원 관리
	 */
	@RequestMapping(value="/personApplicationList")
	public ModelAndView personApplicationList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/personApplicationList");
		
		return mv;
	}
	
	
	/*
	 * 스크랩 채용정보
	 */
	@RequestMapping(value="/recruitScrapList")
	public ModelAndView recruitScrapList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/recruitScrapList");
		
		return mv;
	}
	
	
	/*
	 * 관심 기업 목록
	 */
	@RequestMapping(value="/interestCompanyList")
	public ModelAndView interestCompanyList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/interestCompanyList");
		
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
	
	
	/*
	 * 맟춤채용정보
	 */
	@RequestMapping(value="/companySettedList")
	public ModelAndView companySettedList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/companySettedList");
		
		return mv;
	}
	
	
	/*
	 * 맟춤채용정보
	 */
	@RequestMapping(value="/companySearchSetting")
	public ModelAndView companySearchSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/companySearchSetting");
		
		return mv;
	}
}
