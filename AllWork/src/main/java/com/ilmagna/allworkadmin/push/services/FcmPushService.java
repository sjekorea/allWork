package com.ilmagna.allworkadmin.push.services;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.MulticastMessage;
import com.google.firebase.messaging.SendResponse;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;
import com.ilmagna.allworkadmin.api.services.ApiMemberService;
import com.ilmagna.allworkadmin.push.domains.PushItemModel;
import com.ilmagna.allworkadmin.push.domains.PushRequestModel;

import allwork.common.CommandMap;

@Service("fcmPushService")
public class FcmPushService {
	
	//@Autowired protected ApiMemberService memberService;
	@Resource(name="apiMemberService")
	private ApiMemberService memberService;

	
	// Push Notification 발송 대상 선정 및 발송.
	//1. (내부 Test용) 관리자 웹을 통헤, Sample로 Push Notification 발송.
	public boolean sendPushNotificationTest(String fcm_key_loc, PushItemModel model) {
		boolean bResult = false;
		try {
			//회원정보에서 Push Token 읽어오기.
			ApiMemberModel modelMember = new ApiMemberModel();
			modelMember.setUserId(model.getUid());
			modelMember = memberService.getMember(modelMember);
			if (modelMember == null || modelMember.getPushToken() == null || modelMember.getPushToken().length() < 1) return true;
			//System.out.println("push_token = " + modelMember.getPushToken());
			
			//사용자의 Push Token을 이용해 Device에 Push Notification 발송.
			List<String> listToken = new ArrayList<String>();
			listToken.add(modelMember.getPushToken());

			bResult = send_Multi_FCMtoken(fcm_key_loc, listToken, model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bResult;
	}
	
	/**
	 * 신규 채용공고가 등록된 경우에 발송하는 Push Notification.
	 * @param fcm_key_loc = FCM Push 키 파일의 Full 경로명 - Properties에서 정의.
	 * @param id = 채용공고 ID
	 * @param name = 회사 이름.
	 * @param bizTypeCode = 직무(biz type) 코드.
	 * @param areaCode = 근무지(Area) 코드.
	 * @param title = 채용공고 제목.
	 * @return true = Push 메시지 전송에 성공한 경우. false = 오류가 발생해서 Push 메시지를 전송하지 못한 경우.
	 */
	public boolean sendPushNotificationOnRecruit(String fcm_key_loc, int id, String name, String bizTypeCode, String areaCode, String title) {
		boolean bResult = false;
		try {
			//Push 전송 대상 Token 검색.
			ApiRecruitModel model = new ApiRecruitModel();
			model.setBizType1(bizTypeCode);
			model.setBizArea1(areaCode);
			List<ApiMemberModel> list = memberService.getPushMemberList(model);
			if (list == null || list.size() < 1) return true;
			
			List<String> listToken = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				listToken.add(list.get(i).getPushToken());
			}

			//현재날짜와 시각정보 획득.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calToday = Calendar.getInstance();
			String strToday = sdf.format(calToday.getTime());

			//메시지 데이터 구성.
			PushItemModel modelPushItem = new PushItemModel();
			modelPushItem.setType(1);
			modelPushItem.setRef_id(id);
			modelPushItem.setName(name);
			modelPushItem.setTitle(title);
			modelPushItem.setWdate(strToday);
			modelPushItem.setWtimestamp(calToday.getTime().getTime());

			//Push Notification 전송.
			bResult = send_Multi_FCMtoken(fcm_key_loc, listToken, modelPushItem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bResult;
	}

	public boolean sendPushNotificationOnRecruit2(String fcm_key_loc, PushRequestModel pushRequestModel) {
		boolean bResult = false;
		try {
			//전송조건 확인.
			//	1. 직무/업무 또는 지역이 설정되지 않은 경우에는 Push Notification을 발송하지 않는다.
			if (pushRequestModel.getListBizType().size() < 1 || pushRequestModel.getListArea().size() < 1) return true;

			//DB Query 생성.
			String strQuery = "A.biz_category IN (";
			for (int i = 0; i < pushRequestModel.getListBizType().size(); i++) {
				String strBizTypeCode = pushRequestModel.getListBizType().get(i);
				if (i > 0) strQuery += ", ";
				strQuery += "'" + strBizTypeCode + "'";
			}
			strQuery += ") AND (";
			for (int i = 0; i < pushRequestModel.getListArea().size(); i++) {
				String strBizTypeCode = pushRequestModel.getListArea().get(i);
				if (i > 0) strQuery += " OR ";
				strQuery += "A.address1 LIKE '" + strBizTypeCode + "%'";
			}
			strQuery += ")";

			//Push 전송 대상 Token 검색.
			ApiRecruitModel model = new ApiRecruitModel();
			model.setStrQuery(strQuery);
			List<ApiMemberModel> list = memberService.getPushMemberList2(model);
			if (list == null || list.size() < 1) return true;
			
			List<String> listToken = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				listToken.add(list.get(i).getPushToken());
			}

			//현재날짜와 시각정보 획득.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calToday = Calendar.getInstance();
			String strToday = sdf.format(calToday.getTime());

			//메시지 데이터 구성.
			PushItemModel modelPushItem = new PushItemModel();
			modelPushItem.setType(1);
			modelPushItem.setRef_id(pushRequestModel.getRequestId());
			modelPushItem.setName(pushRequestModel.getName());
			modelPushItem.setTitle(pushRequestModel.getTitle());
			modelPushItem.setUid(pushRequestModel.getUid());						//발신 사용자 ID.

			modelPushItem.setWdate(strToday);
			modelPushItem.setWtimestamp(calToday.getTime().getTime());

			//Push Notification 전송.
			bResult = send_Multi_FCMtoken(fcm_key_loc, listToken, modelPushItem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bResult;
	}


	/**
	 * 신규 이력서가 등록된 경우에 발송하는 Push Notification.
	 * @param fcm_key_loc = FCM Push 키 파일의 Full 경로명 - Properties에서 정의.
	 * @param id = 이력서 ID
	 * @param name = 구직자 이름.
	 * @param bizTypeCode = 직무(biz type) 코드.
	 * @param areaCode = 희망 근무지(Area) 코드.
	 * @param title = 이력서 제목.
	 * @return true = Push 메시지 전송에 성공한 경우. false = 오류가 발생해서 Push 메시지를 전송하지 못한 경우.
	 */
	public boolean sendPushNotificationOnResume(String fcm_key_loc, int id, String name, String bizTypeCode, String areaCode, String title) {
		boolean bResult = false;
		try {
			//Push 전송 대상 Token 검색.
			ApiResumeModel model = new ApiResumeModel();
			model.setInidType1(bizTypeCode);
			model.setInidArea1(areaCode);
			List<ApiMemberModel> list = memberService.getPushCompanyList(model);
			if (list == null || list.size() < 1) return true;

			List<String> listToken = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				listToken.add(list.get(i).getPushToken());
			}

			//현재날짜와 시각정보 획득.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calToday = Calendar.getInstance();
			String strToday = sdf.format(calToday.getTime());

			//메시지 데이터 구성.
			PushItemModel modelPushItem = new PushItemModel();
			modelPushItem.setType(2);
			modelPushItem.setRef_id(id);
			modelPushItem.setName(name);
			modelPushItem.setTitle(title);
			modelPushItem.setWdate(strToday);
			modelPushItem.setWtimestamp(calToday.getTime().getTime());
			
			//Push Notification 전송.
			bResult = send_Multi_FCMtoken(fcm_key_loc, listToken, modelPushItem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bResult;
	}

	
	/**
	 * 기업회원이 개인회원에게 면접요청을 한 경우에 발송하는 Push Notification.
	 * @param fcm_key_loc = FCM Push 키 파일의 Full 경로명 - Properties에서 정의.
	 * @param commandMap = 면접요청 정보.
	 * @return true = Push 메시지 전송에 성공한 경우. false = 오류가 발생해서 Push 메시지를 전송하지 못한 경우.
	 */
	public boolean sendPushNotificationOnInterview(String fcm_key_loc, CommandMap commandMap) {
		boolean bResult = false;
		try {
			String toType = (String) commandMap.get("toType");
			if (toType == null || !toType.equalsIgnoreCase("interview")) return true;

			//Notification 정보 준비.
			PushItemModel modelPushItem = new PushItemModel();
			modelPushItem.setType(3); 														//면접요청.
			modelPushItem.setRef_id(Integer.parseInt((String) commandMap.get("fromNo"))); 	//채용공고 ID.
			modelPushItem.setName((String) commandMap.get("senderName"));					//회사이름.
			modelPushItem.setTitle((String) commandMap.get("senderTitle"));					//채용공고 제목.
			modelPushItem.setUid((String) commandMap.get("uid"));							//발신 사용자 ID.

			//Push 전송 대상 Token 검색.
			ApiMemberModel modelMember = new ApiMemberModel();
			modelMember.setUserId((String) commandMap.get("toUid"));						//수신자 검색.
			modelMember = memberService.getMember(modelMember);
			if (modelMember == null || modelMember.getPushToken() == null || modelMember.getPushToken().length() < 1) return true;
			//System.out.println("push_token = " + modelMember.getPushToken());
			
			//사용자의 Push Token을 이용해 Device에 Push Notification 발송.
			List<String> listToken = new ArrayList<String>();
			listToken.add(modelMember.getPushToken());

			//현재날짜와 시각정보 획득.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calToday = Calendar.getInstance();
			String strToday = sdf.format(calToday.getTime());

			//메시지 데이터 구성.
			modelPushItem.setWdate(strToday);
			modelPushItem.setWtimestamp(calToday.getTime().getTime());

			//Push Notification 전송.
			bResult = send_Multi_FCMtoken(fcm_key_loc, listToken, modelPushItem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bResult;
	}

	

	// FCM Push Notification 발송.
	protected boolean send_Multi_FCMtoken(String fcm_key_loc, List<String> listToken, PushItemModel model) throws IOException, FirebaseMessagingException {
		boolean bResult = false;
		try {
			FileInputStream serviceAccount = new FileInputStream(fcm_key_loc);			// "인증파일경로"
			
			//FirebaseOptions options = FirebaseOptions.builder()
			//	.setCredentials(GoogleCredentials.fromStream(serviceAccount))
			//	.setDatabaseUrl(fcm_firebase_url)										// "본인 파이어베이스 url"
			//	.build();
			FirebaseOptions options = new FirebaseOptions.Builder()
				.setCredentials(GoogleCredentials.fromStream(serviceAccount))
				.build();
			
			if(FirebaseApp.getApps().isEmpty()) {
				FirebaseApp.initializeApp(options);
			}
		
			MulticastMessage message = MulticastMessage.builder()
				//.putData("title", (model.getType() == 1)? "신규 채용공고 등록" : "신규 이력서 등록")
				.putData("title", model.getTitle())
				.putData("content", model.getJsonString())
				.addAllTokens(listToken)
				.build();
				
				BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);	
					
				if (response.getFailureCount() > 0) {
					List<SendResponse> responses = response.getResponses();
					List<String> failedTokens = new ArrayList<>();
					for (int i = 0; i < responses.size(); i++) {
					if (!responses.get(i).isSuccessful()) {
						// The order of responses corresponds to the order of the registration tokens.
						failedTokens.add(listToken.get(i));
					}
				}
			}
			bResult = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bResult;
	}
}