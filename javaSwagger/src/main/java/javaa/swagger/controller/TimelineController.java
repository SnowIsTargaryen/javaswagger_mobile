package javaa.swagger.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import javaa.swagger.dao.TimelineDao;
import javaa.swagger.vo.PostVo;

@Controller
public class TimelineController {
    @Autowired
    private TimelineDao dao;

    public void setDao(TimelineDao dao) {
        this.dao = dao;
    }

    @RequestMapping(value = "/timeLine")
    public void timeLineForm() {

    }

    @RequestMapping(value = "/timeLineSearch")
    public void timeLineSearchForm() {

    }

    @RequestMapping(value = "/hashtagSearch")
    public void hashtagSearchForm() {

    }

    //	**** AJAX 방식 필요시 위에 MAV방식 메서드 지우고 요 녀석 주석 풀어서 사용 ****
    @RequestMapping(value = "/timeLinePost", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String listTimelin(@RequestParam(value = "user_ID") String user_ID) {
        ArrayList<PostVo> list = new ArrayList<PostVo>();
        HashMap map = new HashMap();
        map.put("user_ID", user_ID);
        List<PostVo> listt = dao.getTimeline(map);
        for (PostVo p : listt) {
            list.add(p);
        }
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

    @RequestMapping(value = "/hashtag")
    public void hashForm() {

    }

    //	**** AJAX 방식 필요시 위에 MAV방식 메서드 지우고 요 녀석 주석 풀어서 사용 ****
    @RequestMapping(value = "/hashtagPost", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String hashtag(@RequestParam(value = "keyword") String keyword) {
        ArrayList<PostVo> list = new ArrayList<PostVo>();
        HashMap map = new HashMap();
        map.put("keyword", keyword);
        List<PostVo> listt = dao.searchByHash(map);
        for (PostVo p : listt) {
            list.add(p);
        }
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
}
