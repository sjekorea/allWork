package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;

public interface AdminLoginDAO {
	public List<ApiLoginAccount> getMember(ApiLoginAccount account) throws Exception;
}
