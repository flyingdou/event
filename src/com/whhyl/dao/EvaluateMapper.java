package com.whhyl.dao;

import com.whhyl.entity.Evaluate;
import java.util.List;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Evaluate record);

    Evaluate selectByPrimaryKey(Integer id);

    List<Evaluate> selectAll();

    int updateByPrimaryKey(Evaluate record);
}