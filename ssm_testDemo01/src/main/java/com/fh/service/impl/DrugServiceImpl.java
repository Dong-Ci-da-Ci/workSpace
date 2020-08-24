package com.fh.service.impl;


import com.fh.mapper.DrugMapper;
import com.fh.model.Area;
import com.fh.model.ConditionQuery;
import com.fh.model.Drug;
import com.fh.service.DrugService;
import com.fh.util.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class DrugServiceImpl implements DrugService {

    @Autowired
    private DrugMapper drugMapper;


    @Override
    public DataTableResult queryDrugList(ConditionQuery conditionQuery) {
        //查询总条数
        long count =  drugMapper.queryDrugCount(conditionQuery);
        //查询数据
        List<Drug> productList =  drugMapper.queryDrugList(conditionQuery);
        //组装分页数据
        DataTableResult dataTableResult = new DataTableResult(conditionQuery.getDraw(),count,count,productList);

        return dataTableResult;
    }

    @Override
    public void addDrug(Drug drug) {
        drugMapper.addDrug(drug);
    }

    @Override
    public Drug queryById(Integer id) {
        return drugMapper.queryById(id);
    }

    @Override
    public void updateDrug(Drug drug) {
        drugMapper.updateDrug(drug);
    }

    @Override
    public void deleteDrug(int id) {
        drugMapper.deleteDrug(id);
    }

    @Override
    public void deleteBatchDrug(List<Integer> drugIdList) {
        drugMapper.deleteBatchDrug(drugIdList);
    }

    @Override
    public List<Area> queryPullDownList() {
        return drugMapper.queryPullDownList();
    }


}
