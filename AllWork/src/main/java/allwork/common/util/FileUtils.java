package allwork.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "D:\\allWork\\allWork\\AllWork\\src\\main\\webapp\\peg\\";
	//private static final String filePath = "/var/lib/tomcat8/webapps/ROOT/peg/";
	private static final String fileUrl = "/contentsImg/";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    	
		try{
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    	
	    	MultipartFile multipartFile = null;
	    	String originalFileName = null;
	    	String originalFileExtension = null;
	    	String storedFileName = null;
	        Map<String, Object> listMap = null; 
	        
	        File file = new File(filePath);
	        if(file.exists() == false){
	        	file.mkdirs();
	        }
			
			//String serverIp = CommonUtil.getServerIp();
	        
	        //System.out.println("IMG NAME : "+multipartHttpServletRequest.getParameter("imgName"));
	        
	        while(iterator.hasNext()){
	        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        	if(multipartFile.isEmpty() == false){
	        		originalFileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
	        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        		storedFileName = CommonUtil.getRandomString() + originalFileExtension;
	        		
	        		file = new File(filePath + storedFileName);
	        		multipartFile.transferTo(file);
	        		
	        		listMap = new HashMap<String,Object>();
	        		listMap.put("contentsImgSeq", (String)map.get("contentsImgSeq"));
	        		listMap.put("imgName", new String(((String)map.get("imgName")).getBytes("8859_1"), "UTF-8"));
	        		listMap.put("orgFileName", originalFileName);
	        		listMap.put("maskFileName", storedFileName);
	        		listMap.put("fileUrl", fileUrl+storedFileName);
	        		listMap.put("fileSize", multipartFile.getSize());
	        		listMap.put("loginId", (String)map.get("loginId"));
	        		listMap.put("sendType", (String)map.get("sendType"));
	        		list.add(listMap);
	        	}
	        }
	        
	        //System.out.println(" ---------> FILE UPLOAD !!!!  " + list.size());
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".parseInsertFileInfo Exception!!!!!    "+e.toString());
		}
		
		return list;
	}
	
	
	
	public String uploadFile(Map<String,Object> map, HttpServletRequest request) throws Exception{
		
		System.out.println("#######  Start file upload!!!  #############");
    	
    	String attachFileName = "";
    	
		try{
			
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    	
	    	MultipartFile multipartFile = null;
	    	String originalFileName = null;
	    	String originalFileExtension = null;
	    	String storedFileName = null;
	        
	        File file = new File(filePath);
	        if(file.exists() == false){
	        	file.mkdirs();
	        }
			
	        while(iterator.hasNext()){
	        	System.out.println("1111");
	        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        	System.out.println("222");
	        	if(multipartFile.isEmpty() == false){
	        		System.out.println("3333");
	        		originalFileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
	        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        		attachFileName = CommonUtil.getRandomString() + originalFileExtension;
	        		
	        		System.out.println("originalFileName : " +originalFileName);
	        		System.out.println("originalFileExtension : " +originalFileExtension);
	        		System.out.println("originalFileName : " +originalFileName);
	        		
	        		file = new File(filePath + attachFileName);
	        		multipartFile.transferTo(file);
	        	}
	        }
			
			System.out.println("#######  attachFileName  ############# ===> "+attachFileName);
	        
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".uploadFile Exception!!!!!    "+e.toString());
		}
		
		return attachFileName;
	}
}
