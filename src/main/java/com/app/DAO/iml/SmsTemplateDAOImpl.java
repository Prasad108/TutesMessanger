package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.SmsTemplateDAO;
import com.app.pojo.Branch;
import com.app.pojo.Institute;
import com.app.pojo.SmsTemplate;

@Transactional
@Repository("SmsTemplateDAO")
public class SmsTemplateDAOImpl implements SmsTemplateDAO {
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }

	@Override
	public void create(SmsTemplate smsTemplate) {
		currentSession().save(smsTemplate);

	}

	@Override
	public void update(SmsTemplate smsTemplate) {
		currentSession().update(smsTemplate);

	}

	@Override
	public SmsTemplate edit(int id) {
		 return find(id);
	}

	@Override
	public void delet(int id) {
		currentSession().delete(find(id));

	}

	@Override
	public SmsTemplate find(int id) {
		return (SmsTemplate)currentSession().get(SmsTemplate.class,id);
	}

	@Override
	public List<SmsTemplate> getall() {
		return currentSession().createCriteria(SmsTemplate.class).list();
	}

	@Override
	public List<SmsTemplate> getallOfParticularInstitute(Institute id) {
		Query query=currentSession().createQuery("from SmsTemplate  where institute = :id");
		query.setParameter("id",id);
		return query.list();
	}

}
