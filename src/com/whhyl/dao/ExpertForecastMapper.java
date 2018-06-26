package com.whhyl.dao;

import com.whhyl.entity.ExpertForecast;
import java.util.List;

public interface ExpertForecastMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExpertForecast record);

    ExpertForecast selectByPrimaryKey(Integer id);

    List<ExpertForecast> selectAll();

    int updateByPrimaryKey(ExpertForecast record);
}