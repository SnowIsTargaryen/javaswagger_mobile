package javaa.swagger.db;

import java.io.Reader;

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
}
