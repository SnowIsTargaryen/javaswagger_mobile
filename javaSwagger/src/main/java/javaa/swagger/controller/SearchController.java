package javaa.swagger.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.PostVo;

@Controller
public class SearchController {


	@Autowired
	private UsersDao dao;
	
	
	public void setDao(UsersDao dao) {
		this.dao = dao;
	}
	
	
	/*@RequestMapping("/search")
	public ModelAndView serach(String user_ID)
	{
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		System.out.println(user_ID);
		map.put("user_ID", user_ID);
		
		mav.addObject("list", dao.search(map));
		
	
		return mav;
	}*/
	@RequestMapping("/search")
	public void search()
	{
		
	}
	
	@RequestMapping(value="/searchList", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String search(String user_ID)
	{
		String str="";
		
		HashMap map = new HashMap();
		map.put("user_ID",user_ID);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.search(map));
			//str=str+1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
		
	}
}
