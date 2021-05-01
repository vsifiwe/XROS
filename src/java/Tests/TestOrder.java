/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.Menu;
import Domain.User;

/**
 *
 * @author X
 */
public class TestOrder {
    public static void main(String[] args) {
        GenericDao<User> dao = new GenericDao<>(User.class);
        User a =  dao.findbyID(Long.parseLong("1"));
        
        Menu aa = new Menu();
        aa.setMenu_id(Long.parseLong("1"));
        Menu ab = new Menu();
        ab.setMenu_id(Long.parseLong("2"));
        
        a.addMenuItem(ab);
        a.addMenuItem(aa);
        
        dao.update(a);
    }
}
