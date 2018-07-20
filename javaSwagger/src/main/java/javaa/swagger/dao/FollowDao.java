package javaa.swagger.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.FollowManager;
import javaa.swagger.vo.FollowVo;

@Repository
public class FollowDao {

	public List<FollowVo> listFollow()
	{
		return FollowManager.listFollow();
	}
	
	public int insertFollow(FollowVo f)
	{
		return FollowManager.insertFollower(f);
	}
	
	public int deleteFollow(String follower_ID)
	{
		return FollowManager.deleteFollower(follower_ID);
	}
}
