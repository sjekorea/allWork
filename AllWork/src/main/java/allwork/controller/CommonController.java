package allwork.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuCateService;

@Controller
public class CommonController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;
	
	@RequestMapping(value="/indexHeader.do")
	public ModelAndView indexHeader(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/indexHeader");
		
		return mv;
	}
	
	
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
	
	
	@RequestMapping(value="/communitySubMenu.do")
	public ModelAndView communitySubMenu(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/communitySubMenu");
		
		return mv;
	}
	
	
	@RequestMapping(value="/footer.do")
	public ModelAndView footer(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/include/footer");
		
		return mv;
	}
	
	
	@RequestMapping(value="/getCodeListAjax.do")
	public ModelAndView getCodeListAjax(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView();
		try{
			List<Map<String, Object>> netfuCateList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			mv.addObject("list", netfuCateList);
			mv.addObject("map", commandMap.getMap());
			mv.setViewName("jsonView");
		}catch(Exception e){
			System.out.println(this.getClass().getName()+" getCodeListAjax.ajax Exception!!!!  "+e.toString());
		}
		return mv;
	}

}
