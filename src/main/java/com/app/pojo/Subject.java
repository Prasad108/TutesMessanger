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
 * Subject generated by hbm2java
 */
@Entity
@Table(name = "subject", catalog = "tutesmessanger")
public class Subject implements java.io.Serializable {

	private Integer id;
	private transient Institute institute;
	private String name;
	private String discription;
	
	private transient Set<SubjectDivComposit> subjectDivComposits = new HashSet<SubjectDivComposit>(0);

	public Subject() {
	}

	public Subject(Institute institute, String name, String discription,
			
			Set<SubjectDivComposit> subjectDivComposits) {
		this.institute = institute;
		this.name = name;
		this.discription = discription;
		
		this.subjectDivComposits = subjectDivComposits;
	}
	
	public Subject(Institute institute, String name, String discription){
		this.institute = institute;
		this.name = name;
		this.discription = discription;
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
	@JoinColumn(name = "institute_id")
	public Institute getInstitute() {
		return this.institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "discription", length = 500)
	public String getDiscription() {
		return this.discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	

	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	public Set<SubjectDivComposit> getSubjectDivComposits() {
		return this.subjectDivComposits;
	}

	public void setSubjectDivComposits(Set<SubjectDivComposit> subjectDivComposits) {
		this.subjectDivComposits = subjectDivComposits;
	}

}
