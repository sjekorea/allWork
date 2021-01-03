package com.ilmagna.allworkadmin.api.authentication.security.domains;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.User;

public class ApiCustomLoginAccountDetails extends User {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	
	private com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount apiLoginAccount;
	private String user_name;
	private String role_name;
	private String user_type;

	public ApiCustomLoginAccountDetails(String username,
			String password,
			boolean enabled,
			boolean accountNonExpired,
			boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	public ApiCustomLoginAccountDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount apiLoginAccount) {
		super(username, password, true, true, true, true, authorities);
		
		this.apiLoginAccount = apiLoginAccount;
	}
	
	public ApiCustomLoginAccountDetails(String username,
			String password,
			boolean enabled,
			boolean accountNonExpired,
			boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,
			com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount apiLoginAccount) {
		
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.apiLoginAccount = apiLoginAccount;
	}
	
	public ApiCustomLoginAccountDetails(String username, String password, Collection<? extends GrantedAuthority> authorities, String user_name, String role_name, String user_type) {
		super(username, password, true, true, true, true, authorities);
		
		this.user_name = user_name;
		this.role_name = role_name;
		this.user_type = user_type;
	}
	
	public com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount getUser() {
		return apiLoginAccount;
	}
	public void setUser(com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount apiLoginAccount) {
		this.apiLoginAccount = apiLoginAccount;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
}