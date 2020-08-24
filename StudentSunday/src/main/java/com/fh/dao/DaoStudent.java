package com.fh.dao;

import com.fh.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DaoStudent extends JpaRepository<Student, Integer>, JpaSpecificationExecutor<Student> {
}
