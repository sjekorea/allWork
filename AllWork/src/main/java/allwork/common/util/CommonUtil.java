package allwork.common.util;

import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonUtil {
	
	public static boolean empty(Object obj){
		if (obj == null){
			return true;
		}
		if (obj instanceof String) { 
			return ((String) obj).equals("");
		} else if (obj instanceof List) {
			return ((List) obj).isEmpty();
		} else if(obj instanceof ArrayList) {
			return ((ArrayList) obj).isEmpty();
		} else if (obj instanceof Map) {
			return ((Map) obj).isEmpty();
		} else if (obj instanceof Object[]) {
			return Array.getLength(obj) == 0;
		} else {
			return obj == null;
		}
	}
	

	public static boolean isValidEmail(String email) {
		boolean err = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";   
		Pattern p = Pattern.compile(regex);
		
		Matcher m = p.matcher(email);
		
		if(m.matches()) {
			err = true; 
		}
		
		return err;
	}
	
	
	public static boolean isValidMobileNo(String mobileNo) {
		boolean err = false;
		String regex = "^01(?:0|1|[6-9])-?(?:\\d{3}|\\d{4})-?\\d{4}$";   
		
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(mobileNo);
		
		if(m.matches()) {
			err = true; 
		}
		return err;
	}
	
	
	public static String getRandomString(){ 
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static String getShortRandomString(){
        String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌.
        return uuid;
	}
	
	public static String getServerIp(){
		InetAddress local;
		String ip = "";
		try {
		    local = InetAddress.getLocalHost();
		    ip = local.getHostAddress();
		    //System.out.println("local ip : "+ip);
		} catch (Exception e1) {
		    e1.printStackTrace();
		}
		return ip;
	}
	
	public static String getClientIp(HttpServletRequest req) {
	    String ip = req.getHeader("X-Forwarded-For");
	    if (ip == null) ip = req.getRemoteAddr();
	    return ip;
	}
	
	public static String getNowDate(){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Calendar date = Calendar.getInstance();
		String rtnDate = format.format(date.getTime());
		return rtnDate;
		
	}
	
	public static String getNowYear(){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Calendar date = Calendar.getInstance();
		String rtnDate = format.format(date.getTime());
		return rtnDate;
		
	}
	
	public static String getNowMonth(){
		
		SimpleDateFormat format = new SimpleDateFormat("MM");
		Calendar date = Calendar.getInstance();
		String rtnDate = format.format(date.getTime());
		return rtnDate;
		
	}
	
	public static String addDateDate(int addMonth){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
	    cal.add(Calendar.MONTH, addMonth);
		String rtnDate = format.format(cal.getTime());
		return rtnDate;
	}
	
	public static ArrayList<Integer> getNumberRanage(int startNum, int endNum){
		
		ArrayList rtnList = new ArrayList<Integer>();
		
		for(int i = startNum ; i <= endNum ; i++){
			rtnList.add(Integer.valueOf(i));
		}
		return rtnList;
	}

	public static void Alert(String alertMsg, String redirectUrl, HttpServletRequest request, HttpServletResponse response){
		
		try{
			
			request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('"+alertMsg+"');");
			out.print("location.href = '"+redirectUrl+"';");
			out.print("</script>");
			out.flush();
			out.close();
			
		}catch(Exception e){
			System.out.println("Alert Exception!!! \n"+e.toString());
		}
	}
	
	
	
}
