package javaa.swagger.vo;

public class FollowVo {

	 private String user_ID;
	 private String follower_ID;
	
	 public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getFollower_ID() {
		return follower_ID;
	}
	public void setFollower_ID(String follower_ID) {
		this.follower_ID = follower_ID;
	}
	public FollowVo(String user_ID, String follower_ID) {
		super();
		this.user_ID = user_ID;
		this.follower_ID = follower_ID;
	}
	public FollowVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
}
