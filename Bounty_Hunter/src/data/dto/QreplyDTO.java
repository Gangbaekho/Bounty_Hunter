package data.dto;

import java.sql.Timestamp;

public class QreplyDTO {
	private int num;
	private int mnum;
	private int qnum;
	private String checked;
	private String content;
	private Timestamp createday;
	private Timestamp modday;
	
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
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
}
