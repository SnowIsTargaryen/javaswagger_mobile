package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.CommentManager;
import javaa.swagger.vo.CommentVo;
@Repository
public class CommentDao {
		public int newComment(HashMap map){
	      return CommentManager.newComment(map);
	   }
	   
	   public int deleteComment(HashMap map){
	      return CommentManager.deleteComment(map);
	   }
	   
	   public int updateComment(HashMap map){
	      return CommentManager.updateComment(map);
	   }
	   
	   public List<CommentVo> readComment(HashMap map){
	      return CommentManager.readComment(map);
	   }
}