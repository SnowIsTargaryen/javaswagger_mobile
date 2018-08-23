package javaa.swagger.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.CommentDao;
import javaa.swagger.dao.PostDao;
import javaa.swagger.vo.PostVo;

@Controller
public class PostController {

	@Autowired
	PostDao dao;
	@Autowired
	CommentDao cdao;

	public void setDao(PostDao dao) {
		this.dao = dao;
	}
	
	public void setCdao(CommentDao cdao) {
		this.cdao = cdao;
	}
	
//	@RequestMapping("listPost.do")
//	public ModelAndView listPost(@RequestParam(value="user_ID") String user_ID) {
//		ModelAndView mav = new ModelAndView();
//		HashMap map = new HashMap();
//		map.put("user_ID", user_ID);
//		List<PostVo> list = null;
//		mav.addObject("list", dao.readPost(map));
//		return mav;
//	}
	



	@RequestMapping("detailPost.do")
	public ModelAndView detailPost(@RequestParam(value="post_no") int post_no) {
		
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		map.put("post_no", post_no);
		PostVo pv = dao.detailPost(map);
		mav.addObject("pv",pv);
		return mav;
	}
	
//	**** AJAX 방식 필요시 위에 MAV방식 메서드 지우고 요 녀석 주석 풀어서 사용 ****
	@RequestMapping(value="/board/listPost", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listPost(@RequestParam(value="user_ID") String user_ID) {

		HashMap map = new HashMap();
		map.put("user_ID",user_ID);
		
		List<PostVo> list = dao.readPost(map);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	
//	**** AJAX 방식 필요시 위에 MAV방식 메서드 지우고 요 녀석 주석 풀어서 사용 ****
	@RequestMapping(value="/detailPost", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String detailPost(@RequestParam(value="post_no") String post_no) {
		HashMap map = new HashMap();
		map.put("post_no",post_no);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.detailPost(map));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	
	@RequestMapping(value="/insertPost.do",method=RequestMethod.POST)
	public ModelAndView insertPost(PostVo pv, HttpServletRequest request) {
		MultipartFile multi = pv.getUploadFile();
		String path = request.getRealPath("resources/image");
		System.out.println(path);
		if(multi != null) {
			try {
				String fname = multi.getOriginalFilename();
				byte data[] = multi.getBytes();
				pv.setPost_fname(fname);
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		int no = dao.getNextNo();
		pv.setPost_no(no);
		HashMap map = new HashMap();
		ModelAndView mav = new ModelAndView("redirect:/profile/userProfile?user_ID="+pv.getUser_ID());
		map.put("pv", pv);
		mav.addObject("tof", dao.newPost(map)); // 반환값 어떻게 처리할까요?
		
		return mav;
	}
	
	@RequestMapping(value="/board/insertPost.do",method=RequestMethod.GET)
	public void insertPostForm() {
		
	}
	
	
	@RequestMapping(value="/deletePost", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String deletePost(int post_no,String user_ID,HttpServletRequest request) {
		String str="";
		HashMap map = new HashMap();
		String path = request.getRealPath("resources/image");
		PostVo pv = new PostVo();
		map.put("post_no", post_no);
		map.put("user_ID", user_ID);
		
		String fname = dao.detailPost(map).getPost_fname();
		System.out.println(path+"/"+fname);
		ObjectMapper mapper = new ObjectMapper();
		try {
			int re=cdao.deleteAllComment(map);
			System.out.println(re);
			str=mapper.writeValueAsString(dao.deletePost(map));
			if(fname!=null && !fname.equals(""))
			{
				File file = new File(path+"/"+fname);
				file.delete();
			}
		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value="updatePost.do", method=RequestMethod.POST)
	public ModelAndView updatePost(PostVo pv) {
		ModelAndView mav = new ModelAndView("redirect:/profile/userProfile?user_ID="+pv.getUser_ID());
		HashMap map = new HashMap();
		map.put("pv", pv);
		mav.addObject("tof", dao.updatePost(map));
		return mav;
	}
	
//	@RequestMapping(value="updatePost.do",method=RequestMethod.GET)
//	public ModelAndView updatePostForm(int post_no) {
//		ModelAndView mav = new ModelAndView();
//		HashMap map = new HashMap();
//		map.put("post_no", post_no);
//		PostVo pv = dao.detailPost(map);
//		mav.addObject("pv", pv);
//		return mav;
//	}
}
