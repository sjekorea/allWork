package allwork.common.util;

import java.util.HashMap;
import java.util.Map;

public class PaginationUtil {
	
	public static Map<String, Object> makePageInfo(int totalSize, int perPage, String pageNo, String functionName) throws Exception{
		Map<String, Object> rtnMap = new HashMap<String, Object>();
			
		String pageHtml = "";
		
		if(totalSize > 0){
			
			if(Integer.parseInt(pageNo) <= 1){
				pageHtml += "<li class='prev_first'></li>";
				pageHtml += "<li class='prev'></li>";
			}else{
				pageHtml += "<li class='prev_first on' onclick=\"javascript:"+functionName+"('1')\"></li>";
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
						pageHtml += "<li class='page ft_color01' onclick=\"javascript:"+functionName+"('"+(pageStartNo+i+1)+"')\">"+(pageStartNo+i+1)+"</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					}else{
						pageHtml += "<li class='page' onclick=\"javascript:"+functionName+"('"+(pageStartNo+i+1)+"')\">"+(pageStartNo+i+1)+"</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					}
				}
			}
			
			pageHtml += "<li class='page'>/ "+totalPage+"</li>";
			
			if(Integer.parseInt(pageNo) >= totalPage){
				pageHtml += "<li class='next'></a>";
				pageHtml += "<li class='next_last'></a>";
			}else{
				pageHtml += "<li class='next on' onclick=\"javascript:"+functionName+"('"+(Integer.parseInt(pageNo)+1)+"')\"></a>";
				pageHtml += "<li class='next_last on' onclick=\"javascript:"+functionName+"('"+totalPage+"')\"></a>";
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
