package javaa.swagger.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.UsersDao;
import javaa.swagger.vo.UsersVo;

@Controller
public class UpdateUsersController {

	@Autowired
	private UsersDao dao;

	public void setDao(UsersDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/profile/settings",method=RequestMethod.GET)
	public void settings(HttpSession session)
	{
		
	}
	
	@RequestMapping(value="/profile/settingPassword",method=RequestMethod.GET)
	public ModelAndView settingPassword(HttpSession session)
	{
		String user_ID=(String)session.getAttribute("user_ID");
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("user_ID", user_ID);
		mav.addObject("profile", dao.profile(map));
		
		return mav;
		
	}
	@RequestMapping(value="/profile/settingPassword",method=RequestMethod.POST)
	public ModelAndView settingPassword(UsersVo u,HttpServletRequest request) 
	{
		ModelAndView mav = new ModelAndView("redirect:/profile/userProfile?user_ID="+u.getUser_ID());
		int re =dao.editProfile(u);
		
		return mav;
	}
	
	@RequestMapping(value="/profile/editProfile",method=RequestMethod.GET)
	public ModelAndView profile(HttpSession session)
	{
		String user_ID=(String)session.getAttribute("user_ID");
		ModelAndView mav = new ModelAndView();
		
		HashMap map = new HashMap();
		
		map.put("user_ID", user_ID);
		
		mav.addObject("profile", dao.profile(map));
		
		return mav;
		
	}
	
	@RequestMapping(value="/profile/editProfile",method=RequestMethod.POST)
	public ModelAndView edit(UsersVo u,HttpServletRequest request) 
	{
		ModelAndView mav = new ModelAndView("redirect:/profile/userProfile?user_ID="+u.getUser_ID());
		
		MultipartFile multi = u.getUploadFile();
		String path = request.getRealPath("resources/image");
		System.out.println("path:"+path);
		System.out.println("multi:"+multi);
		
		String OldFname = u.getUser_fname();
		System.out.println("oldFname:"+OldFname);
		String fname="";
		
		if(multi != null && !multi.equals("")) {
			try {
				fname = multi.getOriginalFilename();
				System.out.println("fname:"+fname);
				byte data[] = multi.getBytes();
				u.setUser_fname(fname);
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}else if(multi == null)
		{
			System.out.println("multi is empty");
		}
		
		
		int re =dao.editProfile(u);
		System.out.println("controller:"+re);
		if(re<1)
		{
			mav.addObject("msg", "프로필 수정 실패");
			System.out.println("프로필 수정실패");
			mav.setViewName("../error");
		}
		if(re > 0 && !OldFname.equals("") && fname != null && !fname.equals(""))
		{
			File file = new File(path + "/" + OldFname);
			file.delete();
		}
		
		return mav;
		
	}
	
	
	
}
