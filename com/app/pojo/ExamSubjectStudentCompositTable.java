package com.app.pojo;
// Generated 10 Jan, 2018 5:06:10 PM by Hibernate Tools 5.2.6.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * ExamSubjectStudentCompositTable generated by hbm2java
 */
@Entity
@Table(name = "exam_subject_student_composit_table", catalog = "tutesmessanger", uniqueConstraints = @UniqueConstraint(columnNames = {
		"student_id", "exam_id" }))
public class ExamSubjectStudentCompositTable implements java.io.Serializable {

	private Integer id;
	private Exam exam;
	private Student student;
	private SubjectDivComposit subjectDivComposit;
	private Date dateTime;
	private Integer durationInMinutes;
	private Integer outOfMarks;
	private Integer passingMarks;
	private Set<Result> results = new HashSet<Result>(0);
	private Set<Result> results_1 = new HashSet<Result>(0);

	public ExamSubjectStudentCompositTable() {
	}

	public ExamSubjectStudentCompositTable(Exam exam, Student student, SubjectDivComposit subjectDivComposit,
			Date dateTime, Integer durationInMinutes, Integer outOfMarks, Integer passingMarks, Set<Result> results,
			Set<Result> results_1) {
		this.exam = exam;
		this.student = student;
		this.subjectDivComposit = subjectDivComposit;
		this.dateTime = dateTime;
		this.durationInMinutes = durationInMinutes;
		this.outOfMarks = outOfMarks;
		this.passingMarks = passingMarks;
		this.results = results;
		this.results_1 = results_1;
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
	@JoinColumn(name = "exam_id")
	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject_div_id")
	public SubjectDivComposit getSubjectDivComposit() {
		return this.subjectDivComposit;
	}

	public void setSubjectDivComposit(SubjectDivComposit subjectDivComposit) {
		this.subjectDivComposit = subjectDivComposit;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date-time", length = 10)
	public Date getDateTime() {
		return this.dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	@Column(name = "duration_in_minutes")
	public Integer getDurationInMinutes() {
		return this.durationInMinutes;
	}

	public void setDurationInMinutes(Integer durationInMinutes) {
		this.durationInMinutes = durationInMinutes;
	}

	@Column(name = "out_of_marks")
	public Integer getOutOfMarks() {
		return this.outOfMarks;
	}

	public void setOutOfMarks(Integer outOfMarks) {
		this.outOfMarks = outOfMarks;
	}

	@Column(name = "passing_marks")
	public Integer getPassingMarks() {
		return this.passingMarks;
	}

	public void setPassingMarks(Integer passingMarks) {
		this.passingMarks = passingMarks;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examSubjectStudentCompositTable")
	public Set<Result> getResults() {
		return this.results;
	}

	public void setResults(Set<Result> results) {
		this.results = results;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examSubjectStudentCompositTable")
	public Set<Result> getResults_1() {
		return this.results_1;
	}

	public void setResults_1(Set<Result> results_1) {
		this.results_1 = results_1;
	}

}
