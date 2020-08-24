package com.fh.dao;

import com.fh.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DaoCar extends JpaRepository<Car, Integer>, JpaSpecificationExecutor<Car> {
}
