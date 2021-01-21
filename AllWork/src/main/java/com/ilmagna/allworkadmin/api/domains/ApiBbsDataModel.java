package com.ilmagna.allworkadmin.api.domains;

import java.io.Serializable;
import java.util.List;

import com.ilmagna.allworkadmin.api.common.ApiJqGridParams;

public class ApiBbsDataModel extends ApiJqGridParams implements Serializable  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4850708721418549451L;
	
	private Integer id;
	private String boardCode;
	private Integer ref;				// 답글에 해당하는 원본 Root 글의 ID.
	private Integer replyReq;			// 답글 Order 0->1->2.
	private Integer replyLevel;			// 답글 level. 원글은 0. 답글은 1 이상.
	private Integer good;				// X
	private String passwd;				// X
	private String type;				// 게시판 Group code
	private String subType;				// 게시판 Sub Group code.
	private String uid;					// 작성자 UID
	private String nickName;			// 작성자 이름
	private String subject;				// 제목
	private String link;				// 기존에는 사용하자지 않음 -> 배너광고에서 연결되는 URL
	private String fileId1;				// 첨부파일 ID -> X
	private String fileName1;			// 첨부파일 이름 -> X.
	private String fileId2;
	private String fileName2;
	private String fileId3;
	private String fileName3;
	private String fileId4;
	private String fileName4;
	private String fileId5;
	private String fileName5;
	private String content;				// 내용.
	private String open;				// X
	private Integer hit;				// 조회수.
	private String strWdate;			// 작성일.
	private String thumbnail;			// (신규) Thumbnail 이미지.

	private String boardType;			// 게시판 Type - netfu_board_admin의 type 값.
	private String boardName;			// 게시판 이름.
	private String hphone;				// 작성자 휴대폰.
	private String email;				// 작성자 e-mail.
	String fromDate, toDate;			// 검색조건 - 작성일 범위.
	private Integer itemNo;				//목록화면에서 게시판 항목의 번호 - View only.

	private List<Integer> ids;			// 일괄삭제 ID 목록.
	private String sidx;				// sorting field.
	private String sord;				// asc 또는 desc
	private String showAll;				// 검색조건 - 전체보기.

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
	 * @return the boardCode
	 */
	public String getBoardCode() {
		return boardCode;
	}
	/**
	 * @param boardCode the boardCode to set
	 */
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	/**
	 * @return the ref
	 */
	public Integer getRef() {
		return ref;
	}
	/**
	 * @param ref the ref to set
	 */
	public void setRef(Integer ref) {
		this.ref = ref;
	}
	/**
	 * @return the replyReq
	 */
	public Integer getReplyReq() {
		return replyReq;
	}
	/**
	 * @param replyReq the replyReq to set
	 */
	public void setReplyReq(Integer replyReq) {
		this.replyReq = replyReq;
	}
	/**
	 * @return the replyLevel
	 */
	public Integer getReplyLevel() {
		return replyLevel;
	}
	/**
	 * @param replyLevel the replyLevel to set
	 */
	public void setReplyLevel(Integer replyLevel) {
		this.replyLevel = replyLevel;
	}
	/**
	 * @return the good
	 */
	public Integer getGood() {
		return good;
	}
	/**
	 * @param good the good to set
	 */
	public void setGood(Integer good) {
		this.good = good;
	}
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the subType
	 */
	public String getSubType() {
		return subType;
	}
	/**
	 * @param subType the subType to set
	 */
	public void setSubType(String subType) {
		this.subType = subType;
	}
	/**
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}
	/**
	 * @return the nickName
	 */
	public String getNickName() {
		return nickName;
	}
	/**
	 * @param nickName the nickName to set
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the link
	 */
	public String getLink() {
		return link;
	}
	/**
	 * @param link the link to set
	 */
	public void setLink(String link) {
		this.link = link;
	}
	/**
	 * @return the fileId1
	 */
	public String getFileId1() {
		return fileId1;
	}
	/**
	 * @param fileId1 the fileId1 to set
	 */
	public void setFileId1(String fileId1) {
		this.fileId1 = fileId1;
	}
	/**
	 * @return the fileName1
	 */
	public String getFileName1() {
		return fileName1;
	}
	/**
	 * @param fileName1 the fileName1 to set
	 */
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	/**
	 * @return the fileId2
	 */
	public String getFileId2() {
		return fileId2;
	}
	/**
	 * @param fileId2 the fileId2 to set
	 */
	public void setFileId2(String fileId2) {
		this.fileId2 = fileId2;
	}
	/**
	 * @return the fileName2
	 */
	public String getFileName2() {
		return fileName2;
	}
	/**
	 * @param fileName2 the fileName2 to set
	 */
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	/**
	 * @return the fileId3
	 */
	public String getFileId3() {
		return fileId3;
	}
	/**
	 * @param fileId3 the fileId3 to set
	 */
	public void setFileId3(String fileId3) {
		this.fileId3 = fileId3;
	}
	/**
	 * @return the fileName3
	 */
	public String getFileName3() {
		return fileName3;
	}
	/**
	 * @param fileName3 the fileName3 to set
	 */
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	/**
	 * @return the fileId4
	 */
	public String getFileId4() {
		return fileId4;
	}
	/**
	 * @param fileId4 the fileId4 to set
	 */
	public void setFileId4(String fileId4) {
		this.fileId4 = fileId4;
	}
	/**
	 * @return the fileName4
	 */
	public String getFileName4() {
		return fileName4;
	}
	/**
	 * @param fileName4 the fileName4 to set
	 */
	public void setFileName4(String fileName4) {
		this.fileName4 = fileName4;
	}
	/**
	 * @return the fileId5
	 */
	public String getFileId5() {
		return fileId5;
	}
	/**
	 * @param fileId5 the fileId5 to set
	 */
	public void setFileId5(String fileId5) {
		this.fileId5 = fileId5;
	}
	/**
	 * @return the fileName5
	 */
	public String getFileName5() {
		return fileName5;
	}
	/**
	 * @param fileName5 the fileName5 to set
	 */
	public void setFileName5(String fileName5) {
		this.fileName5 = fileName5;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the open
	 */
	public String getOpen() {
		return open;
	}
	/**
	 * @param open the open to set
	 */
	public void setOpen(String open) {
		this.open = open;
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
	 * @return the thumbnail
	 */
	public String getThumbnail() {
		return thumbnail;
	}
	/**
	 * @param thumbnail the thumbnail to set
	 */
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	/**
	 * @return the boardType
	 */
	public String getBoardType() {
		return boardType;
	}
	/**
	 * @param boardType the boardType to set
	 */
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	/**
	 * @return the boardName
	 */
	public String getBoardName() {
		return boardName;
	}
	/**
	 * @param boardName the boardName to set
	 */
	public void setBoardName(String boardName) {
		this.boardName = boardName;
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
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}
	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}
	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	/**
	 * @return the itemNo
	 */
	public Integer getItemNo() {
		return itemNo;
	}
	/**
	 * @param itemNo the itemNo to set
	 */
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
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
