package com.whhyl.dao;

import com.whhyl.entity.Praise;
import java.util.List;

public interface PraiseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Praise record);

    Praise selectByPrimaryKey(Integer id);

    List<Praise> selectAll();

    int updateByPrimaryKey(Praise record);
}