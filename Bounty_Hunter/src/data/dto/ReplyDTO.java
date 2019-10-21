package data.dto;

import java.sql.Timestamp;

public class ReplyDTO {

	private int num;
	private int mnum;
	private int bnum;
	private String content;
	private int bounty;
	private Timestamp createday;
	private Timestamp modday;
	
	public Timestamp getCreateday() {
		return createday;
	}
	public void setCreateday(Timestamp createday) {
		this.createday = createday;
	}
	public Timestamp getModday() {
		return modday;
	}
	public void setModday(Timestamp modday) {
		this.modday = modday;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBounty() {
		return bounty;
	}
	public void setBounty(int bounty) {
		this.bounty = bounty;
	}
	
	
}
