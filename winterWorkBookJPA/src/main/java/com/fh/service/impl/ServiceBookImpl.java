package com.fh.service.impl;

import com.fh.dao.DaoBook;
import com.fh.model.Book;
import com.fh.model.ConditionQuery;
import com.fh.service.ServiceBook;
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
public class ServiceBookImpl implements ServiceBook {
    @Autowired
    private DaoBook dao;

    @Override
    public DataTableResult queryList(DataTablePageBean pageBean, ConditionQuery conditionQuery) {
        Specification abc = new Specification(){

            @Override
            public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> list = new ArrayList();
                if(!StringUtils.isEmpty(conditionQuery.getName())) {
                    list.add(criteriaBuilder // as中类型跟该字段的类型保持一致
                            .like(root.get("bookName").as(String.class), "%" + conditionQuery.getName() + "%"));
                }



                //最大值，最小值查询    價格
                if(conditionQuery.getMinPrice() != null){
                    list.add(criteriaBuilder.ge(root.get("bookPrice").as(Integer.class), conditionQuery.getMinPrice()));
                }

                if(conditionQuery.getMaxPrice() != null){
                    list.add(criteriaBuilder.le(root.get("bookPrice").as(Integer.class), conditionQuery.getMaxPrice()));
                }



                //最大值，最小值查询    銷量
                if(conditionQuery.getMinSales() != null){
                    list.add(criteriaBuilder.ge(root.get("bookSales").as(Integer.class), conditionQuery.getMinSales()));
                }

                if(conditionQuery.getMaxSales() != null){
                    list.add(criteriaBuilder.le(root.get("bookSales").as(Integer.class), conditionQuery.getMaxSales()));
                }



                //最大值，最小值查询 庫存
                if(conditionQuery.getMinStock() != null){
                    list.add(criteriaBuilder.ge(root.get("bookStock").as(Integer.class), conditionQuery.getMinStock()));
                }

                if(conditionQuery.getMaxStock() != null){
                    list.add(criteriaBuilder.le(root.get("bookStock").as(Integer.class), conditionQuery.getMaxStock()));
                }



                //单选
//                if(conditionQuery.getIsup() != null) {
//                    list.add(criteriaBuilder.equal(root.get("isup").as(Integer.class), conditionQuery.getIsup()));
//                }

                //多选
                if(conditionQuery.getPerson() != null) {
                    list.add(criteriaBuilder.equal(root.get("person").as(Integer.class), conditionQuery.getPerson()));
                }



                //下拉列表查询
                if(conditionQuery.getType() != null && conditionQuery.getArea() != -1){
                    list.add(criteriaBuilder.equal(root.get("bookTypeId").get("typeId").as(Integer.class), conditionQuery.getType()));
                }

                //日期查询
                if (conditionQuery.getMinDate() != null) {
                    list.add(criteriaBuilder.greaterThanOrEqualTo(root.get("producedDate"), conditionQuery.getMinDate()));
                }
                if (conditionQuery.getMaxDate() != null) {
                    list.add(criteriaBuilder.lessThanOrEqualTo(root.get("producedDate"), conditionQuery.getMaxDate()));
                }




                return criteriaBuilder.and(list.toArray(new Predicate[list.size()]));
            }
        };
        // 排序
        Sort sort = new Sort(Sort.Direction.DESC,"bookId");
        Pageable pageable = (Pageable) new PageRequest(pageBean.getStart()/pageBean.getLength(),pageBean.getLength(),sort);
        Page<Book> page = dao.findAll(abc, pageable);

        //分组
        DataTableResult dataTableResult = new DataTableResult();
        dataTableResult.setData(page.getContent()); // page.getContent()：从Page对象中获取查询到的集合
        dataTableResult.setDraw(pageBean.getDraw());
        dataTableResult.setRecordsFiltered(page.getTotalElements()); // page.getTotalElements()：从page对象中获取总条数
        dataTableResult.setRecordsTotal(page.getTotalElements());
        return dataTableResult;
    }

    @Override
    public void addBook(Book book) {
        dao.save(book);
    }

    @Override
    public Book queryById(Integer id) {
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
