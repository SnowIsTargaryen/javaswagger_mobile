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
	public String cntLike(String comment_no, String post_no) {
		HashMap map = new HashMap();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		map.put("comment_no", comment_no);
		map.put("post_no", post_no);
		//int re = dao.cntLike(map);
		try {
		str=mapper.writeValueAsString(dao.cntLike(map));
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="whoLike.do", produces="text/plain;charset=utf-8")
	@ResponseBody // ajax 반환
	public String whoLike(String post_no, String comment_no, String user_ID) {
		ArrayList<LikeVo> list = new ArrayList<LikeVo>();
		HashMap map = new HashMap();
		
		if(post_no ==  null) {
			map.put("post_no", null);			
		}else {
			map.put("post_no", post_no);
		}
		
		if(comment_no == null) {
			map.put("comment_no",null);
		}else{
			map.put("comment_no", comment_no);
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
	
	@RequestMapping(value="doLike.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String doLike(String post_no, String comment_no, String user_ID){
		String str ="";
		ObjectMapper mapper = new ObjectMapper();
		HashMap map = new HashMap();
		if(post_no ==  null) {
			map.put("post_no", null);			
		}else {
			map.put("post_no", post_no);
			dao.deltimeSetup(map);
		}
		
		if(comment_no == null) {
			map.put("comment_no",null);
		}else {
			map.put("comment_no", comment_no);
		}
		
		map.put("user_ID", user_ID);
		//int re = dao.doLike(map);
		
		try {
			str = mapper.writeValueAsString(dao.doLike(map));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="cancelLike.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String cancelLike(String post_no, String comment_no, String user_ID){
		String str ="";
		ObjectMapper mapper = new ObjectMapper();
		HashMap map = new HashMap();
		if(post_no ==  null) {
			map.put("post_no", null);			
		}else {
			map.put("post_no", post_no);
		}
	
		if(comment_no == null) {
			map.put("comment_no",null);
		}else {
			map.put("comment_no", comment_no);
		}
		
		map.put("user_ID", user_ID);
		//int re = dao.cancelLike(map);
		
		try {
			str = mapper.writeValueAsString(dao.cancelLike(map));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping("isLike.do")
	@ResponseBody
	public String isLike(String user_ID) {
		
		HashMap map = new HashMap();
		ObjectMapper mapper = new ObjectMapper();
		map.put("user_ID", user_ID);
		String str="";
		try {
			str=mapper.writeValueAsString(dao.isLike(map));
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return str;
	}
	
//	@RequestMapping("doLike.do")
//	public ModelAndView doLike(String post_no, String comment_no, String user_ID) {
//		ModelAndView mav = new ModelAndView();
//		HashMap map = new HashMap();
//		if(post_no ==  null) {
//			map.put("post_no", null);			
//		}else {
//			map.put("post_no", post_no);
//		}
//		
//		if(comment_no == null) {
//			map.put("comment_no",null);
//		}else {
//			map.put("comment_no", comment_no);
//		}
//		
//		map.put("user_ID", user_ID);
//		int re = dao.doLike(map);
//		if(post_no != null) {
//			if(re > 0) {
//				mav.setViewName("redirect:../detailPost.do?post_no="+post_no);
//			}else {
//				mav.addObject("msg", "게시물 좋아요에 실패하였습니다.");
//			}
//		} else {
//			if(re > 0) {
//				mav.setViewName("redirect:../detailPost.do?post_no="+dao.getPno(comment_no));
//			}else {
//				mav.addObject("msg", "댓글 좋아요에 실패하였습니다.");
//			}
//		}
//		return mav;
//	}
	
//	@RequestMapping("cancelLike.do") // ajax 방식으로 comment_no 받아오기
//	public ModelAndView cancelLike(String post_no, String comment_no, String user_ID) {
//		ModelAndView mav = new ModelAndView();
//		HashMap map = new HashMap();
//		if(post_no ==  null) {
//			map.put("post_no", null);			
//		}else {
//			map.put("post_no", post_no);
//		}
//	
//		if(comment_no == null) {
//			map.put("comment_no",null);
//		}else {
//			map.put("comment_no", comment_no);
//		}
//		
//		map.put("user_ID", user_ID);
//		int re = dao.cancelLike(map);
//		if(post_no != null) {
//			if(re > 0) {
//				mav.setViewName("redirect:/detailPost.do?post_no="+post_no);
//			}else {
//				mav.addObject("msg", "게시물 좋아요에 실패하였습니다.");
//			}
//		} else {
//			if(re > 0) {
//				mav.setViewName("redirect:/detailPost.do?post_no="+dao.getPno(comment_no));
//			}else {
//				mav.addObject("msg", "댓글 좋아요에 실패하였습니다.");
//			}
//		}
//		
//		return mav;
//	}
	
	

	
//	@RequestMapping("isLike.do")
//	@ResponseBody
//	public String isLike(String post_no, String comment_no, String user_ID) {
//		HashMap map = new HashMap();
//		if(post_no ==  null) {
//			map.put("post_no", null);			
//		}else {
//			map.put("post_no", post_no);
//		}
//		if(comment_no == null) {
//			map.put("comment_no",null);
//		}else {
//			map.put("comment_no", comment_no);
//		}
//		map.put("user_ID", user_ID);
//		int re = dao.isLike(map);
//		return re+"";
//	}
}
