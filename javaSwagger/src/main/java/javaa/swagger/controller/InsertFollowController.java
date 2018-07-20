package javaa.swagger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.FollowDao;
import javaa.swagger.vo.FollowVo;

@Controller
@RequestMapping("/insertFollower.do")
public class InsertFollowController {

	@Autowired
	private FollowDao dao;

	public void setDao(FollowDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public void form()
	{
		
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertFollow(FollowVo f)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject(dao.insertFollow(f));
		return mav;
	}
}
