package javaa.swagger.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class PostVo {
	private String post_no;
	private String user_id;
	private Date post_time;
	private Date post_delTime;   
	private String post_content;
	private String post_fname;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
	public String getPost_fname() {
		return post_fname;
	}
	public void setPost_fname(String post_fname) {
		this.post_fname = post_fname;
	}
	public PostVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVo(String post_no, String user_id, Date post_time, Date post_delTime, String post_content,
			String post_fname) {
		super();
		this.post_no = post_no;
		this.user_id = user_id;
		this.post_time = post_time;
		this.post_delTime = post_delTime;
		this.post_content = post_content;
		this.post_fname = post_fname;
	}
	
}
