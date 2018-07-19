package javaa.swagger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.dao.TimelineDao;

@Controller
public class TimelineController {
	@Autowired
	private TimelineDao dao;

	public void setDao(TimelineDao dao) {
		this.dao = dao;
	}
	
	public ModelAndView listTimeline() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.getTimeline());
		mav.setViewName("timeLine.jsp");
		return mav;
	}
}
