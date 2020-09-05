package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.service.TestInfoService;
import allwork.common.CommandMap;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;

@Controller
public class TestInfoController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="testInfoService")
	private TestInfoService testInfoService;
	
	@RequestMapping(value="/testInfoList.do")
	public ModelAndView testInfoList(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("/test/testInfoList");
		int pageSize = 10;
		int totalSize = 0;
		
		try{
			
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			List<Map<String, Object>> testInfoList = testInfoService.selectTestInfoList(commandMap.getMap());
			
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(testInfoList.size() > 0){
				totalSize = testInfoService.selectTestInfoCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("list", testInfoList);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("totalSize", totalSize);
			mv.addObject("pageMap", pageMap);
			mv.addObject("currentUrl", "/testInfoList.do");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".testInfoList.do Exception!!!!!   "+e.toString());
		}
		return mv;
	}
	

}
