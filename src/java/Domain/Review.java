/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author X
 */

@Entity

public class Review {
    @ManyToOne
    @JoinColumn(name="restaurant_id")
    private Restaurant restaurant;
    @ManyToOne
    @JoinColumn(name="uid")
    private User user;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long review_id;
    private String review_content;

    public Review() {
    }

    public Review(Restaurant restaurant, User user, Long review_id, String review_content) {
        this.restaurant = restaurant;
        this.user = user;
        this.review_id = review_id;
        this.review_content = review_content;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public Long getReview_id() {
        return review_id;
    }

    public void setReview_id(Long review_id) {
        this.review_id = review_id;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + Objects.hashCode(this.review_id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Review other = (Review) obj;
        if (!Objects.equals(this.review_id, other.review_id)) {
            return false;
        }
        return true;
    }
    
    
}
