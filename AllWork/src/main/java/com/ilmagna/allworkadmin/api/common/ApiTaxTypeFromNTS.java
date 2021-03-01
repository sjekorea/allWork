package com.ilmagna.allworkadmin.api.common;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.util.StringUtils;


public class ApiTaxTypeFromNTS {
	private static final Logger logger = LoggerFactory.getLogger("ApiTaxTypeFromNTS");
	
	public ApiTaxTypeFromNTS() { 
		
	} 
	
	/** 국세청 홈텍스에서 사업자과세유형을 조회하여 반환. 
	 * @param listBusinessRegNo 
	 * @return 
	 */
	/*
	public List<Map<String, String>> selectTaxTypeFromNts(List<String> listBusinessRegNo) { 
		List<Map<String, String>> list = new ArrayList<>(); 
		for (String businessRegNo : listBusinessRegNo) { 
			list.add(getTaxTypeFromNts(businessRegNo)); 
		} 
		return list; 
	} 
	*/
	
	/** 국세청 홈텍스에서 사업자과세유형을 조회하여 반환. 
	 * @param businessRegNo 
	 * @return 
	 */ 
	public static boolean getTaxTypeFromNts(String businessRegNo) 
	{ 
		boolean bValidBizNo = false;
		try {
			if (null == businessRegNo || "".equals(businessRegNo)) 
			{ 
				//throw new RuntimeException("조회할 사업자등록번호를 입력해주세요."); 
				return false;
			} 
			
			String txprDscmNo = StringUtils.replace(businessRegNo, "-", ""); 
			if (txprDscmNo.length() != 10) 
			{ 
				//throw new RuntimeException("조회할 사업자등록번호를 올바로 입력해주세요."); 
				return false;
			}
			
			String dongCode = txprDscmNo.substring(3, 5); 
			String url = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId="; 
			
			Map<String, String> headers = new HashMap<>(); 
			headers.put("Accept", "application/xml; charset=UTF-8"); 
			headers.put("Accept-Encoding", "gzip, deflate, br"); 
			headers.put("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7"); 
			headers.put("Connection", "keep-alive"); 
			headers.put("Content-Length", "257"); 
			headers.put("Content-Type", "application/xml; charset=UTF-8"); 
			headers.put("Host", "teht.hometax.go.kr"); 
			headers.put("Origin", "https://teht.hometax.go.kr"); 
			headers.put("Referer", "https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml"); 
			headers.put("Sec-Fetch-Mode", "cors"); 
			headers.put("Sec-Fetch-Site", "same-origin"); 
			headers.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"); 
			
			final String CRLF = "\n"; 
			StringBuffer sb = new StringBuffer(); 
			sb.append("<map id=\"ATTABZAA001R08\">" + CRLF); 
			sb.append(" <pubcUserNo/>" + CRLF); 
			sb.append(" <mobYn>N</mobYn>" + CRLF); 
			sb.append(" <inqrTrgtClCd>1</inqrTrgtClCd>" + CRLF); 
			sb.append(" <txprDscmNo>" + txprDscmNo + "</txprDscmNo>" + CRLF); 
			sb.append(" <dongCode>" + dongCode + "</dongCode>" + CRLF); 
			sb.append(" <psbSearch>Y</psbSearch>" + CRLF); 
			sb.append(" <map id=\"userReqInfoVO\"/>" + CRLF); 
			sb.append("</map>" + CRLF); 
			
			String body = sb.toString(); 
			
			Map<String, String> map = new HashMap<>(); 
			try { 
				Response res = Jsoup.connect(url) 
						.headers(headers) 
						.requestBody(body) 
						.timeout(10000) 
						.method(Method.POST) 
						.execute(); 
				if (logger.isDebugEnabled()) 
				{ 
					logger.debug((String) res.body()); 
				} 
				
				String resBody = (String) res.body();
				//Document document = DocumentHelper.parseText((String) res.body()); 
				SAXReader reader = new SAXReader();
				Document document = reader.read(new StringReader(resBody));
				Element rootElement = document.getRootElement();
				List children = rootElement.elements();
				System.out.println(children.size());
				for (int j = 0; j < children.size(); j++) {
					System.out.println(children.get(j).toString());
					Element element = (Element) children.get(j);
					System.out.println(element.getName() + "," + element.getStringValue());
					if (element.getName().equalsIgnoreCase("nrgtTxprYn")
							&& element.getStringValue().equalsIgnoreCase("N")) {
						bValidBizNo = true;
						break;
					}
				}
				
				/*
				String resBody3 = document.valueOf("//map/trtCntn");
				//String trtCntn = StringUtils.nvl(document.valueOf("//map/trtCntn"), ""); 
				String trtCntn = "";
				if (document.valueOf("//map/trtCntn") != null) trtCntn = document.valueOf("//map/trtCntn");
				if (logger.isDebugEnabled()) 
				{ 
					logger.debug("trtCntn[" + trtCntn + "]"); 
				} 
				//map.put(businessRegNo, trtCntn); 
				*/
			} catch (IOException e) 
			{ 
				logger.error("Jsoup 오류", e); 
			} catch (DocumentException e) 
			{ 
				logger.error("Document parse 오류", e); 
			}
			
			//return map; 		
		} catch(Exception e) {
			
		}
		return bValidBizNo;
	}

}