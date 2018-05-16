package com.xtkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.SourceFiledDao;
import com.xtkong.model.SourceField;

@Service
public class SourceFiledService {
	@Autowired
	SourceFiledDao sourceFiledDao;

	public int insertSourceFiled(SourceField sourceFiled) {
		return sourceFiledDao.insertSourceFiled(sourceFiled);
	}

	public int updateSourceFiled(SourceField sourceFiled) {
		return sourceFiledDao.updateSourceFiled(sourceFiled);
	}

	/**
	 * * 选取采集源字段列表
	 * 
	 * @param cs_id
	 *            采集源
	 * @return 采集源字段列表
	 */
	public List<SourceField> getSourceFileds(int cs_id) {
		return sourceFiledDao.getSourceFileds(cs_id);
	}

	public int deleteSourceFiled(Integer cs_id) {
		return sourceFiledDao.deleteSourceFiled(cs_id);
	}

	public SourceField getSourceFiled(Integer csf_id) {
		return sourceFiledDao.getSourceFiled(csf_id);
	}
}
