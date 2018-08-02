package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.FollowManager;
import javaa.swagger.vo.FollowVo;

@Repository
public class FollowDao {

	public List<FollowVo> following(String following_ID)
	{
		return FollowManager.following(following_ID);
	}
	
	public List<FollowVo> follower(String user_ID) 
	{
		return FollowManager.follower(user_ID);
	}
	
	public int insertFollow(HashMap map)
	{
		return FollowManager.insertFollower(map);
	}
	
	public int deleteFollow(HashMap map)
	{
		return FollowManager.deleteFollower(map);
	}
	
	public int isFollow(HashMap map) {
		return FollowManager.isFollower(map);
	}
}
