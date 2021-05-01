/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.User;

/**
 *
 * @author X
 */
public class TestLogin {
    
    public static void main(String[] args) {
        GenericDao<User> dao = new GenericDao<>(User.class);
        User user;
        
        try {
            user = dao.findbyID("asifiwemanzi@gmail.com");
            System.out.println(user.getName());
        } catch(Exception e) {
            System.out.println("There is no user with that username");
        };
        
        
    }
    
    
}
