package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import allwork.service.RecruitInfoService;
import allwork.common.util.PaginationUtil;
import allwork.common.util.ConvertUtil;

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
	
	@Resource(name="recruitInfoService")
	private RecruitInfoService recruitInfoService;
	
	
	/*
	 * 개인 회원 홈
	 */
	@RequestMapping(value="/personHome")
	public ModelAndView personHome(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/personHome");
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			// 개인정보 조회
			Map<String, Object> memberMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			/*// 등록된 이력서 갯수
			int netfuItemResumeCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			// 온라인 입사지원 수
			int onlineRecruitCnt = netfuItemCompanyService.selectOnlineRecruitCnt(commandMap.getMap());
			// 스크랩한 채용정보
			int netfuScrapCnt = netfuScrapService.selectNetfuScrapCnt(commandMap.getMap());*/
			
			// 추천 채용정보
			List<Map<String, Object>> recommandRecruitList = recruitInfoService.selectRecommandRecruitList(commandMap.getMap());
			
			// 맞춤 채용 정보
			List<Map<String, Object>> recruitSettedList = netfuItemCompanyService.selectRecruitSettedList(commandMap.getMap());
			
			// 스크랩 공고
			List<Map<String, Object>> recruitScrapList = netfuItemCompanyService.selectRecruitScrapList(commandMap.getMap());
			
			
			mv.addObject("memberMap", memberMap);
			//mv.addObject("netfuItemResumeCnt", netfuItemResumeCnt);
			//mv.addObject("onlineRecruitCnt", onlineRecruitCnt);
			//mv.addObject("netfuScrapCnt", netfuScrapCnt);
			mv.addObject("recommandRecruitList", recommandRecruitList);
			mv.addObject("recruitSettedList", recruitSettedList);
			mv.addObject("recruitScrapList", recruitScrapList);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".personHome Exception !!!!! \n"+e.toString());
		}
		
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
	
}
