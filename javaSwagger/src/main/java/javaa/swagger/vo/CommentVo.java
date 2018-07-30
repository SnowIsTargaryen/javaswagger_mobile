package javaa.swagger.vo;

import java.sql.Date;

public class CommentVo {
	private int comment_no;
	private int post_no;
	private String user_ID;
	private Date comment_time;
	private String comment_content;
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVo(int comment_no, int post_no, String user_ID, Date comment_time, String comment_content) {
		super();
		this.comment_no = comment_no;
		this.post_no = post_no;
		this.user_ID = user_ID;
		this.comment_time = comment_time;
		this.comment_content = comment_content;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	
	
}
