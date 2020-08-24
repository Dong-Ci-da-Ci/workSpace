package com.fh.dao;


import com.fh.model.BookType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface PullDownListDao extends JpaRepository<BookType, Integer>,JpaSpecificationExecutor<BookType>{

}