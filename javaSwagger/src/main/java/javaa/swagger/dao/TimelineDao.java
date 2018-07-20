package javaa.swagger.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.TimelineManager;
import javaa.swagger.vo.PostVo;

@Repository
public class TimelineDao {
	public List<PostVo> getTimeline(){
		return TimelineManager.getTimeline();
	}
}
