package javaa.swagger.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.PostDao;
import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.PostVo;

@Controller
public class UsersControrller {

	@Autowired
	private UsersDao dao;
	private PostDao pdao;
	
	
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session)
	{
		ModelAndView mav = new ModelAndView("redirect:/login");
		session.invalidate();
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)  //로그인 폼
	public void form()
	{
		
	}
	@RequestMapping(value="/login",method=RequestMethod.POST) //로그인 처리
	public ModelAndView submit(String user_ID, String user_Password, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		
		map.put("user_ID", user_ID);
		map.put("user_Password", user_Password);
//		System.out.println(user_ID);
		boolean re = dao.isUser(map);
		
		if(re == true)
		{
			session.setAttribute("user_ID", user_ID);
			mav.setViewName("redirect:/timeLine");
		}
		
		return mav;
	}
	//프로필 정보
	@RequestMapping(value="/profile/userProfile",method=RequestMethod.GET)
	public ModelAndView profile(@RequestParam(value="user_ID") String user_ID,HttpSession session)
	{
		//System.out.println(user_ID);
		//String user_ID=(String)session.getAttribute("user_ID");
		
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("user_ID", user_ID);
		mav.addObject("profile", dao.profile(map));
	
		
		return mav;
		
	}
	
	@RequestMapping(value="/profile/withdrawUser",method=RequestMethod.POST)
	public ModelAndView withdrawUser(String user_ID, String user_Password)
	{
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("user_ID", user_ID);
		map.put("user_Password", user_Password);
//		System.out.println(user_ID);
		int re=dao.withdrawUser(map);
		
		if(re>0)
		{
			mav.setViewName("redirect:/login");
		}
		else
		{	System.out.println("삭제 실패");
			mav.setViewName("redirect:/profile/userProfile");
		}
		return mav;
		
		
	}
	
	
}
