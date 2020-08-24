package com.fh.dao;

import com.fh.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DaoBook extends JpaRepository<Book, Integer>, JpaSpecificationExecutor<Book> {
}
