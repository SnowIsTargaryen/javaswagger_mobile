package javaa.swagger.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.UsersVo;

@Controller
public class InsertUserController {
	
	@Autowired
	private UsersDao dao;
	

	public void setDao(UsersDao dao) {
		this.dao = dao;
	}
	
	//중복처리-------------------------------------
		@RequestMapping("account/idCheck.do")
	    @ResponseBody
	    public String idcheck(@RequestBody String user_id) {
	        
			String str="";
	        int count = 0;
	        ObjectMapper mapper = new ObjectMapper();
	        count = dao.idCheck(user_id);
	        
	        try {
				str = mapper.writeValueAsString(count);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
	        
	        	 
	        return str;
	    }//중복처리-------------------------------------
		
	@RequestMapping(value="account/create",method=RequestMethod.GET)
	public void form()
	{
		
	}
	
	@RequestMapping(value="account/create",method=RequestMethod.POST)
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
