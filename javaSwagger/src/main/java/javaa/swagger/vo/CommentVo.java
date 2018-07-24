package javaa.swagger.vo;

import java.sql.Date;

public class CommentVo {
	private String comment_no;
	private String post_no;
	private String user_id;
	private String comment_content;
	private Date comment_time;
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVo(String comment_no, String post_no, String user_id, String comment_content, Date comment_time) {
		super();
		this.comment_no = comment_no;
		this.post_no = post_no;
		this.user_id = user_id;
		this.comment_content = comment_content;
		this.comment_time = comment_time;
	}
	public String getComment_no() {
		return comment_no;
	}
	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	
}
