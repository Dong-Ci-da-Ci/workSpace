package com.fh.action;

import com.fh.service.ServiceCar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("actionCar")
public class ActionCar {

    @Autowired
    public ServiceCar service;
}
