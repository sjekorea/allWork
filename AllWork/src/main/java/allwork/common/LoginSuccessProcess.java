package allwork.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import allwork.common.util.ConvertUtil;
import allwork.common.util.DateUtil;

public class LoginSuccessProcess{
	
	Logger log = Logger.getLogger(this.getClass());
	
	public void loginSuccessMakeSession(HttpServletRequest request, Map<String, Object> memberInfoMap) throws Exception{
		
		
		try{
			HttpSession session = request.getSession();
			
			session.setAttribute("SE_LOGIN_ID", memberInfoMap.get("uid"));
	        session.setAttribute("SE_USER_NM", memberInfoMap.get("name"));
	        if("1".equals((String)memberInfoMap.get("type"))){	
	        	session.setAttribute("SE_USER_TYPE", "person");
	        }else if("2".equals((String)memberInfoMap.get("type"))){	
	        	session.setAttribute("SE_USER_TYPE", "company");
	        }else{
	        	session.setAttribute("SE_USER_TYPE", "none");
	        }
			session.setAttribute("SE_LOGIN_STATUS", true);
			
			long dateCompareResult = 0;
			String serviceFlag = ConvertUtil.checkNull((String)memberInfoMap.get("service1Flag"));
			String serviceEndDate = ConvertUtil.checkNull((String)memberInfoMap.get("service1EndDate"));
			if(serviceFlag.equalsIgnoreCase("Y") && !"".equals(serviceEndDate)){
				dateCompareResult = DateUtil.getCompareDate(serviceEndDate);
				
				if(dateCompareResult >= 0){
					session.setAttribute("SE_SERVICE1", "Y");
				}else{
					session.setAttribute("SE_SERVICE1", "N");
				}
				session.setAttribute("SE_SERVICE1_END", memberInfoMap.get("service1EndDate"));
				//session.setAttribute("SE_VIEW_COUNT", 0);
			} else {
				session.setAttribute("SE_SERVICE1", "N");
				session.setAttribute("SE_SERVICE1_END", "");
			}
			
			serviceFlag = ConvertUtil.checkNull((String)memberInfoMap.get("service2Flag"));
			serviceEndDate = ConvertUtil.checkNull((String)memberInfoMap.get("service2EndDate"));
			int viewCount = ConvertUtil.checkNullToInt(((Integer)memberInfoMap.get("viewCount")).toString());
			if(serviceFlag.equalsIgnoreCase("Y") && !"".equals(serviceEndDate)){
				dateCompareResult = DateUtil.getCompareDate(serviceEndDate);
				if(dateCompareResult >= 0 && viewCount > 0 ){
					session.setAttribute("SE_SERVICE2", "Y");
				}else{
					session.setAttribute("SE_SERVICE2", "N");
				}
				session.setAttribute("SE_SERVICE2_END", memberInfoMap.get("service2EndDate"));
				session.setAttribute("SE_VIEW_COUNT", viewCount);
			} else {
				session.setAttribute("SE_SERVICE2", "N");
				session.setAttribute("SE_SERVICE2_END", "");
				session.setAttribute("SE_VIEW_COUNT", 0);
			}
	        
		}catch(Exception e){
			log.debug(e.toString());
		}
	}
	
}
