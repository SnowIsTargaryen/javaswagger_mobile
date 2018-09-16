package javaa.swagger.vo;

import java.sql.Date;

public class PostVo {
	private String post_No;
	private String user_ID;
	private Date post_time;
	private Date post_delTime;   
	private String post_content;
	private String post_Fname;
	public String getPost_No() {
		return post_No;
	}
	public void setPost_No(String post_No) {
		this.post_No = post_No;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public Date getPost_time() {
		return post_time;
	}
	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}
	public Date getPost_delTime() {
		return post_delTime;
	}
	public void setPost_delTime(Date post_delTime) {
		this.post_delTime = post_delTime;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_Fname() {
		return post_Fname;
	}
	public void setPost_Fname(String post_Fname) {
		this.post_Fname = post_Fname;
	}
	public PostVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVo(String post_No, String user_ID, Date post_time, Date post_delTime, String post_content,
			String post_Fname) {
		super();
		this.post_No = post_No;
		this.user_ID = user_ID;
		this.post_time = post_time;
		this.post_delTime = post_delTime;
		this.post_content = post_content;
		this.post_Fname = post_Fname;
	}
	
}
