package com.dzjin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dzjin.service.ProjectService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	

}
