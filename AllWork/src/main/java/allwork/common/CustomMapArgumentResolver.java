package allwork.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.Enumeration;

import allwork.common.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver{
	
	@Override
	public boolean supportsParameter(MethodParameter parameter){
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer macContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception{
		
		CommandMap commandMap = new CommandMap();
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null;
		String[] values = null;
		String encKey = null;
		
		while(enumeration.hasMoreElements()){
			key = (String)enumeration.nextElement();
			values = request.getParameterValues(key);
			
			if(values != null){
				commandMap.put(key, (values.length > 1) ? values : values[0]);
			}
			
			System.out.println("=============> CustomMapArgumentResolver Param Map : "+key+" || "+((values.length > 1) ? values : values[0]));
		}
		
		return commandMap;
		
	}
}
