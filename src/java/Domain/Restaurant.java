/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

/**
 *
 * @author X
 */
@Entity
public class Restaurant {

    private String restaurant_name;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long restaurant_id;
    private String owner_name;
    private String description;
    private String picture;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "MENU_ITEMS", joinColumns = {
        @JoinColumn(name = "restaurant_id")}, inverseJoinColumns = @JoinColumn(name = "menu_id"))
    List<Menu> menu_items = new ArrayList();

    public Restaurant() {
    }

    public Restaurant(String restaurant_name, Long restaurant_id, String owner_name, String description, String picture) {
        this.restaurant_name = restaurant_name;
        this.restaurant_id = restaurant_id;
        this.owner_name = owner_name;
        this.description = description;
        this.picture = picture;
    }

    public String getRestaurant_name() {
        return restaurant_name;
    }

    public void setRestaurant_name(String restaurant_name) {
        this.restaurant_name = restaurant_name;
    }

    public Long getRestaurant_id() {
        return restaurant_id;
    }

    public void setRestaurant_id(Long restaurant_id) {
        this.restaurant_id = restaurant_id;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public List<Menu> getMenu_items() {
        return menu_items;
    }

    public void setMenu_items(List<Menu> menu_items) {
        this.menu_items = menu_items;
    }

    public boolean isExisting(String code) {
        for (Menu m : menu_items) {
            if (m.getMenu_id().equals(code)) {
                return true;
            }
        }
        return false;
    }

    public void registerMenuItem(Menu m) {
        menu_items.add(m);
    }

    public void removeMenuItem(Menu m) {
        menu_items.remove(m);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + Objects.hashCode(this.restaurant_id);
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
        final Restaurant other = (Restaurant) obj;
        if (!Objects.equals(this.restaurant_id, other.restaurant_id)) {
            return false;
        }
        return true;
    }

}
