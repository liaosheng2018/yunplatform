/*******************************************************************************
 * Licensed Materials - Property of Cloudstong
 * 
 * (C) Copyright Cloudstong Corp. 2014 All Rights Reserved. (
 *
 ******************************************************************************/
package com.cloudstong.platform.system.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloudstong.platform.system.model.UserRole;
import com.cloudstong.platform.system.service.SysUserRoleService;

/**
 * @author Allan
 * 
 *         Created on 2014-9-24
 * 
 *         Description:
 * 
 */
@Repository("sysUserRoleService")
public class SysUserRoleServiceImpl implements SysUserRoleService {

	@Override
	public List<UserRole> getUserByRoleIds(String cmpIds) {
		// TODO Auto-generated method stub need to be implemented.
		return null;
	}

}
