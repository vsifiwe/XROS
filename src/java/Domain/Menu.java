/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.util.Objects;
import javax.persistence.Column;
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

public class Menu {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long menu_id;
    @Column(name="menu_name")
    private String menu_name;
    private Double menu_price;
    private String description;

    public Menu() {
    }

    public Menu(Long menu_id, String menu_name, Double menu_price, String description) {
        this.menu_id = menu_id;
        this.menu_name = menu_name;
        this.menu_price = menu_price;
        this.description = description;
    }

    public Long getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(Long menu_id) {
        this.menu_id = menu_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public Double getMenu_price() {
        return menu_price;
    }

    public void setMenu_price(Double menu_price) {
        this.menu_price = menu_price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.menu_id);
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
        final Menu other = (Menu) obj;
        if (!Objects.equals(this.menu_id, other.menu_id)) {
            return false;
        }
        return true;
    }


    
    
}
