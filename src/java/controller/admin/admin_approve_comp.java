/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import controller.DB;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saroj
 */
@WebServlet(name = "admin_approve_comp", urlPatterns = {"/admin_approve_comp"})
public class admin_approve_comp extends HttpServlet {

 
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String uniid = request.getParameter("comid");
            DB.iud("UPDATE `company` SET `approved`='1' WHERE `cid` = '" + uniid + "'");
            response.sendRedirect("admin/admin_approve_uni.jsp");
        } catch (Exception ex) {
            Logger.getLogger(admin_approve_uni.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


  
    
}
