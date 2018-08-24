package javaa.swagger.vo;

public class LikeVo {
	private String user_ID;
	private String post_no;
	private String comment_no;
	public LikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeVo(String user_ID, String post_no, String comment_no) {
		super();
		this.user_ID = user_ID;
		this.post_no = post_no;
		this.comment_no = comment_no;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getComment_no() {
		return comment_no;
	}
	public void setComment_no(String comment_no) {
		this.comment_no = comment_no;
	}
	
}
