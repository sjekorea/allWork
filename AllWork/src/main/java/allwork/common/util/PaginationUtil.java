package allwork.common.util;

import java.util.HashMap;
import java.util.Map;

public class PaginationUtil {
	
	public static Map<String, Object> makePageInfo(int totalSize, int perPage, String pageNo, String functionName) throws Exception{
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		String pageHtml = "";
		
		if(totalSize > 0){			
			
			if(Integer.parseInt(pageNo) <= 1){
				pageHtml += "<li><a href=\"javascript:"+functionName+"('1')\" title='prev'><i class='fas fa-chevron-left'></i></a></li>";
			}else{
				pageHtml += "<li class='prev on' onclick=\"javascript:"+functionName+"('"+(Integer.parseInt(pageNo)-1)+"')\"></li>";
			}
			
			
			int totalPage = totalSize / perPage;
			if(totalPage * perPage < totalSize) totalPage++;
			int pageStartNo = ((int)((Integer.parseInt(pageNo)-1) / 10))*10;
			
			
			for(int i = 0 ; i < 10 ; i++){
				
				if((pageStartNo+i+1) > totalPage){
					break;
				}else{
					if(pageNo.equals(String.valueOf(pageStartNo+i+1))){
						pageHtml += "<li class='p01'><a href=\"javascript:"+functionName+"('"+(pageStartNo+i+1)+"')\">"+(pageStartNo+i+1)+"</a></li>";
						
					}else{
						pageHtml += "<li><a href=\"javascript:"+functionName+"('"+(pageStartNo+i+1)+"')\">"+(pageStartNo+i+1)+"</a></li>";
					}
				}
			}
			
			if(Integer.parseInt(pageNo) >= totalPage){
				pageHtml += "<li><a href=\"javascript:"+functionName+"('"+totalPage+"')\" title='next'><i class='fas fa-chevron-right'></i></a></li>";
			}else{
				pageHtml += "<li><a href=\"javascript:"+functionName+"('"+(Integer.parseInt(pageNo)+1)+"')\" title='next'><i class='fas fa-chevron-right'></i></a></li>";
			}
		}
		
		rtnMap.put("pageNo", pageNo);
		rtnMap.put("pageHtml", pageHtml);
		
		
		return rtnMap;
	}
	
	
	public static Map<String, Object> makePageInfo(int totalSize, int perPage, String pageNo) throws Exception{
		
		return PaginationUtil.makePageInfo(totalSize, perPage, pageNo, "goPage");
	}
}
