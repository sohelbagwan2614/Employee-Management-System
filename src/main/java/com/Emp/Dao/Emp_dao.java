package com.Emp.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.Emp.entities.Emp;

@Component
public class Emp_dao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public Emp_dao(HibernateTemplate hibernateTemplate) {
		super();
		this.hibernateTemplate = hibernateTemplate;
	}

	public Emp_dao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//adding emp
	@Transactional
	public void add_emp(Emp p) {
		this.hibernateTemplate.save(p);
	}
	
	//getting single 
	
	public Emp select_single(int id) {
		Emp e = this.hibernateTemplate.load(Emp.class,id);
		return e;
	}
	
	//deleting 
	@Transactional
	public void delete( int id) {
		Emp load = this.hibernateTemplate.load(Emp.class,id);
		this.hibernateTemplate.delete(load);
	}
	
	
	//selecting all records
	
	public List<Emp> selectall(){
		List<Emp> list= this.hibernateTemplate.loadAll(Emp.class);
		return list;
	}
	
	@Transactional
	public void update(Emp emp) {
		hibernateTemplate.update(emp);

	}

}
