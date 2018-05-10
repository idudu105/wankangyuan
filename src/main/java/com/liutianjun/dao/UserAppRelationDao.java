package com.liutianjun.dao;

import com.liutianjun.pojo.UserAppRelation;
import com.liutianjun.pojo.UserAppRelationQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserAppRelationDao {
    int countByExample(UserAppRelationQuery example);

    int deleteByExample(UserAppRelationQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserAppRelation record);

    int insertSelective(UserAppRelation record);

    List<UserAppRelation> selectByExample(UserAppRelationQuery example);

    UserAppRelation selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserAppRelation record, @Param("example") UserAppRelationQuery example);

    int updateByExample(@Param("record") UserAppRelation record, @Param("example") UserAppRelationQuery example);

    int updateByPrimaryKeySelective(UserAppRelation record);

    int updateByPrimaryKey(UserAppRelation record);
}