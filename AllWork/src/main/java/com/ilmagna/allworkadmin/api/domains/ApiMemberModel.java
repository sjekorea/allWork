package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiMemberModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String userId;
	private String userPw;
	private String passwordQue;
	private String passwordChk;
	//private String junnum;			// 사용하지 않음.
	private String userName;
	private String phone;				// 02-1234-5678
	private String hphone;				// 010-1234-5678
	private String birth;				// 1963-1-2
	private String sex;					// 성별 - man, woman
	private String strSex;
	private String email;
	private String useMail;				// yes, no
	private String useSms;
	private String usePush;
	private String post;
	private String address1;
	private String address2;
	private String strWdate;
	private String strLastLogin;
	private Date lastLoginAt;
	private String home;
	private String photo;
	private String pChk;				// yes, no. 용도???
	private Integer userType;			// 1, 2
	//private String lastSchool;		// 사용하지 않음.
	//private String highSchool;		// 사용하지 않음.
	//private String university;		// 사용하지 않음.
	private String left;				// yes, no
	private String secession;			// 용도: 회워탈퇴 남김말.
	private String strLdate;
	private String memo;
	private Integer hit;
	private Integer tosa180422;			// 0, 1. 용도???
	private String strTosa180422Date;
	
	private String roleName;			// 개인회원, 기업회원
	private String token;				// Login 정보 token.
	private String pushToken;			// FCM Push Notification을 위한 device token.

	private String newPw;				// 비밀번호 변경.
	private Integer findType;			// 1, 2. 사용자 ID와 비밀번호 찾는 방법.

	private List<Integer> ids;
	private String sidx;	//sorting field.
	private String sord;	//asc 또는 desc
	private String showAll;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the userPw
	 */
	public String getUserPw() {
		return userPw;
	}
	/**
	 * @param userPw the userPw to set
	 */
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	/**
	 * @return the passwordQue
	 */
	public String getPasswordQue() {
		return passwordQue;
	}
	/**
	 * @param passwordQue the passwordQue to set
	 */
	public void setPasswordQue(String passwordQue) {
		this.passwordQue = passwordQue;
	}
	/**
	 * @return the passwordChk
	 */
	public String getPasswordChk() {
		return passwordChk;
	}
	/**
	 * @param passwordChk the passwordChk to set
	 */
	public void setPasswordChk(String passwordChk) {
		this.passwordChk = passwordChk;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the hphone
	 */
	public String getHphone() {
		return hphone;
	}
	/**
	 * @param hphone the hphone to set
	 */
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}
	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the strSex
	 */
	public String getStrSex() {
		return strSex;
	}
	/**
	 * @param strSex the strSex to set
	 */
	public void setStrSex(String strSex) {
		this.strSex = strSex;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the useMail
	 */
	public String getUseMail() {
		return useMail;
	}
	/**
	 * @param useMail the useMail to set
	 */
	public void setUseMail(String useMail) {
		this.useMail = useMail;
	}
	/**
	 * @return the useSms
	 */
	public String getUseSms() {
		return useSms;
	}
	/**
	 * @param useSms the useSms to set
	 */
	public void setUseSms(String useSms) {
		this.useSms = useSms;
	}
	/**
	 * @return the usePush
	 */
	public String getUsePush() {
		return usePush;
	}
	/**
	 * @param usePush the usePush to set
	 */
	public void setUsePush(String usePush) {
		this.usePush = usePush;
	}
	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}
	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}
	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	/**
	 * @return the strWdate
	 */
	public String getStrWdate() {
		return strWdate;
	}
	/**
	 * @param strWdate the strWdate to set
	 */
	public void setStrWdate(String strWdate) {
		this.strWdate = strWdate;
	}
	/**
	 * @return the strLastLogin
	 */
	public String getStrLastLogin() {
		return strLastLogin;
	}
	/**
	 * @param strLastLogin the strLastLogin to set
	 */
	public void setStrLastLogin(String strLastLogin) {
		this.strLastLogin = strLastLogin;
	}
	/**
	 * @return the lastLoginAt
	 */
	public Date getLastLoginAt() {
		return lastLoginAt;
	}
	/**
	 * @param lastLoginAt the lastLoginAt to set
	 */
	public void setLastLoginAt(Date lastLoginAt) {
		this.lastLoginAt = lastLoginAt;
	}
	/**
	 * @return the home
	 */
	public String getHome() {
		return home;
	}
	/**
	 * @param home the home to set
	 */
	public void setHome(String home) {
		this.home = home;
	}
	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the pChk
	 */
	public String getpChk() {
		return pChk;
	}
	/**
	 * @param pChk the pChk to set
	 */
	public void setpChk(String pChk) {
		this.pChk = pChk;
	}
	/**
	 * @return the userType
	 */
	public Integer getUserType() {
		return userType;
	}
	/**
	 * @param userType the userType to set
	 */
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	/**
	 * @return the left
	 */
	public String getLeft() {
		return left;
	}
	/**
	 * @param left the left to set
	 */
	public void setLeft(String left) {
		this.left = left;
	}
	/**
	 * @return the secession
	 */
	public String getSecession() {
		return secession;
	}
	/**
	 * @param secession the secession to set
	 */
	public void setSecession(String secession) {
		this.secession = secession;
	}
	/**
	 * @return the strLdate
	 */
	public String getStrLdate() {
		return strLdate;
	}
	/**
	 * @param strLdate the strLdate to set
	 */
	public void setStrLdate(String strLdate) {
		this.strLdate = strLdate;
	}
	/**
	 * @return the memo
	 */
	public String getMemo() {
		return memo;
	}
	/**
	 * @param memo the memo to set
	 */
	public void setMemo(String memo) {
		this.memo = memo;
	}
	/**
	 * @return the hit
	 */
	public Integer getHit() {
		return hit;
	}
	/**
	 * @param hit the hit to set
	 */
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	/**
	 * @return the tosa180422
	 */
	public Integer getTosa180422() {
		return tosa180422;
	}
	/**
	 * @param tosa180422 the tosa180422 to set
	 */
	public void setTosa180422(Integer tosa180422) {
		this.tosa180422 = tosa180422;
	}
	/**
	 * @return the strTosa180422Date
	 */
	public String getStrTosa180422Date() {
		return strTosa180422Date;
	}
	/**
	 * @param strTosa180422Date the strTosa180422Date to set
	 */
	public void setStrTosa180422Date(String strTosa180422Date) {
		this.strTosa180422Date = strTosa180422Date;
	}
	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}
	/**
	 * @param roleName the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	/**
	 * @return the token
	 */
	public String getToken() {
		return token;
	}
	/**
	 * @param token the token to set
	 */
	public void setToken(String token) {
		this.token = token;
	}
	/**
	 * @return the pushToken
	 */
	public String getPushToken() {
		return pushToken;
	}
	/**
	 * @param pushToken the pushToken to set
	 */
	public void setPushToken(String pushToken) {
		this.pushToken = pushToken;
	}
	/**
	 * @return the newPw
	 */
	public String getNewPw() {
		return newPw;
	}
	/**
	 * @param newPw the newPw to set
	 */
	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	/**
	 * @return the findType
	 */
	public Integer getFindType() {
		return findType;
	}
	/**
	 * @param findType the findType to set
	 */
	public void setFindType(Integer findType) {
		this.findType = findType;
	}
	/**
	 * @return the ids
	 */
	public List<Integer> getIds() {
		return ids;
	}
	/**
	 * @param ids the ids to set
	 */
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	/**
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}
	/**
	 * @param sidx the sidx to set
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	/**
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}
	/**
	 * @param sord the sord to set
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}
	/**
	 * @return the showAll
	 */
	public String getShowAll() {
		return showAll;
	}
	/**
	 * @param showAll the showAll to set
	 */
	public void setShowAll(String showAll) {
		this.showAll = showAll;
	}
}
