package com.xtkong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.ProjectNodeDataDao;

@Service
public class ProjectNodeDataService {

	@Autowired
	ProjectNodeDataDao projectNodeDataDao;

	public int insert(Integer p_id, String dataId, Integer cs_id, Integer ft_id) {
		return projectNodeDataDao.insert(p_id, dataId, cs_id, ft_id);
	}

//	public int remove(Integer p_id, String dataId, Integer cs_id, Integer ft_id) {
//		return projectNodeDao.remove(p_id, dataId, cs_id, ft_id);
//
//	}
//
//	public List<String> select(Integer p_id, Integer cs_id, Integer ft_id) {
//		return projectNodeDao.select(p_id, cs_id, ft_id);
//	}

}
