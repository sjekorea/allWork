package allwork.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.service.NetfuCateService;

@Controller
public class CodeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;
	
	
	@RequestMapping(value="/getCodeListAjax.ajax")
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
