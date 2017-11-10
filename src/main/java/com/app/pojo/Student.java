package com.app.pojo;
// Generated 18 Sep, 2017 4:17:49 PM by Hibernate Tools 5.2.3.Final

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Student generated by hbm2java
 */
@Entity
@Table(name = "student", catalog = "tutesmessanger")
public class Student implements java.io.Serializable {

	private int id;
	private transient Institute institute;
	private transient Login login;
	private transient Parent parent;
	private String fname;
	private String lname;
	private String contactno;
	private String email;
	private String father;

	public Student() {
	}

	public Student(int id, String father) {
		this.id = id;
		this.father = father;
	}

	public Student(int id, Institute institute, Login login, Parent parent, String fname, String lname,
			String contactno, String email, String father) {
		this.id = id;
		this.institute = institute;
		this.login = login;
		this.parent = parent;
		this.fname = fname;
		this.lname = lname;
		this.contactno = contactno;
		this.email = email;
		this.father = father;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "instid")
	public Institute getInstitute() {
		return this.institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "loginid")
	public Login getLogin() {
		return this.login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentid")
	public Parent getParent() {
		return this.parent;
	}

	public void setParent(Parent parent) {
		this.parent = parent;
	}

	@Column(name = "fName")
	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "lName")
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Column(name = "contactno", length = 20)
	public String getContactno() {
		return this.contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "father", nullable = false, length = 50)
	public String getFather() {
		return this.father;
	}

	public void setFather(String father) {
		this.father = father;
	}

}
