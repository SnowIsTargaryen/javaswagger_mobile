package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.TimelineManager;
import javaa.swagger.vo.PostVo;

@Repository
public class TimelineDao {
    public List<PostVo> getTimeline(HashMap map) {
        return TimelineManager.getTimeline(map);
    }

    public List<PostVo> searchByHash(HashMap map) {
        // TODO Auto-generated method stub
        return TimelineManager.searchByHash(map);
    }
}
