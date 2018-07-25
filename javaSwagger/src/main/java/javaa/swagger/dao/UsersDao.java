package javaa.swagger.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.UsersManager;
import javaa.swagger.vo.UsersVo;

@Repository
public class UsersDao {

	//회원가입 
	public int insertUser(UsersVo u)
	{
		return UsersManager.insertUser(u);
	}
	
	//로그인
	public boolean isUser(Map map)
	{
		return UsersManager.isUser(map);
	}

	//중복확인
	public int idCheck(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("Duser_id:"+user_id);
		return UsersManager.idCheck(user_id);
	}
	
	public UsersVo profile(Map map) {
		// TODO Auto-generated method stub
		return UsersManager.profile(map);
	}

	public int editProfile(UsersVo u) {
		// TODO Auto-generated method stub
		return UsersManager.editProfile(u);
	}

	public int withdrawUser(Map map) {
		// TODO Auto-generated method stub
		return UsersManager.withdrawUser(map);
	}

	public List<UsersVo> search(Map map) {
		// TODO Auto-generated method stub
		return UsersManager.search(map);
	}
}
