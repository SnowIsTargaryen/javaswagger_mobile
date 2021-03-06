package javaa.swagger.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.PostVo;

public class TimelineManager {
    private static SqlSessionFactory factory;

    static {
        try {
            Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
            factory = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }

    public static List<PostVo> getTimeline(HashMap map) {
        // TODO Auto-generated method stub
        SqlSession s = factory.openSession();
        List<PostVo> list = s.selectList("timeline.getTimeline", map);
        s.close();
        return list;
    }

    public static List<PostVo> searchByHash(HashMap map) {
        // TODO Auto-generated method stub
        SqlSession s = factory.openSession();
        List<PostVo> list = s.selectList("timeline.searchByHash", map);
        s.close();
        return list;
    }

}
