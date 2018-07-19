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
			Reader reader = Resources.getResourceAsReader("com/db/mybatisConfig.xml");
	        factory = new SqlSessionFactoryBuilder().build(reader);
	        reader.close();
		}catch (Exception e){
	       // TODO: handle exception
	        System.out.println(e.getMessage());
	    }
	 }
	 
	 public static List<CommentVo> listComment(){
		 List<CommentVo> list;
		 SqlSession s = factory.openSession();
		 list = s.selectList("comment.readComment");
		 return list;
	 }
	 
	 public static int newComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.insert("comment.insertComment", map);
		 return re;
	 }
	 
	 public static int deleteComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.delete("comment.deleteComment", map);
		 return re;
	 }
	 
	 public static int updateComment(HashMap map) {
		 int re = 0;
		 SqlSession s = factory.openSession();
		 re = s.update("comment.updateComment", map);
		 return re;
	 }
}
