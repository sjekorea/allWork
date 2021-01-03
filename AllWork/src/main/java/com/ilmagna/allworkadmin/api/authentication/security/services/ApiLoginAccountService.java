package com.ilmagna.allworkadmin.api.authentication.security.services;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ilmagna.allworkadmin.api.authentication.security.daos.ApiLoginAccountDAO;
import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.config.ApiConstant;

@Service
//@Transactional(readOnly = true)
public class ApiLoginAccountService {
	@Autowired ApiLoginAccountDAO apiLoginAccountDAO;
	
	public ApiLoginAccount getMember(ApiLoginAccount account) throws Exception {
		//return apiLoginAccountDAO.getMember(account);
		ApiLoginAccount item = new ApiLoginAccount();		
		if(!ApiCommonUtils.isNullOrEmpty(account.getUser_id())) {
			List<ApiLoginAccount> list = apiLoginAccountDAO.getMember(account);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	@Transactional(readOnly = false, rollbackFor = Exception.class)
	public int updateUserLoginTime(ApiLoginAccount account) throws Exception {
		return apiLoginAccountDAO.updateUserLoginTime(account);
	}
	
	@Transactional(readOnly = false, rollbackFor = Exception.class)
	public void updateLogoutToken(String user_id) throws Exception {
		apiLoginAccountDAO.updateLogoutUserToken(user_id);
	}
	
	public void getUserLogin(HttpSession session, ApiLoginAccount account, Map<String, Object> resultMap) throws Exception {
		ApiLoginAccount loginUser = new ApiLoginAccount();
		loginUser = getMember(account);
		
		if (loginUser == null || loginUser.getId() == null || loginUser.getId() < 1) {
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_ERROR);
		} else {
			session.setAttribute(ApiConstant.Result.USER_SESSION_KEY, loginUser);
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_SUCCESS);
		}
	}
}