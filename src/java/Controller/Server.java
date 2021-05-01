/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.Menu;
import Domain.Restaurant;
import Domain.Review;
import Domain.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author X
 */
@WebServlet(urlPatterns = {"/x/login", "/x/register", "/x/logout", "/x/createrestaurant", "/x/addmenuitem", "/x/removemenuitem", "/x/placeorder" ,"/x/addmenu", "/x/removemenu", "/x/review"})
public class Server extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        System.out.println(path);
        switch (path) {
            case "/x/login":
                login(request, response);
                break;
            case "/x/register":
                register(request, response);
                break;
            case "/x/logout":
                logout(request, response);
                break;
            case "/x/createrestaurant":
                createRestaurant(request,response);
                break;
            case "/x/addmenuitem":
                addMenuItem(request,response);
                break;
            case "/x/removemenuitem":
                removeMenuItem(request,response);
                break;
            case "/x/placeorder":
                placeOrder(request, response);
                break;
            case "/x/addmenu":
                addMenu(request, response);
                break;
            case "/x/review":
                review(request,response);
                break;
        }

    }

    public void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispt = request.getRequestDispatcher("/orderscreen.jsp");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        User user;
        GenericDao<User> dao = new GenericDao<>(User.class);

        try {
            user = dao.findbyID(email);
            if (user.getHashed_password().equals(password)) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("../orderscreen.jsp"); 
            } else {
                response.sendRedirect("../error.jsp");
            }
        } catch (Exception e) {
            
            response.sendRedirect("../error.jsp");
        }

    }

    public void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispt = request.getRequestDispatcher("/orderscreen.jsp");
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Boolean merchant = false;
        if(request.getParameter("merchant").equals("on"))
            merchant = true;

        User user = new User(name, email, password, merchant);
        GenericDao<User> dao = new GenericDao<>(User.class);

        try {
            if (name != null && email!= null & password != null)
            {
            dao.create(user);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("../orderscreen.jsp");
            }
            
            else {
                response.sendRedirect("/error.jsp");
            }
            
        } catch (Exception e) {
            dispt = request.getRequestDispatcher("/error.jsp");
            dispt.forward(request, response);
            System.out.println(e);
        }
        
    }

    public void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispt = request.getRequestDispatcher("/index.html");
        request.getSession().setAttribute("user", null);
        response.sendRedirect("../index.html");
    }
    
    public void createRestaurant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispt = request.getRequestDispatcher("/index.html");
        
        String rname = request.getParameter("rname");
        String oname = request.getParameter("oname");
        String description = request.getParameter("description");
        String picture = request.getParameter("picture");
        
        try {
            Restaurant r = new Restaurant();
            GenericDao<Restaurant> dao = new GenericDao<>(Restaurant.class);
            r.setDescription(description);
            r.setOwner_name(oname);
            r.setRestaurant_name(rname);
            r.setPicture(picture);
            dao.create(r);
            response.sendRedirect("../addMenu.jsp");
        }
        catch (Exception e) {
            dispt = request.getRequestDispatcher("/error.jsp");
            dispt.forward(request, response);
        }
        
        
    }
    
    public void addMenuItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu_id = request.getParameter("mid");
        String restaurant_id = request.getParameter("rid");
        User user = (User) request.getSession().getAttribute("user");
        if (user==null) {
            response.sendRedirect("../error");
        }
        
        GenericDao<Menu> cdao = new GenericDao<>(Menu.class);
        Menu menu = cdao.findbyID(Long.parseLong(menu_id));
        user.addMenuItem(menu);
        String redirection = "../viewMenu.jsp?id="+restaurant_id;
        request.getSession().setAttribute("user", user);
        response.sendRedirect(redirection);
    }
    
    public void removeMenuItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu_id = request.getParameter("mid");
        String restaurant_id = request.getParameter("rid");
        User user = (User) request.getSession().getAttribute("user");
        if (user==null) {
            response.sendRedirect("../error.jsp");
        }
        
        GenericDao<Menu> cdao = new GenericDao<>(Menu.class);
        Menu menu = cdao.findbyID(Long.parseLong(menu_id));
        user.removeMenuItem(menu);
        String redirection = "../viewMenu.jsp?id="+restaurant_id;
        request.getSession().setAttribute("user", user);
        response.sendRedirect(redirection);
    }
    
    public void placeOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user =(User) request.getSession().getAttribute("user");
        GenericDao<User> udao = new GenericDao<>(User.class);
        
        if (user == null) {
            response.sendRedirect("../error.jsp");
        } else {
            udao.update(user);
            List<Menu> menu = new ArrayList();
            user.setMenu_items(menu);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("../success.jsp");
        }
    }
    
    public void addMenu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String restaurant = request.getParameter("restaurant");
        String menu = request.getParameter("menu");
        
        try{
        GenericDao mdao = new GenericDao<>(Menu.class);
        GenericDao rdao = new GenericDao<>(Restaurant.class);
        Menu m =(Menu) mdao.findMenuByName(menu);
        Restaurant r =(Restaurant) rdao.findRestaurantByName(restaurant);
        
        r.registerMenuItem(m);
        rdao.update(r);
        response.sendRedirect("../addMenu.jsp");
        
        } catch (Exception e) {
            response.sendRedirect("../error.jsp");
        }
    }
    
    public void review(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rname = request.getParameter("restaurant");
        User user =(User) request.getSession().getAttribute("user");
        String content = request.getParameter("review");
        GenericDao rdao = new GenericDao<>(Review.class);
        try{
            Restaurant restaurant = new GenericDao<>(Restaurant.class).findRestaurantByName(rname);
            Review review = new Review();
            review.setRestaurant(restaurant);
            review.setUser(user);
            review.setReview_content(content);
            rdao.create(review);
            response.sendRedirect("../orderscreen.jsp");
        } catch(Exception e){
            response.sendRedirect("../error.jsp");
        }
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
