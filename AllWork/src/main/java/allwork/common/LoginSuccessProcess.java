package allwork.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class LoginSuccessProcess{
	
	Logger log = Logger.getLogger(this.getClass());
	
	public void loginSuccessMakeSession(HttpServletRequest request, Map<String, Object> memberInfoMap) throws Exception{
		
		
		try{
			HttpSession session = request.getSession();
			
			session.setAttribute("SE_LOGIN_ID", memberInfoMap.get("uid"));
	        session.setAttribute("SE_USER_NM", memberInfoMap.get("name"));
	        session.setAttribute("SE_USER_TYPE", memberInfoMap.get("type"));
			session.setAttribute("SE_LOGIN_STATUS", true);
	        
		}catch(Exception e){
			log.debug(e.toString());
		}
	}
	
}
