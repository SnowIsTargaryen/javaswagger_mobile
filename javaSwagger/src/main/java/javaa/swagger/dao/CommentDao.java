package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.CommentManager;
import javaa.swagger.vo.CommentVo;
import javaa.swagger.vo.CommentVo2;
@Repository
public class CommentDao {
		public int newComment(HashMap map){
	      return CommentManager.newComment(map);
	   }
	   
	   public int deleteComment(HashMap map){
	      return CommentManager.deleteComment(map);
	   }
	   public int deleteAllComment(HashMap map){
		   return CommentManager.deleteAllComment(map);
	   }
	   
	   public int updateComment(HashMap map){
	      return CommentManager.updateComment(map);
	   }
	   
	   public List<CommentVo> readComment(HashMap map){
	      return CommentManager.readComment(map);
	   }
	   public List<CommentVo2> readComment2(HashMap map){
		   return CommentManager.readComment2(map);
	   }
	   
	   public int getNextNo()
	   {
		   return CommentManager.getNextNo();
	   }
	   
	   public int autoDelete() {
			// TODO Auto-generated method stub
			return CommentManager.autoDelete();
		}

	public int cntComment(HashMap map) {
		// TODO Auto-generated method stub
		return CommentManager.cntComment(map);
	}
}