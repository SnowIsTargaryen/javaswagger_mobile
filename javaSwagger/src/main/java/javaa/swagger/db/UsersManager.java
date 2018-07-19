package javaa.swagger.db;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.UsersVo;

public class UsersManager {
	private static SqlSessionFactory factory;
	static {
		try {
		Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
		factory = new SqlSessionFactoryBuilder().build(reader);
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//회원가입 메소드 
	public static int insertUser(UsersVo u)
	{
		
		int re=-1;
		SqlSession session = factory.openSession();
		re=session.insert("users.insert",u);
		if(re>=1)
		{
			session.commit();
		}
		session.close();
		return re;
	}
	//로그인 메소드
	public static boolean isUser(Map map)
	{
		boolean r = false;
		
		SqlSession session = factory.openSession();
		UsersVo u=session.selectOne("users.isUser",map);
		
		if(u!=null)
		{
			r=true;
		}
		session.close();
		
		return r;
		
	}
	//프로필 정보 메소드
	public static UsersVo profil(Map map) {
		// TODO Auto-generated method stub
		SqlSession session =factory.openSession();
		UsersVo u = session.selectOne("users.profil", map);
		session.close();
		
		return u;
	}
}
