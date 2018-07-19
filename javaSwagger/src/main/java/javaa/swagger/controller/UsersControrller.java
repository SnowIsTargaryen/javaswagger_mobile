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

@Controller
public class UsersControrller {

	@Autowired
	private UsersDao dao;
	
	
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void form()
	{
		
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView submit(String user_ID, String user_Password, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("login");
		Map map = new HashMap();
		
		map.put("user_ID", user_ID);
		map.put("user_Password", user_Password);
		
		boolean re = dao.isUser(map);
		
		if(re == true)
		{
			session.setAttribute("user_ID", user_ID);
			mav.setViewName("timeLine");
		}
		
		return mav;
	}
}
