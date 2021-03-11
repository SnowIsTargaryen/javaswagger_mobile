package javaa.swagger.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import javaa.swagger.db.UsersManager;
import javaa.swagger.vo.UsersVo;

@Repository
public class UsersDao {

    //회원가입
    public int insertUser(UsersVo u) {
        return UsersManager.insertUser(u);
    }

    //로그인
    public boolean isUser(Map map) {
        return UsersManager.isUser(map);
    }

    //중복확인
    public int idCheck(String user_id) {
        // TODO Auto-generated method stub

        return UsersManager.idCheck(user_id);
    }

    public UsersVo profile(HashMap map) {
        // TODO Auto-generated method stub
        return UsersManager.profile(map);
    }

    public int editProfile(UsersVo u) {
        // TODO Auto-generated method stub
        return UsersManager.editProfile(u);
    }

    public int withdrawUser(HashMap map) {
        // TODO Auto-generated method stub
        return UsersManager.withdrawUser(map);
    }

    public List<UsersVo> search(HashMap map) {
        // TODO Auto-generated method stub
        return UsersManager.search(map);
    }

    public UsersVo phoneCheck(String user_phone) {
        // TODO Auto-generated method stub
        return UsersManager.phoneCheck(user_phone);
    }

    public int emailCheck(String user_email) {
        // TODO Auto-generated method stub
        return UsersManager.emailCheck(user_email);
    }

    public int pro_emailCheck(String user_email) {
        // TODO Auto-generated method stub
        return UsersManager.pro_emailCheck(user_email);
    }
}
