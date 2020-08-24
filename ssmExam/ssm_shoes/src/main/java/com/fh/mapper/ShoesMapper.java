package com.fh.mapper;

import com.fh.model.ConditionQuery;
import com.fh.model.Shoes;
import com.fh.util.DataTableResult;

import java.util.List;

public interface ShoesMapper {

    Long queryCount(ConditionQuery conditionQuery);

    List<Shoes> queryList(ConditionQuery conditionQuery);
}
