package com.fh.dao;

import com.fh.model.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PullDownListDao extends JpaRepository<Brand, Integer>, JpaSpecificationExecutor<Brand> {
}
