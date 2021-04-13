package com.zzptc.twds.dao;

import com.zzptc.twds.pojo.User;
import com.zzptc.twds.pojo.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
/*    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    
    List<User> selectByExample(UserExample example);

   

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKey(User record);*/
    
    
    User selectByPrimaryKey(Integer userid);
    
    int updateByPrimaryKeySelective(User record);
    
    User selectUserAndPassword(User user);
    
    List<User> selectAll();
    int insertSelective(User record);
    
    int deleteByUserid(int userid);
    
    List<User> selectAllBycId(int cId);
    
}