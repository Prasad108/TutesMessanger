package com.app.DAO.iml;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.DAO.ResultDAO;
import com.app.pojo.Branch;
import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.Login;
import com.app.pojo.Result;
import com.google.gson.Gson;

@Repository("ResultDAO")
@Transactional
public class ResultDAOImpl implements ResultDAO{
	
	 @Autowired
	 SessionFactory sessionFactory;
	 
	 protected Session currentSession() {
		 return this.sessionFactory.getCurrentSession();
	 }
	 Gson gson = new Gson();
	 
	 
	 @Override
		public void create(Result result) {
			// TODO Auto-generated method stub
		 		currentSession().save(result);
		}

		@Override
		public void update(Result result) {
			// TODO Auto-generated method stub
			currentSession().update(result);
		}

		@Override
		public void delet(int id) {
			// TODO Auto-generated method stub
			currentSession().delete(find(id));
		}

		@Override
		public Result find(int id) {
			return (Result)currentSession().get(Result.class,id);
			
		}
		
		@Override
		public Result findByESSCT(int id) {
			Query query=currentSession().createQuery("from Result r where r.examSubjectStudentCompositTable = :examSubjectStudentCompositTable");
			ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
			essct.setId(id);
			query.setParameter("examSubjectStudentCompositTable",essct);
				return (Result) query.uniqueResult();
		}
	 
	

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

	@Override
	@Transactional
	public int updateResult(List<HashMap<String, String>> StudResultList) {
		
		boolean isObtainedMarks ,isRemark;
		int obtainedMarkes;
		String remarks;
		for(HashMap<String, String> studResult : StudResultList)
		{
			isObtainedMarks=false;
			isRemark=false;
			obtainedMarkes=-1;
			remarks=null;
			
			int id =Integer.parseInt(studResult.get("id"));
			try {
				obtainedMarkes=Integer.parseInt(studResult.get("ObtainedMarkes"));
				isObtainedMarks=true;
			}
			catch(NumberFormatException NFE) {
				isObtainedMarks=false;
			};
			
			remarks=studResult.get("remarks");
			
			System.out.println(obtainedMarkes);						
			System.out.println(studResult.get("ObtainedMarkes"));
			System.out.println(remarks);
			
			if (resultExist(id)) {
				Result r=findByESSCT(id);
				if(isObtainedMarks==true && (remarks!=null && !remarks.isEmpty()))
				{
					
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setObtainedMarks(obtainedMarkes);		
					r.setRemarks(remarks);
					update(r);
				}else if(isObtainedMarks==true && (remarks==null || remarks.isEmpty())) {
					
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setObtainedMarks(obtainedMarkes);					
					update(r);
				}else if(isObtainedMarks==false && (remarks!=null && !remarks.isEmpty())) {
				
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setRemarks(remarks);
					update(r);
				}
				
			}else {
				if(isObtainedMarks==true && (remarks!=null && !remarks.isEmpty()))
				{
					Result r=new Result();
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setObtainedMarks(obtainedMarkes);		
					r.setRemarks(remarks);
					create(r);
				}else if(isObtainedMarks==true && (remarks==null || remarks.isEmpty())) {
					Result r=new Result();
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setObtainedMarks(obtainedMarkes);					
					create(r);
				}else if(isObtainedMarks==false && (remarks!=null && !remarks.isEmpty())) {
					Result r=new Result();
					ExamSubjectStudentCompositTable essct=new ExamSubjectStudentCompositTable();
					essct.setId(id);
					r.setExamSubjectStudentCompositTable(essct);
					r.setRemarks(remarks);
					create(r);
				}
				
			}
		}
		
		return 0;
	}

	@Override
	@Transactional
	public boolean resultExist(int essctID) {
		// TODO Auto-generated method stub
		
		Query query=currentSession().createQuery("from Result r where r.examSubjectStudentCompositTable = :examSubjectStudentCompositTable");
		ExamSubjectStudentCompositTable ESSCT=new ExamSubjectStudentCompositTable();
		ESSCT.setId(essctID);
		query.setParameter("examSubjectStudentCompositTable",ESSCT);
		
		List result=query.list();
		
		return !result.isEmpty();
	}

	@Override
	@Transactional
	public int InsertNewRecord(int id, int obtainedMarks, String remarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int InsertNewRecord(int id, int obtainedMarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int InsertNewRecord(int id, String remarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int updateRecord(int id, int obtainedMarks, String remarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int updateRecord(int id, int obtainedMarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int updateRecord(int id, String remarks) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	

	

}
