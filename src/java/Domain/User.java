/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

/**
 *
 * @author X
 */

@Entity

public class User {

    private String name;
    @Id
    private String email;
    private String hashed_password;
    private boolean merchant;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "ORDERX", joinColumns = {
        @JoinColumn(name = "email")}, inverseJoinColumns = @JoinColumn(name = "menu_id"))
    private List<Menu> ordered_items = new ArrayList<>();

    public User() {
    }

    public User(String name, String email, String hashed_password, boolean merchant) {
        this.name = name;
        this.email = email;
        this.hashed_password = hashed_password;
        this.merchant = merchant;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHashed_password() {
        return hashed_password;
    }

    public void setHashed_password(String hashed_password) {
        this.hashed_password = hashed_password;
    }

    public boolean isMerchant() {
        return merchant;
    }

    public void setMerchant(boolean merchant) {
        this.merchant = merchant;
    }

    public List<Menu> getMenu_items() {
        return ordered_items;
    }

    public void setMenu_items(List<Menu> ordered_items) {
        this.ordered_items = ordered_items;
    }
    
    public void addMenuItem(Menu menu){
        ordered_items.add(menu);
    }
    
    public void removeMenuItem(Menu menu){
        ordered_items.remove(menu);
    }
    
    public boolean isExisting(String menu_id){
        for (Menu m : ordered_items) {
            if(m.getMenu_id().equals(Long.parseLong(menu_id)))
                return true;
        }
        return false;
    }
    
    public String totalPayment() {
        double total = 0.0;
        for (Menu m : ordered_items) {
            total += m.getMenu_price();
        }
        DecimalFormat formatter = new DecimalFormat("###,###,###.##  RWF");
        return formatter.format(total);
    }

}
