package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.FileUtils;
import allwork.service.HomeCommonService;
import allwork.service.NetfuCateService;

@Controller
public class CommonController {
	
	@Resource(name="fileUtils") 
	private FileUtils fileUtils;

	@Resource(name="homeCommonService")
	private HomeCommonService homeCommonService;	
	
	@RequestMapping(value="/commonHeader.do")
	public ModelAndView commonHeader(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/commonHeader");
		
		return mv;
	}
	
	@RequestMapping(value="/indexHeader.do")
	public ModelAndView indexHeader(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/indexHeader");
		
		int pageSize = 8;
		int totalSize = 0;
		
		try{
			// popup 리스트
			List<Map<String, Object>> popupList = homeCommonService.selectMainPopupList(commandMap.getMap());
			mv.addObject("popupList", popupList);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".home Exception!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="/mainWinPop.do")
	public ModelAndView mainWinPop(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/popup/mainWinPop");
		
		try{
			// popup 정보
			Map<String, Object> popupMap = homeCommonService.selectMainPopupMap(commandMap.getMap());
			mv.addObject("popupMap", popupMap);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".mainWinPop Exception!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 개인회원 홈
	 */
	@RequestMapping(value="/personHeader.do")
	public ModelAndView personalHeader(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/personHeader");
		return mv;
	}
	@RequestMapping(value="/personSubMenu.do")
	public ModelAndView personSubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/personSubMenu");
		return mv;
	}
	
	
	/*
	 * 기업회원 홈.
	 */
	@RequestMapping(value="/companyHeader.do")
	public ModelAndView companyHeader(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/companyHeader");
		return mv;
	}
	@RequestMapping(value="/companySubMenu.do")
	public ModelAndView companySubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/companySubMenu");
		return mv;
	}
	
	
	/*
	 * 헤드헌팅, 채용진행현황, 고객센터.
	 */
	@RequestMapping(value="/communityHeader.do")
	public ModelAndView communityHeader(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/communityHeader");
		return mv;
	}
	@RequestMapping(value="/communitySubMenu.do")
	public ModelAndView communitySubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/communitySubMenu");
		return mv;
	}
	
	@RequestMapping(value="/headhuntSubMenu.do")
	public ModelAndView headhuntSubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/headhuntSubMenu");
		return mv;
	}

	@RequestMapping(value="/progressSubMenu.do")
	public ModelAndView progressSubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/progressSubMenu");
		return mv;
	}


	@RequestMapping(value="/recruitInfoSubMenu.do")
	public ModelAndView recruitInfoSubMenu(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/recruitInfoSubMenu");
		
		return mv;
	}
	
	@RequestMapping(value="/personInfoSubMenu.do")
	public ModelAndView personInfoSubMenu(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/personInfoSubMenu");
		
		return mv;
	}

	
	/*
	 * 회사소개.
	 */
	@RequestMapping(value="/introHeader.do")
	public ModelAndView introHeader(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/introHeader");
		return mv;
	}
	@RequestMapping(value="/introSubMenu.do")
	public ModelAndView introSubMenu(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/include/introSubMenu");
		return mv;
	}
	
	
	@RequestMapping(value="/footer.do")
	public ModelAndView footer(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/footer");
		
		return mv;
	}
	

	/*
	 * 파일 upload & getFileName
	 */
	@RequestMapping(value="/fileUplad.ajax")
	public ModelAndView fileUplad(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		String attachFileName = "";
		try{
			
			attachFileName = fileUtils.uploadFile(commandMap.getMap(), request);
			
			System.out.println(this.getClass().getName()+" ====> attachFileName : "+attachFileName);
			
			mv.addObject("attachFileName", attachFileName);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".fileUplad() Exception!!!!!\n"+e.toString());
		}
			
		return mv;
	}

}
