package allwork.common.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	protected Log log = LogFactory.getLog(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		//System.out.println(" Request URI  :   "+request.getRequestURI());
		
		try{
			
			HttpSession session = request.getSession(false);
			
			if(session == null || session.getAttribute("SE_LOGIN_STATUS") == null || !((Boolean) session.getAttribute("SE_LOGIN_STATUS")).booleanValue()){
				
				Enumeration param = request.getParameterNames();
		        String strParam = ""; 
		        while(param.hasMoreElements()) { 
		            String name = (String)param.nextElement(); 
		            String value = request.getParameter(name); 
		            strParam += name + "=" + value + "&"; 
		        }
		        
		        if(!"".equals(strParam) && strParam != null){
		        	strParam = strParam.substring(0, strParam.length() -1);
		        }
		        
		        String requestUri = "";
		        if(!"".equals(strParam) && strParam != null){
		        	if(!"/".equals(request.getRequestURI())){
		        		requestUri = request.getRequestURL() + "?" + strParam;
		        	}else{
		        		requestUri = "/index.do";
		        	}
		        }
		        
				request.getSession().setAttribute("requestUri", requestUri);
				
				response.sendRedirect("/login.do");
				return false;
			}
				
		}catch(Exception e){
			
			System.out.println("LoginCheckInterceptor Exception : "+e.toString());
			
		}
		return super.preHandle(request, response, handler);
	} 
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	
		if (log.isDebugEnabled()) {
			//log.debug("====================================== END ======================================\n");
		}
	}
}	
