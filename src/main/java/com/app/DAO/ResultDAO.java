package com.app.DAO;

import java.util.HashMap;
import java.util.List;

import com.app.pojo.Result;

public interface ResultDAO {
	
	public void create(Result result);
	public void update(Result result);
	public void delet(int id );
	public Result find(int id);
	public Result findByESSCT(int id);
	
	
	public String smsSubjectStudentResult (int ExamId,int SubdivId);
	public int updateResult(List<HashMap<String, String>> StudResultList);
	public boolean resultExist(int essct);
	public int InsertNewRecord(int id, int obtainedMarks, String remarks);
	public int InsertNewRecord(int id, int obtainedMarks);
	public int InsertNewRecord(int id, String remarks);
	public int updateRecord(int id, int obtainedMarks, String remarks);
	public int updateRecord(int id, int obtainedMarks);
	public int updateRecord(int id, String remarks);
	
}
