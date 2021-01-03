package com.ilmagna.allworkadmin.admin.services;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminLoginDAO;
import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.config.ApiConstant;

@Service
//@Transactional(readOnly = true)
public class AdminLoginService {
	@Autowired AdminLoginDAO adminLoginDAO;
	
	public ApiLoginAccount getMember(ApiLoginAccount account) throws Exception {
		//return adminLoginDAO.getMember(account);
		ApiLoginAccount item = new ApiLoginAccount();		
		if(!ApiCommonUtils.isNullOrEmpty(account.getUser_id())) {
			List<ApiLoginAccount> list = adminLoginDAO.getMember(account);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}
	
	public void getUserLogin(HttpSession session, ApiLoginAccount account, Map<String, Object> resultMap) throws Exception {
		ApiLoginAccount loginUser = new ApiLoginAccount();
		loginUser = getMember(account);
		
		if (loginUser == null || ApiCommonUtils.isNullOrEmpty(loginUser.getUser_id())) {
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_ERROR);
		} else {
			session.setAttribute(ApiConstant.Result.USER_SESSION_KEY, loginUser);
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_SUCCESS);
		}
	}
}