package javaa.swagger.vo;

public class UsersVo {

	 private String user_ID;
	 private String user_Password;
	 private String user_Email;
	 private String user_Phone;
	 
	 
	 
	public UsersVo(String user_ID, String user_Password, String user_Email, String user_Phone) {
		super();
		this.user_ID = user_ID;
		this.user_Password = user_Password;
		this.user_Email = user_Email;
		this.user_Phone = user_Phone;
	}
	public UsersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	public String getUser_Password() {
		return user_Password;
	}
	public void setUser_Password(String user_Password) {
		this.user_Password = user_Password;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}
	public String getUser_Phone() {
		return user_Phone;
	}
	public void setUser_Phone(String user_Phone) {
		this.user_Phone = user_Phone;
	}
	
	 

}
