package com.app.pojo;
// Generated 22 Dec, 2017 12:24:54 PM by Hibernate Tools 5.2.3.Final

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

/**
 * Exam generated by hbm2java
 */
@Entity
@Table(name = "exam", catalog = "tutesmessanger")
public class Exam implements java.io.Serializable {

	private Integer id;
	private transient ExamMode examMode;
	private transient ExamType examType;
	private transient Institute institute;
	private String discription;
	private Integer outOf;
	private Integer passingMarks;
	private Byte regular;
	private transient Set<ExamSubjectStudentCompositTable> examSubjectStudentCompositTables = new HashSet<ExamSubjectStudentCompositTable>(
			0);

	public Exam() {
	}

	public Exam(ExamMode examMode, ExamType examType, Institute institute, String discription, Integer outOf,
			Integer passingMarks, Byte regular, Set<ExamSubjectStudentCompositTable> examSubjectStudentCompositTables) {
		this.examMode = examMode;
		this.examType = examType;
		this.institute = institute;
		this.discription = discription;
		this.outOf = outOf;
		this.passingMarks = passingMarks;
		this.regular = regular;
		this.examSubjectStudentCompositTables = examSubjectStudentCompositTables;
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
	@JoinColumn(name = "exam_mode_id")
	public ExamMode getExamMode() {
		return this.examMode;
	}

	public void setExamMode(ExamMode examMode) {
		this.examMode = examMode;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "exam_type_id")
	public ExamType getExamType() {
		return this.examType;
	}

	public void setExamType(ExamType examType) {
		this.examType = examType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "insitute_id")
	public Institute getInstitute() {
		return this.institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	@Column(name = "discription", length = 500)
	public String getDiscription() {
		return this.discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	@Column(name = "out_of")
	public Integer getOutOf() {
		return this.outOf;
	}

	public void setOutOf(Integer outOf) {
		this.outOf = outOf;
	}

	@Column(name = "passing_marks")
	public Integer getPassingMarks() {
		return this.passingMarks;
	}

	public void setPassingMarks(Integer passingMarks) {
		this.passingMarks = passingMarks;
	}

	@Column(name = "regular")
	public Byte getRegular() {
		return this.regular;
	}

	public void setRegular(Byte regular) {
		this.regular = regular;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "exam")
	public Set<ExamSubjectStudentCompositTable> getExamSubjectStudentCompositTables() {
		return this.examSubjectStudentCompositTables;
	}

	public void setExamSubjectStudentCompositTables(
			Set<ExamSubjectStudentCompositTable> examSubjectStudentCompositTables) {
		this.examSubjectStudentCompositTables = examSubjectStudentCompositTables;
	}

}
