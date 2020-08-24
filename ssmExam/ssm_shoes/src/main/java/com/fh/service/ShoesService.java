package com.fh.service;

import com.fh.model.ConditionQuery;
import com.fh.util.DataTableResult;

public interface ShoesService {
    DataTableResult queryList(ConditionQuery conditionQuery);
}
