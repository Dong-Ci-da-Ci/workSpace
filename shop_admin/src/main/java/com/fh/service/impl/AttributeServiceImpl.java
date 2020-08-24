package com.fh.service.impl;

import com.fh.mapper.AttributeMapper;
import com.fh.model.po.AttributeQuery;
import com.fh.model.vo.Attribute;
import com.fh.model.vo.AttributeValue;
import com.fh.service.AttributeService;
import com.fh.service.AttributeValueService;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AttributeServiceImpl implements AttributeService {

    @Autowired
    private AttributeMapper attributeMapper;

    @Autowired
    private AttributeValueService attributeValueService;

    @Override
    public DataTableResult queryAttributeList(AttributeQuery attributeQuery) {
        //查询总条数
        long count =  attributeMapper.queryAttributeCount(attributeQuery);
        //查询数据
        List<Attribute> attributeList =  attributeMapper.queryAttributeList(attributeQuery);
        //组装分页数据

        DataTableResult dataTableResult = new DataTableResult(attributeQuery.getDraw(),count,count,attributeList);
     /*   dataTableResult.setData(attributeList);
        dataTableResult.setDraw(attributeQuery.getDraw());
        dataTableResult.setRecordsFiltered(count);
        dataTableResult.setRecordsTotal(count);*/


        return dataTableResult;
    }

    //新增数据
    @Override
    public void addAttribute(Attribute attribute) {
        attributeMapper.addAttribute(attribute);
        //调用新增属性值方法
        addAttributeValue(attribute);
    }
    //新增属性值
    public void addAttributeValue(Attribute attribute){
        // 判断该属性的属性值是否为空
        if(StringUtils.isNotBlank(attribute.getAttributeValue())){
            String[] valueArr = attribute.getAttributeValue().split("\n");
            // 用来存放属性值对象的集合
            List<AttributeValue> attributeValueList = new ArrayList<>();
            for(String value : valueArr){
                AttributeValue attributeValue = new AttributeValue();
                attributeValue.setAttrid(attribute.getId());
                attributeValue.setValue(value);
                attributeValueList.add(attributeValue);
            }
            // 调用AttributeValueService中的批量添加方法
            attributeValueService.batchAddAttributeValue(attributeValueList);
        }
    }

    //回显
    @Override
    public Attribute queryAttributeById(int id) {
        return attributeMapper.queryAttributeById(id);
    }

    //修改
    @Override
    public void updateAttribute(Attribute attribute) {
        attributeMapper.updateAttribute(attribute);

    }

    //删除
    @Override
    public void deleteAttribute(int id) {
        attributeMapper.deleteAttribute(id);
    }

    @Override
    public List<Attribute> queryAttributeListByClassifyId(Integer classifyId) {
        return attributeMapper.queryAttributeListByClassifyId(classifyId);
    }
}
