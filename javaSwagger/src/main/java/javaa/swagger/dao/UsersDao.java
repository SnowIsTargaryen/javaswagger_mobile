package javaa.swagger.dao;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.UsersManager;
import javaa.swagger.vo.UsersVo;

@Repository
public class UsersDao {

	public int insertUser(UsersVo u)
	{
		
		return UsersManager.insertUser(u);
	}
}
