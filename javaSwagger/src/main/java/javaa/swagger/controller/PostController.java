package javaa.swagger.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.PostDao;
import javaa.swagger.vo.PostVo;

@Controller
public class PostController {

	@Autowired
	PostDao dao;

	public void setDao(PostDao dao) {
		this.dao = dao;
	}
	
	public ModelAndView listPost() {
		ModelAndView mav = new ModelAndView();
		List<PostVo> list = null;
		mav.addObject("list", dao.readPost());
		return mav;
	}
	
	public ModelAndView insertPost(PostVo pv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("pv", pv);
		mav.addObject("tof", dao.newPost(map));
		return mav;
	}
	
	public ModelAndView deletePost(PostVo pv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("pv", pv);
		mav.addObject("tof", dao.deletePost(map));
		return mav;
	}
	
	public ModelAndView updatePost(PostVo pv) {
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("pv", pv);
		mav.addObject("tof", dao.updatePost(map));
		return mav;
	}
}
