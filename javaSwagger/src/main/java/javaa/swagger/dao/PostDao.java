package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.PostManager;
import javaa.swagger.vo.PostVo;
@Repository
public class PostDao {
		public int newPost(HashMap map){
	      return PostManager.insertPost(map);
	   }
	   
	   public int deletePost(HashMap map){
	      return PostManager.deletePost(map);
	   }
	   
	   public int updatePost(HashMap map){
	      return PostManager.updatePost(map);
	   }
	   
	   public List<PostVo> readPost(HashMap map){
	      return PostManager.readPost(map);
	   }
	   public PostVo detailPost(HashMap map){
		   return PostManager.detailPost(map);
	   }
	   public int getNextNo()
	   {
		   return PostManager.getNextNo();
	   }
}
