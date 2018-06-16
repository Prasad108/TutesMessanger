package com.app.service;

import java.util.HashMap;
import java.util.List;

public interface ResultService {
	
	public String smsSubjectStudentResult (int ExamId,int SubdivId);
	public int updateResult(List<HashMap<String, String>> StudResultList);


}
