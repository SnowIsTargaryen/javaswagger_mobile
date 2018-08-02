package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.FollowManager;
import javaa.swagger.db.LikeManager;
import javaa.swagger.vo.FollowVo;
import javaa.swagger.vo.LikeVo;

@Repository
public class LikeDao {

	public List<LikeVo> whoLike(HashMap map)
	{
		return LikeManager.whoLike(map);
	}
	
	public int cntLike(HashMap map) 
	{
		return LikeManager.cntLike(map);
	}
	
	public int doLike(HashMap map)
	{
		return LikeManager.doLike(map);
	}
	
	public int cancelLike(HashMap map)
	{
		return LikeManager.cancelLike(map);
	}
	
	public int getPno(String comment_NO) {
		return LikeManager.getPno(comment_NO);
	}

	public int isLike(HashMap map) {
		// TODO Auto-generated method stub
		return LikeManager.isLike(map);
	}
}
