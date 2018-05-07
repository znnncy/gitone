package com.jk.demo.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="user")
public class User {

    @Id
    @Column(name="userid")
    @GeneratedValue(strategy =GenerationType.AUTO )
    private  Integer userid ;
    @Column(name="username")
    private String username;
    @Column(name="userage")
    private Integer userage;
    @Column(name="usersex")
    private Integer usersex;
    @Column(name="useraddr")
    private String useraddr;
    @Column(name="userhobby")
    private String userhobby;
    @Column(name="userbirthday")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date userbirthday;
    @Column(name="userinfo")
    private String userinfo;
    @Column(name="userphoto")
    private String userphoto;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getUserage() {
        return userage;
    }

    public void setUserage(Integer userage) {
        this.userage = userage;
    }

    public Integer getUsersex() {
        return usersex;
    }

    public void setUsersex(Integer usersex) {
        this.usersex = usersex;
    }

    public String getUseraddr() {
        return useraddr;
    }

    public void setUseraddr(String useraddr) {
        this.useraddr = useraddr;
    }

    public String getUserhobby() {
        return userhobby;
    }

    public void setUserhobby(String userhobby) {
        this.userhobby = userhobby;
    }

    public Date getUserbirthday() {
        return userbirthday;
    }

    public void setUserbirthday(Date userbirthday) {
        this.userbirthday = userbirthday;
    }

    public String getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(String userinfo) {
        this.userinfo = userinfo;
    }

    public String getUserphoto() {
        return userphoto;
    }

    public void setUserphoto(String userphoto) {
        this.userphoto = userphoto;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userage=" + userage +
                ", usersex=" + usersex +
                ", useraddr='" + useraddr + '\'' +
                ", userhobby='" + userhobby + '\'' +
                ", userbirthday=" + userbirthday +
                ", userinfo='" + userinfo + '\'' +
                ", userphoto='" + userphoto + '\'' +
                '}';
    }
}
