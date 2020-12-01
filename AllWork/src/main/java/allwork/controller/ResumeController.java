package allwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import allwork.common.CommandMap;
import allwork.common.util.CodeConvertUtil;
import allwork.common.util.ConvertUtil;
import allwork.service.NetfuItemCompanyService;
import allwork.service.NetfuItemResumeService;
import allwork.service.NetfuMemberService;
import allwork.service.NetfuOnlineRecruitService;
import allwork.service.NetfuScrapService;
import de.ailis.pherialize.Mixed;
import de.ailis.pherialize.MixedArray;
import de.ailis.pherialize.Pherialize;

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
	
	
	/*
	 * 인재정보 검색
	 */
	@RequestMapping(value="/resumeSearch.do")
	public ModelAndView personSearch(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearch");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 검색 - 직무별
	 */
	@RequestMapping(value="/resumeSearchByDuty.do")
	public ModelAndView personSearchByDuty(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeSearchByDuty");
		
		return mv;
	}
	
	
	/*
	 * 인재정보 상세
	 */
	@RequestMapping(value="/resumeDetail.do")
	public ModelAndView resumeDetail(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/resume/resumeDetail");
		
		try{
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
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
			int recruitCnt = netfuItemCompanyService.selectNetfuItemCompanyCnt(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("memberMap", memberMap);
			mv.addObject("resumeMap", resumeMap);
			
			/*
			String lastSchool = (String)resumeMap.get("inidLastSchool");
			
			
			MixedArray list = new MixedArray();
			
			//list = Pherialize.unserialize(lastSchool).toArray();
			
			String[] lastSchoolArr;
			//Map<String, Object> inidLastSchoolMap = new HashMap<String, Object>();
			if(!"".equals(ConvertUtil.checkNull(lastSchool)) && lastSchool.length() > 0){
				lastSchoolArr = lastSchool.split("____");
				System.out.println("lastSchoolArr =======> "+lastSchoolArr.length);
				if(lastSchoolArr.length > 1){
					System.out.println("lastSchoolArr =======> "+lastSchoolArr[1].length());
					Mixed mixed = ConvertUtil.unserializeString(lastSchoolArr[1]);
					System.out.println("mixed =======> "+mixed.toString());
					list = ConvertUtil.unserializeString(lastSchoolArr[1]).toArray();
				}
			}
			
			System.out.println("inidLastSchoolMap =======> \n"+list.toString());*/
			
			mv.addObject("scrapCnt", scrapCnt);
			mv.addObject("interviewCnt", interviewCnt);
			mv.addObject("recruitCnt", recruitCnt);
			
		}catch(Exception e){
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
			int rstCnt = netfuItemResumeService.selectNetfuItemResumeCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.debug(this.getClass().getName()+" selectNetfuItemResumeCnt.ajax Exception!!!!  "+e.toString());
		}
		return mv;
	}

}
