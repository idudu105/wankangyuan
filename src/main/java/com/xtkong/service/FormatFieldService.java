package com.xtkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.FormatFieldDao;
import com.xtkong.model.FormatField;

@Service
public class FormatFieldService {
	@Autowired
	 FormatFieldDao formatFieldDao;
	public int insertFormatField(FormatField FormatField){
		return formatFieldDao.insertFormatField(FormatField);
	}
	/**
	 * 选取格式字段列表
	 * @param ft_id 格式类型
	 * @return 选取格式字段列表
	 */
	public List<FormatField> selectFormatField(Integer ft_id){
		return formatFieldDao.selectFormatField(ft_id);
	}
}
