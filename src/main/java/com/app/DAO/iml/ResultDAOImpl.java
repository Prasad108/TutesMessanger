package com.app.DAO.iml;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ResultDAO;
import com.google.gson.Gson;

@Repository("ResultDAO")
public class ResultDAOImpl implements ResultDAO{
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	 Gson gson = new Gson();

	@Override
	@Transactional
	public String smsSubjectStudentResult(int ExamId, int SubdivId) {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();  
		 Query query=currentSession().createQuery("from ExamSubjectStudentCompositTable essct INNER JOIN Result r  on  essct.id=r.examSubjectStudentCompositTable.id  LEFT JOIN Student s on essct.student.id=s.id LEFT JOIN SubjectDivComposit sdc on essct.subjectDivComposit.id=sdc.id LEFT JOIN Exam e on essct.exam.id=e.id where essct.exam.id= :ExamId and essct.subjectDivComposit.id = :subDivId and essct.student.id is not null");
		 query.setParameter("ExamId", ExamId);                                                                                         
		 query.setParameter("subDivId", SubdivId);
		 
       List lst = query.list();
       sb.append("[");
       System.out.println("" + lst.size());
       System.out.println("gooing to display result");
       for (int i = 0; i < lst.size(); i++) {
       	 sb.append("{");
       	 sb.append("\"examSubjectStudentCompositTable\":"+gson.toJson(((Object[]) lst.get(i))[0]));
       	 sb.append(",\"result\":"+gson.toJson(((Object[]) lst.get(i))[1]));
       	 sb.append(",\"student\":"+gson.toJson(((Object[]) lst.get(i))[2]));
       	 sb.append(",\"SubDivComp\":"+gson.toJson(((Object[]) lst.get(i))[3]));
       	 sb.append(",\"exam\":"+gson.toJson(((Object[]) lst.get(i))[4]));
           System.out.println("first obj"+((Object[]) lst.get(i))[0]);     //account bean, actually this is in reverse order - so this is user bean
           System.out.println("second obj"+((Object[]) lst.get(i))[1]); 
           System.out.println("third obj"+((Object[]) lst.get(i))[2]); //user bean         & this account bean
           System.out.println("fourth obj"+((Object[]) lst.get(i))[3]);
           System.out.println("fifth obj"+((Object[]) lst.get(i))[4]);
           sb.append("},");
       }
       sb.setLength(sb.length() - 1);
       
       sb.append("]");
      return sb.toString();
	}

}
