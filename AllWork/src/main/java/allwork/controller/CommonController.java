package allwork.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.FileUtils;
import allwork.service.HomeCommonService;

@Controller
public class CommonController {
	
	@Resource(name="fileUtils") 
	private FileUtils fileUtils;

	@Resource(name="homeCommonService")
	private HomeCommonService homeCommonService;	

	//소셜 Login 정보.
	@Value("${naver.clientId}")
	private String naverClientId;

	@Value("${kakao.clientId}")
	private String kakaoClientId;

	@Value("${google.clientId}")
	private String googleClientId;

	
	@RequestMapping(value="/commonHeader.do")
	public ModelAndView commonHeader(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/commonHeader");
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
		return mv;
	}
	
	@RequestMapping(value="/indexHeader.do")
	public ModelAndView indexHeader(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/indexHeader");
		
		//int pageSize = 8;
		//int totalSize = 0;
		
		try{
			// popup 리스트
			List<Map<String, Object>> popupList = homeCommonService.selectMainPopupList(commandMap.getMap());
			mv.addObject("popupList", popupList);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".home Exception!!! \n"+e.toString());
		}
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
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
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
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
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
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
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
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
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
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
