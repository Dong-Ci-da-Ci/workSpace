package com.fh.service.impl;

import com.fh.dao.DaoCar;
import com.fh.service.ServiceCar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceCarImpl implements ServiceCar {

    @Autowired
    private DaoCar dao;
}
