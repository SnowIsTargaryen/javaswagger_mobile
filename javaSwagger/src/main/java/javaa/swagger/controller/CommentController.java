package javaa.swagger.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.CommentDao;
import javaa.swagger.vo.CommentVo;

@Controller
public class CommentController {

	@Autowired
	CommentDao dao;

	public void setDao(CommentDao dao) {
		this.dao = dao;
	}
	
	public ModelAndView readComment() {
		ModelAndView mav = new ModelAndView();
		List<CommentVo> list = null;
		mav.addObject("list", dao.readComment());
		return mav;
	}
	
	public ModelAndView newComment(CommentVo cv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("cv", cv);
		mav.addObject("tof", dao.newComment(map));
		return mav;
	}
	
	public ModelAndView deleteComment(CommentVo cv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("cv", cv);
		mav.addObject("tof", dao.deleteComment(map));
		return mav;
	}
	
	public ModelAndView updateComment(CommentVo cv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("cv", cv);
		mav.addObject("tof", dao.updateComment(map));
		return mav;
	}
}
