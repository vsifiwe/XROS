/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.Menu;
import Domain.Restaurant;

/**
 *
 * @author X
 */
public class TestRestaurant {
    public static void main(String[] args) {
        GenericDao<Restaurant> dao = new GenericDao<>(Restaurant.class);
        
//        Restaurant a = new Restaurant();
//        a.setDescription("The greatest Restaurant on Earth. Order from Us and enjoy the best food");
//        a.setRestaurant_name("Kwa Munyarwanda");

        Restaurant a = dao.findbyID(Long.parseLong("1"));
        
        Menu aa = new Menu();
        aa.setMenu_name("Pizza Burger");
        aa.setMenu_price(12000.0);
        aa.setDescription("Made with Love and Care like never seen before");

//        Menu ab = new Menu();
//        ab.setMenu_name("Burger");
//        ab.setMenu_price(18000.0);
//        ab.setDescription("Iyi ni burger yo ku rwego rwo hejuru byakataraboneka. Ifite inyama ebyiri na foromaje ngaho yisabe ubundi wumve uburyohe");
//        
//        Menu ac = new Menu();
//        ac.setMenu_name("Pizza Oregano");
//        ac.setMenu_price(18000.0);
//        ac.setDescription("Pizza oregano made with Oregano, Spices, cheese, pineapple, barbecue, chicken, ham, bacon, and all the love in the world");
//        
//        a.registerMenuItem(aa);
//        a.registerMenuItem(ab);
        a.registerMenuItem(aa);
        
        dao.update(a);
    }
}
