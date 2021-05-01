/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.User;
import org.testng.annotations.Test;

/**
 *
 * @author X
 */
@Test
public class TestUsers {
    public static void main(String[] args) {
        GenericDao dao = new GenericDao<User>(User.class);
        User a = new User();
        a.setEmail("asifiwemanzi@gmail.com");
        a.setHashed_password("pass1234");
        a.setName("Manzi Asifiwe");
        
        User b = new User();
        b.setEmail("haha@gmail.com");
        b.setHashed_password("ahah");
        b.setName("Yego Yego");
        
        User c = new User();
        c.setEmail("olala@gmail.com");
        c.setHashed_password("aloalo");
        c.setName("Oya Oya");
        
        dao.create(a);
        dao.create(b);
        dao.create(c);
        
//        dao.delete(a);
//        dao.delete(b);
//        dao.delete(c);
    }
}
