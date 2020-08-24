package com.fh.service;


import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Drug;
import com.fh.util.DataTableResult;


import java.util.List;

public interface DrugService {


    DataTableResult queryDrugList(ConditionQuery conditionQuery);

    void addDrug(Drug drug);

    Drug queryById(Integer id);

    void updateDrug(Drug drug);

    void deleteDrug(int id);

    void deleteBatchDrug(List<Integer> drugIdList);


    List<Area> queryPullDownList();
}
