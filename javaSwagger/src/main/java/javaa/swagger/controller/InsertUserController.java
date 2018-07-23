package javaa.swagger.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.UsersVo;

@Controller
@RequestMapping("account/create")
public class InsertUserController {
	
	@Autowired
	private UsersDao dao;
	
	
	
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public void form()
	{
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView insertUser(UsersVo u,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("redirect:/login");
		
		/*System.out.println(request.getParameter("user_ID"));
		System.out.println("controller"+u.getUser_ID());
		System.out.println("controller"+u.getUser_Password());
		System.out.println("controller"+u.getUser_Email());
		System.out.println("controller"+u.getUser_Phone() );
		*/

		
		int re = dao.insertUser(u);
		System.out.println(re);
		
		if(re<0)
		{
			mav.addObject("msg", "회원등록 실패");
			mav.setViewName("error");
		}
		
		return mav;
		
	}
}
