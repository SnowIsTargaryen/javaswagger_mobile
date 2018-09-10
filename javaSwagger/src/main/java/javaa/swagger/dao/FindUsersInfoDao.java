package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.FindUsersInfoManager;
import javaa.swagger.db.UsersManager;
import javaa.swagger.vo.UsersVo;

@Repository
public class FindUsersInfoDao {

	public UsersVo findId(Map map) {
		// TODO Auto-generated method stub
		return FindUsersInfoManager.findId(map);
	}
	public UsersVo findPwd(Map map) {
		// TODO Auto-generated method stub
		return FindUsersInfoManager.findPwd(map);
	}

	
}
