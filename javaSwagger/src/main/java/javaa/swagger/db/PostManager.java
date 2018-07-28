package javaa.swagger.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.CommentVo;
import javaa.swagger.vo.PostVo;

public class PostManager {
	private static SqlSessionFactory factory;
	static{
		try{
			Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
	        factory = new SqlSessionFactoryBuilder().build(reader);
	        reader.close();
		}catch (Exception e){
	       // TODO: handle exception
	        System.out.println(e.getMessage());
	    }
	 }
	 
	 public static List<PostVo> readPost(HashMap map){
		 List<PostVo> list;
		 SqlSession s = factory.openSession();
		 list = s.selectList("post.readPost",map);
		 s.close();
		 return list;
	 }
	 
	 public static PostVo detailPost(HashMap map) {
		 PostVo pv;
		 SqlSession s = factory.openSession();
		 pv = s.selectOne("post.detailPost",map);
		 s.close();
		 return pv;
	 }
	 
	 public static int insertPost(HashMap map) {
		 int re = 0;
		 PostVo pv = (PostVo) map.get("pv");
		 SqlSession s = factory.openSession(true);
		 re = s.insert("post.insertPost", pv);
		 s.close();
		 return re;
	 }
	 
	 public static int deletePost(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession(true);
		 re = s.delete("post.deletePost", map);
		 s.close();
		 return re;
	 }
	 
	 public static int updatePost(HashMap map) {
		 int re = 0;
		 PostVo pv = (PostVo) map.get("pv");
		 SqlSession s = factory.openSession(true);
		 re = s.update("post.updatePost", pv);
		 s.close();
		 return re;
	 }
	 
	 public static int getNextNo() {
		 int no=0;
		 SqlSession session = factory.openSession();
		 no=session.selectOne("post.nextNo");
		 session.close();
		 return no;
	 }
}
