package com.jk.demo.dao.Impl;


import com.jk.demo.dao.UserDao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class  UserDaoImpl implements UserDao {

@Autowired
private SessionFactory sessionFactory;

    @Override
    public List queryList() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }
}
