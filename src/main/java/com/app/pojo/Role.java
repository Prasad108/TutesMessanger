package com.app.pojo;
// Generated 21 Dec, 2017 11:23:34 AM by Hibernate Tools 5.2.3.Final

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
 * Role generated by hbm2java
 */
@Entity
@Table(name = "role", catalog = "tutesmessanger")
public class Role implements java.io.Serializable {

	private Integer id;
	private String name;
	private transient Set<Login> logins = new HashSet<Login>(0);
	private transient Set<Message> messages = new HashSet<Message>(0);
	private transient Set<Login> logins_1 = new HashSet<Login>(0);

	public Role() {
	}
	
	public Role(String name) {
		this.name = name;
	}

	

	public Role(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Role(String name, Set<Login> logins, Set<Message> messages, Set<Login> logins_1) {
		this.name = name;
		this.logins = logins;
		this.messages = messages;
		this.logins_1 = logins_1;
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

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<Login> getLogins() {
		return this.logins;
	}

	public void setLogins(Set<Login> logins) {
		this.logins = logins;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<Login> getLogins_1() {
		return this.logins_1;
	}

	public void setLogins_1(Set<Login> logins_1) {
		this.logins_1 = logins_1;
	}

}
