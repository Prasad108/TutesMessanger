package com.app.pojo;
// Generated 18 Sep, 2017 4:17:49 PM by Hibernate Tools 5.2.3.Final

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
import javax.persistence.UniqueConstraint;

/**
 * Login generated by hbm2java
 */
@Entity
@Table(name = "login", catalog = "tutesmessanger", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class Login implements java.io.Serializable {

	private Integer id;
	private transient Role role;
	private String username;
	private String password;
	private boolean enableMaster;
	private boolean enableInstitute;
	private transient Set<Teacher> teachers = new HashSet<Teacher>(0);
	private transient Set<Student> students = new HashSet<Student>(0);

	
	@Override
	public String toString() {
		return "Login [id=" + id + ", username=" + username + ", password=" + password + ", enableMaster="
				+ enableMaster + ", enableInstitute=" + enableInstitute + "]";
	}

	public Login() {
	}

	public Login(String username, String password, boolean enableMaster, boolean enableInstitute) {
		this.username = username;
		this.password = password;
		this.enableMaster = enableMaster;
		this.enableInstitute = enableInstitute;
	}

	public Login(Role role, String username, String password, boolean enableMaster, boolean enableInstitute,
			Set<Teacher> teachers, Set<Student> students) {
		this.role = role;
		this.username = username;
		this.password = password;
		this.enableMaster = enableMaster;
		this.enableInstitute = enableInstitute;
		this.teachers = teachers;
		this.students = students;
	}
	
	

	public Login(Role role, String username, String password) {
		super();
		this.role = role;
		this.username = username;
		this.password = password;
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
	@JoinColumn(name = "role")
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "username", unique = true, nullable = false, length = 30)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 30)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "enable_Master", nullable = false)
	public boolean isEnableMaster() {
		return this.enableMaster;
	}

	public void setEnableMaster(boolean enableMaster) {
		this.enableMaster = enableMaster;
	}

	@Column(name = "enable_Institute", nullable = false)
	public boolean isEnableInstitute() {
		return this.enableInstitute;
	}

	public void setEnableInstitute(boolean enableInstitute) {
		this.enableInstitute = enableInstitute;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "login")
	public Set<Teacher> getTeachers() {
		return this.teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "login")
	public Set<Student> getStudents() {
		return this.students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

}
