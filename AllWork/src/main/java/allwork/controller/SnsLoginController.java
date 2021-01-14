package allwork.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
	
	
	/********
	 * Naver 로그인 
	 */
	@RequestMapping(value="/naverLogin.do")
	public ModelAndView loginProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView("/login/naverLogin");
		return mv;
	}
	
	
	/********
	 * sns 로그인 처리
	 */
	@RequestMapping(value="/snsLoginProcess.ajax")
	public ModelAndView naverLoginProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
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
	

}
