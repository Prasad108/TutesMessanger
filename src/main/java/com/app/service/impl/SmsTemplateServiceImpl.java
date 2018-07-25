package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.DAO.BranchDAO;
import com.app.DAO.SmsTemplateDAO;
import com.app.pojo.Institute;
import com.app.pojo.SmsTemplate;
import com.app.service.SmsTemplateService;
@Service("smstemplateService")
public class SmsTemplateServiceImpl implements SmsTemplateService {
	
	@Autowired
	SmsTemplateDAO smsTemplateDAO;

	@Override
	public void create(SmsTemplate smsTemplate) {
		smsTemplateDAO.create(smsTemplate);
		
	}

	@Override
	public void update(SmsTemplate smsTemplate) {
		smsTemplateDAO.update(smsTemplate);
		
	}

	@Override
	public SmsTemplate edit(int id) {
		return smsTemplateDAO.edit(id);
	}

	@Override
	public void delet(int id) {
		smsTemplateDAO.delet(id);
		
	}

	@Override
	public SmsTemplate find(int id) {
		return smsTemplateDAO.find(id);
	}

	@Override
	public List<SmsTemplate> getall() {
		return smsTemplateDAO.getall();
	}

	@Override
	public List<SmsTemplate> getallOfParticularInstitute(Institute id) {
		return smsTemplateDAO.getallOfParticularInstitute(id);
	}

}
