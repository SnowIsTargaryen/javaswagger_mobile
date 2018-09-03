package javaa.swagger.controller;

import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	//Email중복처리-------------------------------------
	@RequestMapping("account/emailCheck.do")
    @ResponseBody
    public String emailcheck(@RequestBody String user_email) {
		System.out.println("controller userEmail:"+user_email);
		String str="";
		int re = dao.emailCheck(user_email);
		
		   /*if(regex.test(user_email) == false) {  
			   
		   }*/
		/*System.out.println("uv:"+uv);
        ObjectMapper mapper = new ObjectMapper();
        
        
        try {
			str = mapper.writeValueAsString(uv);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}*/
        
       
        return re+"";
    }//Email중복처리-------------------------------------

	
	//Phone중복처리-------------------------------------
			@RequestMapping("account/phoneCheck.do")
		    @ResponseBody
		    public String phonecheck(@RequestBody String user_phone) {
		        
				//System.out.println("폰넘버:"+user_phone);
				
				String str="";
				UsersVo uv= dao.phoneCheck(user_phone);;
		        ObjectMapper mapper = new ObjectMapper();
		        
		        
		        try {
					str = mapper.writeValueAsString(uv);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.getMessage());
				}
		        
		       
		        return str;
		    }//Phone중복처리-------------------------------------
	
	
	//ID중복처리-------------------------------------
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
	    }//ID중복처리-------------------------------------
		
	@RequestMapping(value="account/create",method=RequestMethod.GET)
	public void form()
	{
		
	}
	
	@RequestMapping(value="account/create",method=RequestMethod.POST)
	public ModelAndView insertUser(UsersVo u,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("redirect:/login");
		
		MultipartFile multi = u.getUploadFile();
		String path = request.getRealPath("resources/image");
		System.out.println("path:"+path);
		
		if(multi != null) {
			try {
				String fname = multi.getOriginalFilename();
				byte data[] = multi.getBytes();
				u.setUser_fname(fname);
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}

		HashMap map = new HashMap();
		map.put("u", u);
		
		int re = dao.insertUser(u);
		//System.out.println(re);
		
		if(re<0)
		{
			mav.addObject("msg", "회원등록 실패");
			mav.setViewName("error");
		}
		
		return mav;
		
	}
}
