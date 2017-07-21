package com.app.pojo;
// Generated 21 Jul, 2017 11:53:29 AM by Hibernate Tools 5.2.3.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Parent generated by hbm2java
 */
@Entity
@Table(name = "parent", catalog = "tutesmessanger")
public class Parent implements java.io.Serializable {

	private Integer id;
	private String fname;
	private String lname;
	private String contactno;
	private String email;
	private Set<Student> students = new HashSet<Student>(0);

	public Parent() {
	}

	public Parent(String fname, String lname, String contactno) {
		this.fname = fname;
		this.lname = lname;
		this.contactno = contactno;
	}

	public Parent(String fname, String lname, String contactno, String email, Set<Student> students) {
		this.fname = fname;
		this.lname = lname;
		this.contactno = contactno;
		this.email = email;
		this.students = students;
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

	@Column(name = "fname", nullable = false, length = 50)
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "lname", nullable = false, length = 50)
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Column(name = "contactno", nullable = false, length = 12)
	public String getContactno() {
		return this.contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<Student> getStudents() {
		return this.students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

}
