package javaa.swagger.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javaa.swagger.vo.UsersVo;


public class UsersManager {
    private static SqlSessionFactory factory;

    static {
        try {
            Reader reader = Resources.getResourceAsReader("javaa/swagger/db/mybatisConfig.xml");
            factory = new SqlSessionFactoryBuilder().build(reader);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    //회원가입 메소드
    public static int insertUser(UsersVo u) {

        int re = -1;
        SqlSession session = factory.openSession();
        re = session.insert("users.insert", u);
        if (re >= 1) {
            session.commit();
        }
        session.close();
        return re;
    }

    //로그인 메소드
    public static boolean isUser(Map map) {
        boolean r = false;

        SqlSession session = factory.openSession();
        UsersVo u = session.selectOne("users.isUser", map);

        if (u != null) {
            r = true;
        }
        session.close();

        return r;

    }

    //중복검사할 수 있도록 ID를 불러오는 메소드
    public static int idCheck(String user_id) {
        // TODO Auto-generated method stub
        SqlSession session = factory.openSession();
        int re = session.selectOne("users.idCheck", user_id);
        session.close();

        return re;
    }

    //프로필 정보 메소드
    public static UsersVo profile(Map map) {
        // TODO Auto-generated method stub
        SqlSession session = factory.openSession();
        UsersVo u = session.selectOne("users.profile", map);
        session.close();

        return u;
    }

    //프로필 수정
    public static int editProfile(UsersVo u) {
        int re = -1;
        System.out.println("manager");
        SqlSession session = factory.openSession();
        re = session.update("users.edit", u);
        System.out.println("manager re:" + re);
        if (re > 0) {
            session.commit();
            System.out.println("if문 작동함");
        }
        session.close();

        return re;
    }

    public static int withdrawUser(Map map) {
        // TODO Auto-generated method stub

        int re = -1;

        SqlSession session = factory.openSession();
        re = session.delete("users.withDraw", map);
        if (re > 0) {
            session.commit();
        }
        session.close();

        return re;
    }

    public static List<UsersVo> search(Map map) {

        SqlSession session = factory.openSession();
        List<UsersVo> list = session.selectList("users.search", map);
        session.close();

        return list;
    }

    public static UsersVo phoneCheck(String user_phone) {
        // TODO Auto-generated method stub
        SqlSession session = factory.openSession();
        UsersVo uv = session.selectOne("users.phoneCheck", user_phone);
        session.close();

        return uv;

    }

    public static int emailCheck(String user_email) {
        // TODO Auto-generated method stub
        SqlSession session = factory.openSession();
        int re = session.selectOne("users.emailCheck", user_email);
        session.close();

        return re;

    }

    public static int pro_emailCheck(String user_email) {
        // TODO Auto-generated method stub
        SqlSession session = factory.openSession();
        int re = session.selectOne("users.emailCheck", user_email);
        session.close();

        return re;
    }

}
