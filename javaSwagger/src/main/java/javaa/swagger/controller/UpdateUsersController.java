package javaa.swagger.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.UsersVo;

@Controller
@RequestMapping("/profile/editProfile")
public class UpdateUsersController {

	@Autowired
	private UsersDao dao;

	public void setDao(UsersDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView profile(HttpSession session)
	{
		String user_ID=(String)session.getAttribute("user_ID");
		ModelAndView mav = new ModelAndView();
		
		HashMap map = new HashMap();
		
		map.put("user_ID", user_ID);
		
		mav.addObject("profile", dao.profile(map));
		
		return mav;
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView edit(UsersVo u) 
	{
		ModelAndView mav = new ModelAndView("redirect:/profile/userProfile");
		
		int re =dao.editProfile(u);
		if(re<1)
		{
			mav.addObject("msg", "프로필 수정 실패");
			mav.setViewName("../error");
		}
		
		
		return mav;
		
	}
	
	
	
}
