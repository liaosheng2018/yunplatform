/*******************************************************************************
 * Licensed Materials - Property of Cloudstong 
 * 
 * (C) Copyright Cloudstong Corp. 2014 All Rights Reserved. (
 *
 ******************************************************************************/
package com.cloudstong.business.peach.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloudstong.business.peach.dao.PeachDao;
import com.cloudstong.business.peach.model.Peach;
import com.cloudstong.platform.core.dao.impl.BaseMyBatisDaoImpl;

/**
 * @author Allan
 * Created on 2015-6-11 12:28:44
 * 
 * Revision History:
 * Date   		Reviser		Description
 * ----   		-------   	----------------------------------------------------
 * 
 * Description:
 * 
 */
@Repository("peachDao")
public class PeachDaoImpl extends BaseMyBatisDaoImpl<Peach, Long> implements PeachDao  {

}
