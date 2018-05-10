package com.xtkong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtkong.dao.FormatTypeDao;
import com.xtkong.model.FormatType;

@Service
public class FormatTypeService {
	@Autowired
	FormatTypeDao formatTypeDao;
	public int insertFormatType(FormatType formatType){
		return formatTypeDao.insertFormatType(formatType);
	}
	public int updateFormatType(FormatType FormatType){
		return formatTypeDao.updateFormatType(FormatType);
	}
	/**
	 * 选取格式类型列表
	 * @param higher_ft_id 上层格式类型
	 * @return 格式类型列表
	 */
	public List<FormatType> selectFormatType(Integer higher_ft_id){
		return formatTypeDao.selectFormatType(higher_ft_id);
	}
	public int deleteFormatType(Integer ft_id){
		return formatTypeDao.deleteFormatType(ft_id);
	}
}
