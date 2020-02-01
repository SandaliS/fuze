/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.unieventbean;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saroj
 */
@WebServlet(name = "user_uni_event_cal", urlPatterns = {"/user_uni_event_cal"})
public class user_uni_event_cal extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {

            
            List progs = new ArrayList();
            
              ResultSet rs = DB.search("SELECT `eid`, `title`, `calstart`, `calend` FROM `uni_event`");
            
            while (rs.next()) {
                unieventbean pb = new unieventbean();
                
                pb.setId(Integer.parseInt(rs.getString(1)));
                pb.setStart(rs.getString(3));
                pb.setEnd(rs.getString(4));
                pb.setTitle(rs.getString(2));
                
                progs.add(pb);
                
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.write(new Gson().toJson(progs));
            
           
            
        
        } catch (Exception ex) {
            Logger.getLogger(unical.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
  

}
