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

	public int insertFormatField(FormatField formatField) {
		return formatFieldDao.insertFormatField(formatField);
	}

	public int updateFormatField(FormatField formatField) {
		return formatFieldDao.updateFormatField(formatField);
	}

	public int deleteFormatField(Integer ff_id) {
		return formatFieldDao.deleteFormatField(ff_id);
	}

	/**
	 * 选取格式字段列表
	 * 
	 * @param ft_id
	 *            格式类型
	 * @return 选取格式字段列表
	 */
	public List<FormatField> getFormatFields(Integer ft_id) {
		return formatFieldDao.getFormatFields(ft_id);
	}

	public FormatField getFormatField(Integer ff_id) {
		return formatFieldDao.getFormatField(ff_id);
	}
	public Integer getFormatField_ft_id(Integer ff_id) {
		return formatFieldDao.getFormatField_ft_id(ff_id);
	}
}
