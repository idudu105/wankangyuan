package com.xtkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.SourceFiledDao;
import com.xtkong.model.SourceFiled;
@Service
public class SourceFiledService {
	@Autowired
	SourceFiledDao sourceFiledDao;
	public int insertSourceFiled(SourceFiled sourceFiled){
		return sourceFiledDao.insertSourceFiled(sourceFiled);
	}
	public int updateSourceFiled(SourceFiled sourceFiled){
		return sourceFiledDao.updateSourceFiled(sourceFiled);
	}
	/**
	 * * 选取采集源字段列表
	 * 
	 * @param cs_id  采集源
	 * @return 采集源字段列表
	 */
	public List<SourceFiled> getSourceFileds( int cs_id){
		return sourceFiledDao.getSourceFileds(cs_id);
	}
	public int deleteProjectFloder(Integer cs_id){
		return sourceFiledDao.deleteProjectFloder(cs_id);
	}
}
