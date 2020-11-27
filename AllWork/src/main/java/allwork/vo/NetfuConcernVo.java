package allwork.vo;

public class NetfuConcernVo {
	
	private int noTo;
	private String uid;
	private String cnt;
	private String bizName;
	private String rUid;
	private int bizIngCnt;
	private int bizNotIngCnt;
	
	
	
	public int getBizIngCnt() {
		return bizIngCnt;
	}
	public int getBizNotIngCnt() {
		return bizNotIngCnt;
	}
	public void setBizIngCnt(int bizIngCnt) {
		this.bizIngCnt = bizIngCnt;
	}
	public void setBizNotIngCnt(int bizNotIngCnt) {
		this.bizNotIngCnt = bizNotIngCnt;
	}
	public int getNoTo() {
		return noTo;
	}
	public void setNoTo(int noTo) {
		this.noTo = noTo;
	}
	public String getrUid() {
		return rUid;
	}
	public void setrUid(String rUid) {
		this.rUid = rUid;
	}
	public String getUid() {
		return uid;
	}
	public String getCnt() {
		return cnt;
	}
	public String getBizName() {
		return bizName;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	

}
