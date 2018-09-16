package javaa.swagger.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.PostVo;

public class PostManager {
	private static SqlSessionFactory factory;
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/db/mybatisConfig.xml");
	        factory = new SqlSessionFactoryBuilder().build(reader);
	        reader.close();
		}catch (Exception e){
	       // TODO: handle exception
	        System.out.println(e.getMessage());
	    }
	 }
	 
	 public static List<PostVo> readPost(){
		 List<PostVo> list;
		 SqlSession s = factory.openSession();
		 list = s.selectList("post.readPost");
		 return list;
	 }
	 
	 public static int insertPost(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.insert("insertPost", map);
		 return re;
	 }
	 
	 public static int deletePost(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.delete("deletePost", map);
		 return re;
	 }
	 
	 public static int updatePost(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.update("updatePost", map);
		 return re;
	 }
}
