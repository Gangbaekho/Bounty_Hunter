package data.dto;

import java.sql.Timestamp;

public class QuestionDTO {

	private int num;
	private int mnum;
	private String title;
	private String content;
	private String checked;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	
}
