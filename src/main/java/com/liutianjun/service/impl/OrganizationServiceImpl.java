package com.liutianjun.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liutianjun.dao.OrganizationDao;
import com.liutianjun.pojo.Organization;
import com.liutianjun.pojo.OrganizationQuery;
import com.liutianjun.pojo.OrganizationQuery.Criteria;
import com.liutianjun.service.OrganizationService;

/**
 * 组织结构Impl
 * @Title: OrganizationServiceImpl.java  
 * @Package com.liutianjun.service.impl  
 * @Description: TODO
 * @author LiuTianJun  
 * @date 2018年6月1日  
 * @version V1.0
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private OrganizationDao organizationDao;
	
	/**
	 * 添加组织结构
	 * @Title: addNewOrg 
	 * @param record
	 * @return 
	 * int
	 */
	@Override
	public int addNewOrg(Organization record) {
		record.setCreateTime(new Date());
		record.setParentId(0);
		record.setStatus(0);
		return organizationDao.insert(record);
	}

	/**
	 * 添加组
	 * <p>Title: addNewGroup</p>  
	 * <p>Description: </p>  
	 * @param parentId
	 * @param id
	 * @return
	 */
	@Override
	public int addNewGroup(Integer parentId, String organizationName) {
		Organization organization = new Organization();
		organization.setCreateTime(new Date());
		organization.setParentId(parentId);
		organization.setOrganizationName(organizationName);
		organization.setStatus(1);
		return organizationDao.insert(organization);
	}

	/**
	 * 更新组信息
	 * <p>Title: undateGroup</p>  
	 * <p>Description: </p>  
	 * @param organizationName
	 * @return
	 */
	@Override
	public int undateGroup(Organization record) {
		return organizationDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 删除组
	 * <p>Title: deleteGroupById</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public int deleteGroupById(Integer id) {
		//同时删除重置组内成员的组id
		return organizationDao.deleteByPrimaryKey(id);
	}

	/**
	 * 根据父ID显示列表
	 * <p>Title: findOrgList</p>  
	 * <p>Description: </p>  
	 * @param parentid
	 * @return
	 */
	@Override
	public List<Organization> findOrgList(Integer parentId) {
		OrganizationQuery example = new OrganizationQuery();
		Criteria criteria = example.createCriteria();
		if(parentId != -1) {
			criteria.andParentIdEqualTo(parentId);
		}
		criteria.andStatusEqualTo(1);
		return organizationDao.selectByExample(example);
	}

	/**
	 * 处理添加组织结构请求
	 * <p>Title: dealAddOrgRequest</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @param cmd 0:拒绝 1:通过
	 * @return
	 */
	@Override
	public int dealAddOrgRequest(Integer id, Integer cmd) {
		//同意请求，则更新记录状态
		if(1 == cmd) {
			OrganizationQuery example = new OrganizationQuery();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(id);
			Organization organization = new Organization();
			organization.setStatus(1);
			return organizationDao.updateByExampleSelective(organization, example);
		}
		//拒绝请求，则删除记录
		if(0 == cmd) {
			return organizationDao.deleteByPrimaryKey(id);
		}
		return 0;
	}

	/**
	 * 根据id获取组
	 * <p>Title: selectByPrimaryKey</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@Override
	public Organization selectByPrimaryKey(Integer id) {
		return organizationDao.selectByPrimaryKey(id);
	}
	
	

}
