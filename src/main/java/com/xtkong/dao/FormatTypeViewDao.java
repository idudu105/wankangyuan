package com.xtkong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import com.xtkong.model.FormatTypeView;

public interface FormatTypeViewDao {
	/**
	 * 选取格式类型列表
	 * @param higher_ft_id 上层格式类型
	 * @return 格式类型列表
	 */
	@Select("select * from view_format_type where cs_id=#{cs_id} order by ft_id")
	public List<FormatTypeView> selectFormatType(@Param("cs_id") int cs_id);
}

