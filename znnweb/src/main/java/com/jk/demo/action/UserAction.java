package com.jk.demo.action;


import com.jk.demo.service.UserService;
import org.apache.struts2.convention.annotation.*;
import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.json.Json;
import java.util.List;



/*@ParentPackage("struts-default")*/
@Controller
@Action(value = "UserAction",results = {
        @Result(name = "show",location = "/show.jsp")
})
public class UserAction /*extends  BaseAction*/{

    @Autowired
    private UserService userService;

    private  Integer userid;

    private List list;


    public  String toShow(){

       /*System.out.println("id的值为"+userid);*/
        //注意这里的list
        list= userService.queryList();
       /* System.out.println(list+"===============");
        super.writeJson(list);*/
       return "show";
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public List getList() {
        return list;
    }
    public void setList(List list) {
        this.list = list;
    }
}
