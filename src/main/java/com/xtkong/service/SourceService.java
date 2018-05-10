package com.xtkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.SourceDao;
import com.xtkong.model.Source;

@Service
public class SourceService {
	@Autowired
	SourceDao sourceDao;
	/**
	 * 新增采集源
	 * @param source
	 * @return
	 */
	public int insertSource(Source source){
		return sourceDao.insertSource(source);
	}
	/**
	 * 选取数据源
	 * @return	数据源列表
	 */
	public List<Source> selectSource() {
		return sourceDao.selectSource();
	}
}
