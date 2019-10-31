package data.dto;

import java.sql.Timestamp;

public class QuestionByHashDTO {

	private String title;
	private String checked;
	private Timestamp modday;
	private String name;
	private String myid;
	private int qnum;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public Timestamp getModday() {
		return modday;
	}
	public void setModday(Timestamp modday) {
		this.modday = modday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	
	
	
}
