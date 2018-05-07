package com.dzjin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzjin.dao.ProjectDao;

@Service
public class ProjectService {
	
	@Autowired
	ProjectDao projectDao;

}
