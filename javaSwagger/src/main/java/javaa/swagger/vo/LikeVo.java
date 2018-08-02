package javaa.swagger.vo;

public class LikeVo {
	private String user_ID;
	private String post_NO;
	private String comment_NO;
	public LikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeVo(String user_ID, String post_NO, String comment_NO) {
		super();
		this.user_ID = user_ID;
		this.post_NO = post_NO;
		this.comment_NO = comment_NO;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getPost_NO() {
		return post_NO;
	}
	public void setPost_NO(String post_NO) {
		this.post_NO = post_NO;
	}
	public String getComment_NO() {
		return comment_NO;
	}
	public void setComment_NO(String comment_NO) {
		this.comment_NO = comment_NO;
	}
	
}
