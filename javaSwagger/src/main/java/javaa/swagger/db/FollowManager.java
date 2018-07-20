package javaa.swagger.db;

import java.io.Reader;
import java.util.List;

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
	
	public static List<FollowVo> listFollow()
	{
		SqlSession session = factory.openSession(); 
		List<FollowVo> listFollow = session.selectList("follower.selectAll");
		session.commit();
		session.close();
		return listFollow;
	}
	
	public static int insertFollower(FollowVo f)
	{
		SqlSession session = factory.openSession(); 
		int re = session.insert("follower.insert", f);
		session.commit();
		session.close();
		return re;
	}
	
	public static int deleteFollower(String follower_ID)
	{
		SqlSession session = factory.openSession(); 
		int re = session.delete("follower.delete", follower_ID);
		session.commit();
		session.close();
		return re;
	}
}
