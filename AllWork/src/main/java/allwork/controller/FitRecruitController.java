package allwork.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonUtil;

@Controller
public class FitRecruitController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	/*
	 * 맟춤채용정보
	 */
	@RequestMapping(value="/fitRecruitList")
	public ModelAndView fitRecruitList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitList");
		
		try{
			
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitRecruitList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	/*
	 * 맟춤채용정보 설정
	 */
	@RequestMapping(value="/fitRecruitSetting")
	public ModelAndView fitRecruitSetting(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/fitRecruitSetting");
		
		try{
			
			mv.addObject("careerRange", CommonUtil.getNumberRanage(1, 20));
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".fitRecruitSetting Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	

}
