/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tests;

import Controller.GenericDao;
import Domain.Restaurant;
import Domain.Review;
import Domain.User;

/**
 *
 * @author X
 */
public class TestReview {
    public static void main(String[] args) {
        GenericDao<Review> rdao = new GenericDao<>(Review.class);
        GenericDao<User> udao = new GenericDao<>(User.class);
        GenericDao<Restaurant> redao = new GenericDao<>(Restaurant.class);
        
        String rname = "Meze Fresh";
        User user = udao.findbyID("asifiwemanzi@gmail.com");
        String content = "The best food ever.";
        try{
            Restaurant restaurant = new GenericDao<>(Restaurant.class).findRestaurantByName(rname);
            Review review = new Review();
            review.setRestaurant(restaurant);
            review.setUser(user);
            review.setReview_content(content);
            rdao.create(review);
        } catch(Exception e){
            System.out.println(e);
        }
        
        
    }
}
