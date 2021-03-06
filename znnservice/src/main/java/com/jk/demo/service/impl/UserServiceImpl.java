package com.jk.demo.service.impl;



import com.jk.demo.dao.UserDao;
import com.jk.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public List queryList() {
        return userDao.queryList();
    }
}
