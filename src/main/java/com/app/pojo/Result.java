package com.app.pojo;
// Generated 21 Dec, 2017 11:23:34 AM by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Result generated by hbm2java
 */
@Entity
@Table(name = "result", catalog = "tutesmessanger")
public class Result implements java.io.Serializable {

	private Integer id;
	private transient ExamSubjectStudentCompositTable examSubjectStudentCompositTable;
	private Integer obtainedMarks;
	private String remarks;

	public Result() {
	}

	public Result(ExamSubjectStudentCompositTable examSubjectStudentCompositTable, Integer obtainedMarks,
			String remarks) {
		this.examSubjectStudentCompositTable = examSubjectStudentCompositTable;
		this.obtainedMarks = obtainedMarks;
		this.remarks = remarks;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "exam_subject_student_id")
	public ExamSubjectStudentCompositTable getExamSubjectStudentCompositTable() {
		return this.examSubjectStudentCompositTable;
	}

	public void setExamSubjectStudentCompositTable(ExamSubjectStudentCompositTable examSubjectStudentCompositTable) {
		this.examSubjectStudentCompositTable = examSubjectStudentCompositTable;
	}

	@Column(name = "obtained_marks")
	public Integer getObtainedMarks() {
		return this.obtainedMarks;
	}

	public void setObtainedMarks(Integer obtainedMarks) {
		this.obtainedMarks = obtainedMarks;
	}

	@Column(name = "remarks", length = 300)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "Result [id=" + id + ", obtainedMarks=" + obtainedMarks + ", remarks=" + remarks + "]";
	}
	
	

}
