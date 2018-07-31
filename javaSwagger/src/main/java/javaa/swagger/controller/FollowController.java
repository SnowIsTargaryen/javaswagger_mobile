package javaa.swagger.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.FollowDao;
import javaa.swagger.vo.FollowVo;

@Controller
public class FollowController {
	@Autowired
	private FollowDao dao;

	public void setDao(FollowDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/follower.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String follower(@RequestParam(value="user_ID") String user_ID){
		String str ="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.follower(user_ID));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/following.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String following(@RequestParam(value="follower_ID") String follower_ID){
		System.out.println(follower_ID);
		String str ="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str= mapper.writeValueAsString(dao.following(follower_ID));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
//	@RequestMapping("/follow.do")
//	public ModelAndView follow(FollowVo f) {
//		ModelAndView mav = new ModelAndView();
//		int re = dao.insertFollow(f);
//		System.out.println(f.getUser_ID());
//		System.out.println(f.getFollower_ID());
//		if(re > 0) {
//			System.out.println("팔로잉 성공");
//			//mav.setViewName("redirect:/listPost.do?user_id="+f.getUser_ID());
//		} else {
//			mav.addObject("msg", "팔로잉에 실패하였습니다.");
//			mav.setViewName("error");
//		}
//		return mav;
//	}
	
	@RequestMapping(value="/follow.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String follow(String user_ID, String follower_ID ){
		System.out.println(user_ID);
		System.out.println(follower_ID);
		String str ="";
		HashMap map = new HashMap();
		map.put("user_ID", user_ID);
		map.put("follower_ID", follower_ID);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str= mapper.writeValueAsString(dao.insertFollow(map));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	@RequestMapping("/unFollow.do")
	public ModelAndView unFollow(FollowVo f) {
		ModelAndView mav = new ModelAndView();
		int re = dao.deleteFollow(f);
		if(re > 0) {
			mav.setViewName("redirect:/listPost.do?user_id="+f.getUser_ID());
		} else {
			mav.addObject("msg", "언팔로우에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	@RequestMapping("/listFollower.do")
	public ModelAndView listFollower(String user_ID) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user_ID", user_ID);
		return mav;
	}
	
	@RequestMapping("/listFollowing.do")
	public ModelAndView listFollowing(String follower_ID) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("follower_ID", follower_ID);
		return mav;
	}
	
	@RequestMapping("/chkFollower.do")
	public void chkFollow() {}
	
	@RequestMapping(value="/isFollower.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String isFollow(FollowVo f){
		System.out.println(f.getFollower_ID());
		System.out.println(f.getUser_ID());
		int re = dao.isFollow(f);
		return re+"";
	}
}
