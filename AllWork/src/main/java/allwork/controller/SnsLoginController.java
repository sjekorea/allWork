package allwork.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.LoginSuccessProcess;
import allwork.service.NetfuMemberService;

@Controller
public class SnsLoginController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;

	//소셜 Login 정보.
	@Value("${naver.clientId}")
	private String naverClientId;

	@Value("${kakao.clientId}")
	private String kakaoClientId;

	@Value("${google.clientId}")
	private String googleClientId;

	
	
	/********
	 * Naver 로그인 
	 */
	@RequestMapping(value="/naverLogin.do")
	public ModelAndView naverLogin(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView("/login/naverLogin");
		mv.addObject("naverClientId", naverClientId); 
		return mv;
	}

	
	/********
	 * sns 로그인 처리
	 */
	@RequestMapping(value="/snsLoginProcess.ajax")
	public ModelAndView snsLoginProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			
			int userInfoCnt = netfuMemberService.selectNetfuMemberSNSLoginCnt(commandMap.getMap());
			
			Map<String, Object> memberInfoMap = new HashMap<String, Object>();
			
			if(userInfoCnt > 0){
				commandMap.put("ciKey", (String)commandMap.get("id"));
				memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
				LoginSuccessProcess loginSuccessProcess = new LoginSuccessProcess();
				loginSuccessProcess.loginSuccessMakeSession(req, memberInfoMap);
				
				//(begin) 2021.01.03 by s.yoo
				//가장 최근의 login 시각 등록.
				netfuMemberService.updateLoginInfo(commandMap.getMap());
				//(end) 2021.01.03 by s.yoo
			}
			
			mv.addObject("rstCnt", userInfoCnt); 
			mv.addObject("memberInfoMap", memberInfoMap);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".snsLoginProcess.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	
	
	@RequestMapping(value="/googleLoginProcess.ajax")
	public ModelAndView googleLoginProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			
			int userInfoCnt = netfuMemberService.selectNetfuMemberSNSLoginCnt(commandMap.getMap());
			
			Map<String, Object> memberInfoMap = new HashMap<String, Object>();
			
			if(userInfoCnt > 0){
				memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
				LoginSuccessProcess loginSuccessProcess = new LoginSuccessProcess();
				loginSuccessProcess.loginSuccessMakeSession(req, memberInfoMap);
				
				commandMap.put("loginId", (String)memberInfoMap.get("uid"));
				//(begin) 2021.01.03 by s.yoo
				//가장 최근의 login 시각 등록.
				netfuMemberService.updateLoginInfo(commandMap.getMap());
				//(end) 2021.01.03 by s.yoo
			}
			
			mv.addObject("rstCnt", userInfoCnt);
			mv.addObject("memberInfoMap", memberInfoMap);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".googleLoginProcess.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	
	
	
	/*
	 * 소셜계정 연결.
	 */
	@RequestMapping(value="/linkSocial.do")
	public ModelAndView linkSocial(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/linkSocial");
		try{
			mv.addObject("map", commandMap.getMap());
			mv.addObject("naverClientId", naverClientId); 
			mv.addObject("kakaoClientId", kakaoClientId); 
			mv.addObject("googleClientId", googleClientId); 
		}catch(Exception e){
			log.info(this.getClass().getName()+".linkSocial Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

	/*
	 * Naver 소셜계정 연결.
	 */
	@RequestMapping(value="/naverUpdate.do")
	public ModelAndView naverUpdate(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView("/login/naverUpdate");
		mv.addObject("naverClientId", naverClientId); 
		return mv;
	}

	/*
	 * 소셜계정 연결 처리.
	 * 
	 */
	@RequestMapping(value="/snsUpdateProcess.ajax")
	public ModelAndView snsUpdateProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			//사용자 계정을 소셜계정에 연결.
			netfuMemberService.updateNetfuMemberSNS(commandMap.getMap());

			//소셜계정에 연결된 정보 전달.
			int userInfoCnt = netfuMemberService.selectNetfuMemberSNSLoginCnt(commandMap.getMap());

			Map<String, Object> memberInfoMap = new HashMap<String, Object>();
			
			if(userInfoCnt > 0){
				commandMap.put("ciKey", (String)commandMap.get("id"));
				memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
				LoginSuccessProcess loginSuccessProcess = new LoginSuccessProcess();
				loginSuccessProcess.loginSuccessMakeSession(req, memberInfoMap);
			}
			
			mv.addObject("rstCnt", userInfoCnt); 
			mv.addObject("memberInfoMap", memberInfoMap);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".snsUpdateProcess Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	

}
