package javaa.swagger.controller;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.UsersDao;

@Controller
public class SearchController {


	@Autowired
	private UsersDao dao;
	
	
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("/search")
	public ModelAndView serach(String user_ID)
	{
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		System.out.println(user_ID);
		map.put("user_ID", user_ID);
		
		mav.addObject("value", dao.search(map));
		
		
		
		return mav;
	}
}
