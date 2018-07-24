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

import javaa.swagger.dao.CommentDao;
import javaa.swagger.vo.CommentVo;

@Controller
public class CommentController {

	@Autowired
	CommentDao dao;

	public void setDao(CommentDao dao) {
		this.dao = dao;
	}
	
//	ajax방식
	@RequestMapping(value="listComment.do", produces="text/plain;charset=utf-8")
	@ResponseBody // ajax 반환
	public String readComment(@RequestParam(value="post_no") String post_no) {
		ArrayList<CommentVo> list = new ArrayList<CommentVo>();
		System.out.println(post_no);
		HashMap map = new HashMap();
		map.put("post_no", post_no);
		List<CommentVo> listt = dao.readComment(map);
		for(CommentVo c : listt) {
			list.add(c);
		}
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		System.out.println(str);
		return str;
	}
	
//	// MAV 방식으로 진행시에는 하나의 게시물을 클릭 했을때 코멘트가 뜨므로 서비스명을 detailPost로 했습니다.
//	@RequestMapping("detailPost.do")
//	public ModelAndView readComment(String post_no) {
//		ModelAndView mav = new ModelAndView();
//		HashMap map = new HashMap();
//		map.put("post_no", post_no);
//		mav.addObject("comment", dao.readComment(map));
//		return mav;
//	}
	
	@RequestMapping("insertComment.do") // ajax 방식으로 자료 받아오기
	public ModelAndView newComment(CommentVo cv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("cv", cv);
		int re = dao.newComment(map);
		if(re <= 0) {
			mav.addObject("msg", "댓글 등록에 실패하였습니다.");
			mav.setViewName("error.do");
		} else {
			mav.setViewName("redirect:/detailPost.do?post_no="+cv.getPost_no());
		}
		return mav;
	}
	
	@RequestMapping("deleteComment.do") // ajax 방식으로 comment_no 받아오기
	public ModelAndView deleteComment(String comment_no) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("comment_no", comment_no);
		mav.addObject("tof", dao.deleteComment(map));
		return mav;
	}
	
	@RequestMapping("updateComment.do") // ajax 방식으로 자료 받아오기
	public ModelAndView updateComment(CommentVo cv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("cv", cv);
		mav.addObject("tof", dao.updateComment(map));
		return mav;
	}
}
