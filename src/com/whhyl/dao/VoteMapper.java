package com.whhyl.dao;

import com.whhyl.entity.Vote;
import java.util.List;

public interface VoteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Vote record);

    Vote selectByPrimaryKey(Integer id);

    List<Vote> selectAll();

    int updateByPrimaryKey(Vote record);
}