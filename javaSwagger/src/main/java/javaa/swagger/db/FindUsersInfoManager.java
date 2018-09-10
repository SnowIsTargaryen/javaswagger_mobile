package javaa.swagger.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.UsersVo;


public class FindUsersInfoManager {
	private static SqlSessionFactory factory;
	static {
		try {
		Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
		factory = new SqlSessionFactoryBuilder().build(reader);
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	  /* public static UsersVo findId(Map map){
		      // TODO Auto-generated method stub
		      //boolean r = false;
		      SqlSession session =factory.openSession();
		      UsersVo uv = session.selectOne("users.findId",map);
		      System.out.println("manager map:"+map);
		      System.out.println("uv:"+uv);
		      
		      session.close();
		      
		      return uv;
		      
		   }*/
	
	public static UsersVo findId(Map map) {
		// TODO Auto-generated method stub
		SqlSession session =factory.openSession();
		UsersVo u = session.selectOne("findUsersInfo.findId", map);
		System.out.println("manager map:"+map);
		session.close();
		
		return u;
	}
	public static UsersVo findPwd(Map map) {
		// TODO Auto-generated method stub
		SqlSession session =factory.openSession();
		UsersVo u = session.selectOne("findUsersInfo.findPwd", map);
		session.close();
		
		return u;
	}
}
