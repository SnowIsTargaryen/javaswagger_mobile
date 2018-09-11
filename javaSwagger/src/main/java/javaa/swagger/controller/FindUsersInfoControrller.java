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

import javaa.swagger.dao.FindUsersInfoDao;
import javaa.swagger.dao.PostDao;
import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.PostVo;
import javaa.swagger.vo.UsersVo;

@Controller
public class FindUsersInfoControrller {

	@Autowired
	private FindUsersInfoDao dao;
		
	public void setDao(FindUsersInfoDao dao) {
		this.dao = dao;
	}
	@RequestMapping(value="/account/findUserId",method=RequestMethod.GET)  
	public void findIdForm()
	{
		
	}
	@RequestMapping(value="/account/findUserId",method=RequestMethod.POST) 
	public ModelAndView findIdPost(String user_email, String user_phone, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);

		UsersVo u = dao.findId(map);
		mav.addObject("u", u);
		
		
		return mav;
	}
	@RequestMapping(value="/account/findUserPwd",method=RequestMethod.GET)  
	public void findPwdForm()
	{
		
	}
	@RequestMapping(value="/account/findUserPwd",method=RequestMethod.POST) 
	public ModelAndView findPwdPost(String user_id,String user_email, String user_phone, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);
		
		UsersVo u = dao.findPwd(map);
		System.out.println("controller map:"+map);
		mav.addObject("u", u);
		System.out.println("dd:"+u.getUser_ID());
		
		return mav;
	}

	

	
}
