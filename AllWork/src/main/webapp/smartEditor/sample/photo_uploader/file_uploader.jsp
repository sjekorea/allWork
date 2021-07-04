<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import= "java.util.UUID" %>
<%@ page import= "java.io.FileOutputStream" %>
<%@ page import= "java.io.OutputStream" %>
<%@ page import= "java.io.InputStream" %>
<%@ page import= "java.io.File" %>
<%@ page import= "java.util.List" %>
<%@ page import= "org.apache.commons.fileupload.FileItem" %>
<%@ page import= "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import= "org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import= "allwork.common.util.CommonUtil" %>



<%
String return1="";
String return2="";
String return3="";
String name = "";
if (ServletFileUpload.isMultipartContent(request)){
    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
    //UTF-8 인코딩 설정
    uploadHandler.setHeaderEncoding("UTF-8");
    List<FileItem> items = uploadHandler.parseRequest(request);
    
    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
    for (FileItem item : items) {
        if(item.getFieldName().equals("callback")) {
            return1 = item.getString("UTF-8");
        } else if(item.getFieldName().equals("callback_func")) {
            return2 = "?callback_func="+item.getString("UTF-8");
        } else if(item.getFieldName().equals("Filedata")) {
            //FILE 태그가 1개이상일 경우
            if(item.getSize() > 0) {
            	
            	/* AS-IS */
            	/*
            	String filePath = "D:\\allWork\\allWork\\AllWork\\src\\main\\webapp\\peg\\";
            	//String filePath = "/usr/local/tomcat/webapps/ROOT/resources/photoUpload/";
            	String fileUrl = "/peg/";           	
            	*/
            	/* TO-BE */
            	//String filePath = "D:\\Projects\\J2EE\\peg\\";
            	String filePath = "/var/lib/tomcat8/webapps/peg/";
            	String fileUrl = "/allwork/peg/";
            	
                String serverIp = CommonUtil.getServerIp();
                
            	// 확장자
            	String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
                
                File file = new File(filePath);
                 
                //디렉토리 존재하지 않을경우 디렉토리 생성
                if(!file.exists()) {
                    file.mkdirs();
                }
                
                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
                String storedFileName = CommonUtil.getRandomString() + "." + ext;
                
                
                ///////////////// 서버에 파일쓰기 /////////////////
                InputStream is = item.getInputStream();
                OutputStream os=new FileOutputStream(filePath + storedFileName);
                int numRead;
                byte b[] = new byte[(int)item.getSize()];
                while((numRead = is.read(b,0,b.length)) != -1){
                    os.write(b,0,numRead);
                }
                if(is != null)  is.close();
                os.flush();
                os.close();
                ///////////////// 서버에 파일쓰기 /////////////////
                
            	/* AS-IS */
            	/*
                return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=http://"+serverIp+":8080"+fileUrl+storedFileName;
            	*/
            	/* TO-BE */
                //return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=http://"+serverIp+":8080"+fileUrl+storedFileName;
                return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=http://www.allwork.co.kr"+fileUrl+storedFileName;
            	//System.out.println(return3);
            }else {
                return3 += "&errstr=error";
            }
        }
    }
}
response.sendRedirect(return1+return2+return3);

 %>