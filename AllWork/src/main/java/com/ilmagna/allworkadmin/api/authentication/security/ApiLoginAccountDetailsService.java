package com.ilmagna.allworkadmin.api.authentication.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminLoginDAO;
import com.ilmagna.allworkadmin.api.authentication.security.daos.ApiLoginAccountDAO;
import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiCustomLoginAccountDetails;
import com.ilmagna.allworkadmin.api.authentication.security.domains.ApiLoginAccount;
import com.ilmagna.allworkadmin.api.config.ApiConstant;

@Service
public class ApiLoginAccountDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {
	@Autowired private ApiLoginAccountDAO apiLoginAccountDAO;						//모바일 사용자 Login 처리.
	@Autowired private AdminLoginDAO adminLoginDAO;									//웹 관리자 Login 처리.
	//@Autowired PasswordEncoder passwordEncoder;
	
	//@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		ApiLoginAccount param = new ApiLoginAccount();
		
		//BCryptPasswordEncoder a = new BCryptPasswordEncoder();
		//System.out.println(a.encode("123qwe"));
		
		//arg0에서 User ID, User Type을 분리한다.
		String[] listArg = arg0.split(",");
		String strUserID = listArg[0];
		String strUserType = listArg[1];
		
		param.setUser_id(strUserID);
		
		String username = "";
		String password = "";
		
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		ApiLoginAccount loginUser = null;
		
		try {
			//사용자 정보 추출.
			//loginUser = apiLoginAccountDAO.getMember(param);
			loginUser = new ApiLoginAccount();		
			List<ApiLoginAccount> list = new ArrayList<ApiLoginAccount>();
			if (strUserType.compareToIgnoreCase("" + ApiConstant.USER_TYPE_ADMIN) == 0) {
				//웹 관리자 계정 검사.
				list = adminLoginDAO.getMember(param);
			} else {
				//모바일 사용자 계정 검사.
				list = apiLoginAccountDAO.getMember(param);
			}
			
			if(list != null && list.size() > 0) {
				loginUser = list.get(0);
			}

			if (loginUser != null && loginUser.getId() > 0) {
				username = loginUser.getUser_name();
				//password = loginUser.getUser_pw();					//암호화된 비밀번호를 사용하는 경우.
				BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
				password = pwEncoder.encode(loginUser.getUser_pw());	//암호화되지 않은 비밀번호를 사용하는 경우.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ApiCustomLoginAccountDetails user = new ApiCustomLoginAccountDetails(username, password, authorities, loginUser);
		if (user != null) {
			user.setUser_type("" + loginUser.getUser_type());
			user.setUser_name(loginUser.getUser_name());
			user.setRole_name(loginUser.getRole_name());
		}
		
		return user;
	}
	
	/*
	 * password 생성
	 */
	public static void main(String[] args) {
		BCryptPasswordEncoder a = new BCryptPasswordEncoder();
		System.out.println(a.encode("123qwe"));
	}
}
