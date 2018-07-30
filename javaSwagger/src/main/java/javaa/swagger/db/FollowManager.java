package javaa.swagger.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.FollowVo;

public class FollowManager {

	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public static int isFollower(FollowVo f) {
		int re = 0;
		SqlSession s = factory.openSession();
		re = s.selectOne("follow.isFollower",f);
		return re;
	}
	
	// follower_IDÀÇ ÆÈ·ÎÀ® ¸ñ·Ï »Ì±â
	public static List<FollowVo> following(String follower_ID){
		SqlSession s = factory.openSession(); 
		List<FollowVo> list = s.selectList("follow.following", follower_ID); 
		s.close();
		return list;
	}
	
	// user_IDÀÇ ÆÈ·Î¿ö ¸ñ·Ï »Ì±â
	public static List<FollowVo> follower(String user_ID){
		SqlSession s = factory.openSession(); 
		List<FollowVo> list = s.selectList("follow.follower", user_ID); 
		s.close();
		return list;
	}
	
	// follower_ID°¡ user_ID¸¦ ÆÈ·Î¿ìÇÏ´Â °æ¿ì 
	public static int insertFollower(FollowVo f) {
		SqlSession s = factory.openSession(true);
		int re = s.insert("follow.insert", f);
		s.close();
		return re;
	}
	
	// follower_ID°¡ user_ID¸¦ ¾ðÆÈ·Î¿ìÇÏ´Â °æ¿ì 
	public static int deleteFollower(FollowVo f){
		SqlSession s = factory.openSession(true); 
		int re = s.delete("follow.delete", f);
		s.close();
		return re;
	}
}
