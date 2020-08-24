package com.fh.service.impl;

import com.fh.dao.PullDownListDao;

import com.fh.model.BookType;
import com.fh.service.PullDownListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PullDownListServiceImpl implements PullDownListService {
	
	@Autowired 
	private PullDownListDao dao;


	@Override
	public List<BookType> queryPullDownList() {

		return dao.findAll();
	}
}
