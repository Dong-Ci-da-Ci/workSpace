package com.fh.service.impl;

import com.fh.dao.DaoStudent;
import com.fh.model.ConditionQuery;
import com.fh.model.Student;
import com.fh.service.ServiceStudent;
import com.fh.util.DataTablePageBean;
import com.fh.util.DataTableResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Service
public class ServiceStudentImpl implements ServiceStudent {
    @Autowired
    private DaoStudent dao;

    @Override
    public DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery) {
        Specification abc = new Specification() {
            @Override
            public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList();
//普通查询
                if(!StringUtils.isEmpty(conditionQuery.getName())) {
                    list.add(criteriaBuilder // as中类型跟该字段的类型保持一致
                            .like(root.get("name").as(String.class), "%" + conditionQuery.getName() + "%"));
                }



                //精确查询
                if(conditionQuery.getNum() != null) {
                    list.add(criteriaBuilder.equal(root.get("phoneNumber").as(Integer.class), conditionQuery.getNum()));
                }

                //单选
                if(conditionQuery.getStatus() != null) {
                    list.add(criteriaBuilder.equal(root.get("sex").as(Integer.class), conditionQuery.getStatus()));
                }

                //最大值，最小值查询
                if(conditionQuery.getMinPrice() != null){
                    list.add(criteriaBuilder.ge(root.get("age").as(Integer.class), conditionQuery.getMinPrice()));
                }

                if(conditionQuery.getMaxPrice() != null){
                    list.add(criteriaBuilder.le(root.get("age").as(Integer.class), conditionQuery.getMaxPrice()));
                }

                //下拉列表查询
                if(conditionQuery.getArea() != null && conditionQuery.getArea() != -1){
                    list.add(criteriaBuilder.equal(root.get("stuArea").get("areaId").as(Integer.class), conditionQuery.getArea()));
                }



                return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
            }
        };
        // 排序
        Sort sort = new Sort(Sort.Direction.DESC,"id");
        Pageable pageable = (Pageable) new PageRequest(pageBean.getStart()/pageBean.getLength(),pageBean.getLength(),sort);
        Page<Student> page = dao.findAll(abc, pageable);

        //分组
        DataTableResult dataTableResult = new DataTableResult();
        dataTableResult.setData(page.getContent()); // page.getContent()：从Page对象中获取查询到的集合
        dataTableResult.setDraw(pageBean.getDraw());
        dataTableResult.setRecordsFiltered(page.getTotalElements()); // page.getTotalElements()：从page对象中获取总条数
        dataTableResult.setRecordsTotal(page.getTotalElements());
        return dataTableResult;
    }

    //新增
    @Override
    public void addStudent(Student student) {
        dao.save(student);
    }

    @Override
    public Student queryById(Integer id) {
        return dao.findOne(id);
    }

    @Override
    public void alldelete(String ids) {
        String[] arr = ids.split(",");
        for (int i = 0; i < arr.length; i++) {
            dao.delete(Integer.parseInt(arr[i]));

        }

    }
}
