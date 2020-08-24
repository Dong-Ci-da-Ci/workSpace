package com.fh.service.impl;

import java.util.List;

import com.fh.model.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.dao.PullDownListDao;
import com.fh.service.PullDownListService;


@Service
public class PullDownListServiceImpl implements PullDownListService {
	
	@Autowired 
	private PullDownListDao dao;

	@Override
	public List<Area> queryPullDownList() {
		
		return dao.findAll();
	}

	
	

}
