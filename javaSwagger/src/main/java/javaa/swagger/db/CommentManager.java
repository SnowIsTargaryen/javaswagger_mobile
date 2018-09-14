package javaa.swagger.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.CommentVo;

public class CommentManager {
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
	
	public static int autoDelete() {
		// TODO Auto-generated method stub
		int re = 0;
		SqlSession s = factory.openSession(true);
		re = s.delete("comment.autoDelete");
		s.close();
		return re;
	}
	 
	 public static List<CommentVo> readComment(HashMap map){
		 List<CommentVo> list;
		 SqlSession s = factory.openSession();
		 list = s.selectList("comment.readComment",map);
		 s.close();
		 return list;
	 }
	 
	 public static int newComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession(true);
		 CommentVo cv = (CommentVo) map.get("cv");
		 re = s.insert("comment.insertComment", cv);
		 s.close();
		 return re;
	 }
	 
	 public static int deleteComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession(true);
		 re = s.delete("comment.deleteComment", map);
		 s.close();
		 return re;
	 }
	 public static int deleteAllComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession(true);
		 re = s.delete("comment.deleteAllComment", map);
		 s.close();
		 return re;
	 }
	 
	 public static int updateComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession(true);
		 re = s.update("comment.updateComment", map);
		 s.close();
		 return re;
	 }
	 
	 public static int getNextNo() {
		 int no=0;
		 SqlSession session = factory.openSession();
		 no=session.selectOne("comment.nextNo");
		 session.close();
		 return no;
	 }
}
