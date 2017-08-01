package com.app.pojo;
// Generated 1 Aug, 2017 4:07:53 PM by Hibernate Tools 5.2.3.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Branch generated by hbm2java
 */
@Entity
@Table(name = "branch", catalog = "tutesmessanger")
public class Branch implements java.io.Serializable {

	private int id;
	private Institute institute;
	private String name;
	private Set<Classes> classeses = new HashSet<Classes>(0);

	public Branch() {
	}

	public Branch(int id) {
		this.id = id;
	}

	public Branch(int id, Institute institute, String name, Set<Classes> classeses) {
		this.id = id;
		this.institute = institute;
		this.name = name;
		this.classeses = classeses;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "instituteid")
	public Institute getInstitute() {
		return this.institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	@Column(name = "Name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
	public Set<Classes> getClasseses() {
		return this.classeses;
	}

	public void setClasseses(Set<Classes> classeses) {
		this.classeses = classeses;
	}

}