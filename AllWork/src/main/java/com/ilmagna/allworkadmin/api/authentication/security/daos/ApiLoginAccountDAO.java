package com.ilmagna.allworkadmin.api.authentication.security.daos;

import java.util.List;

import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;

public interface ApiLoginAccountDAO {
	public List<ApiLoginAccount> getMember(ApiLoginAccount account) throws Exception;
	public int updateUserLoginTime(ApiLoginAccount account) throws Exception;
	public void updateLogoutUserToken(String user_id) throws Exception;
}
