package com.fh.dao;

import com.fh.model.Area;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface PullDownListDao extends JpaRepository<Area, Integer>,JpaSpecificationExecutor<Area>{

}
