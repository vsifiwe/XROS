/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.Restaurant;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import Utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 *
 * @author mazinad
 */
public class GenericDao<X> {

    private Class<X> type;

    public GenericDao(Class<X> type) {
        this.type = type;
    }

    public void create(X obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(obj);
        session.getTransaction().commit();
        session.close();
    }

    public void update(X obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(obj);
        session.getTransaction().commit();
        session.close();
    }

    public void delete(X obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(obj);
        session.getTransaction().commit();
        session.close();
    }

    public List<X> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria cr = session.createCriteria(type);
        List<X> list = cr.list();
        return list;
    }

    public List<Restaurant> findAllRestaurants() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = s.beginTransaction();
        List<Restaurant> li = s.createQuery("from Restaurant").list();
        s.close();
        return li;
    }

    public X findbyID(Serializable id) {
        Session ss = HibernateUtil.getSessionFactory().openSession();
        X x = (X) ss.get(type, id);
        ss.close();
        return x;
    }

    public X findMenuByName(String name) {
        Session ss = HibernateUtil.getSessionFactory().openSession();
        String hql = "FROM Menu M WHERE M.menu_name = '"+name+"'";
        Query query = ss.createQuery(hql);
        X x =(X) query.uniqueResult();
        ss.close();
        return x;
    }
    
    public X findRestaurantByName(String name) {
        Session ss = HibernateUtil.getSessionFactory().openSession();
        String hql = "FROM Restaurant R WHERE R.restaurant_name = '"+name+"'";
        Query query = ss.createQuery(hql);
        X x =(X) query.uniqueResult();
        ss.close();
        return x;
    }

}
