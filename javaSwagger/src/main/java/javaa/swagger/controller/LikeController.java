package javaa.swagger.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.LikeDao;
import javaa.swagger.vo.CommentVo;
import javaa.swagger.vo.LikeVo;

@Controller
public class LikeController {

	@Autowired
	LikeDao dao;

	public void setDao(LikeDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="cntLike.do", produces="text/plain;charset=utf-8")
	@ResponseBody // ajax 반환
	public String cntLike(String comment_NO, String post_NO) {
		HashMap map = new HashMap();
		map.put("comment_NO", comment_NO);
		map.put("post_NO", post_NO);
		int re = dao.cntLike(map);
		return re+"";
	}
	
	@RequestMapping(value="whoLike.do", produces="text/plain;charset=utf-8")
	@ResponseBody // ajax 반환
	public String whoLike(String post_NO, String comment_NO, String user_ID) {
		ArrayList<LikeVo> list = new ArrayList<LikeVo>();
		HashMap map = new HashMap();
		
		if(post_NO ==  null) {
			map.put("post_NO", null);			
		}else {
			map.put("post_NO", post_NO);
		}
		
		if(comment_NO == null) {
			map.put("comment_NO",null);
		}else{
			map.put("comment_NO", comment_NO);
		}
		
		if(user_ID == null) {
			map.put("user_ID",null);
		}else{
			map.put("user_ID", user_ID);
		}
		
		List<LikeVo> listt = dao.whoLike(map);
		for(LikeVo c : listt) {
			list.add(c);
			System.out.println(c.getUser_ID());
		}
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping("doLike.do")
	public ModelAndView doLike(String post_NO, String comment_NO, String user_ID) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		if(post_NO ==  null) {
			map.put("post_NO", null);			
		}else {
			map.put("post_NO", post_NO);
		}
		
		if(comment_NO == null) {
			map.put("comment_NO",null);
		}else {
			map.put("comment_NO", comment_NO);
		}
		
		map.put("user_ID", user_ID);
		int re = dao.doLike(map);
		if(post_NO != null) {
			if(re > 0) {
				mav.setViewName("redirect:/detailPost.do?post_no="+post_NO);
			}else {
				mav.addObject("msg", "게시물 좋아요에 실패하였습니다.");
			}
		} else {
			if(re > 0) {
				mav.setViewName("redirect:/detailPost.do?post_no="+dao.getPno(comment_NO));
			}else {
				mav.addObject("msg", "댓글 좋아요에 실패하였습니다.");
			}
		}
		return mav;
	}
	
	@RequestMapping("cancelLike.do") // ajax 방식으로 comment_no 받아오기
	public ModelAndView cancelLike(String post_NO, String comment_NO, String user_ID) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		if(post_NO ==  null) {
			map.put("post_NO", null);			
		}else {
			map.put("post_NO", post_NO);
		}
	
		if(comment_NO == null) {
			map.put("comment_NO",null);
		}else {
			map.put("comment_NO", comment_NO);
		}
		
		map.put("user_ID", user_ID);
		int re = dao.cancelLike(map);
		if(post_NO != null) {
			if(re > 0) {
				mav.setViewName("redirect:/detailPost.do?post_no="+post_NO);
			}else {
				mav.addObject("msg", "게시물 좋아요에 실패하였습니다.");
			}
		} else {
			if(re > 0) {
				mav.setViewName("redirect:/detailPost.do?post_no="+dao.getPno(comment_NO));
			}else {
				mav.addObject("msg", "댓글 좋아요에 실패하였습니다.");
			}
		}
		
		return mav;
	}
	
	@RequestMapping("isLike.do")
	@ResponseBody
	public String isLike(String post_NO, String comment_NO, String user_ID) {
		HashMap map = new HashMap();
		if(post_NO ==  null) {
			map.put("post_NO", null);			
		}else {
			map.put("post_NO", post_NO);
		}
		if(comment_NO == null) {
			map.put("comment_NO",null);
		}else {
			map.put("comment_NO", comment_NO);
		}
		map.put("user_ID", user_ID);
		int re = dao.isLike(map);
		return re+"";
	}
}
