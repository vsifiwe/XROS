/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.Menu;
import Domain.Restaurant;
import Domain.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author X
 */
public class misc {
    public static void main(String[] args) {
//        GenericDao<User> udao = new GenericDao<>(User.class);
//        GenericDao<Menu> mdao = new GenericDao<>(Menu.class);
//        User user = udao.findbyID("kingazsnee@gmail.com");
//        Menu a = mdao.findbyID(Long.parseLong("1"));
//        Menu b = mdao.findbyID(Long.parseLong("2"));
//        
//        List<Menu> ordered_items = new ArrayList();
//        
//        user.addMenuItem(a);
//        user.addMenuItem(b);
//        
//        System.out.println(user.isExisting("1"));
//        System.out.println(user.isExisting("2"));
//        System.out.println(user.isExisting("3"));
        
            GenericDao<Menu> mdao = new GenericDao<>(Menu.class);
            Menu m = mdao.findMenuByName("French Fries");
            Restaurant r = new GenericDao<>(Restaurant.class).findRestaurantByName("test");
            
            System.out.println(m.getDescription());
            System.out.println(r.getOwner_name());
        
        
        
        
        
        
    }
}
