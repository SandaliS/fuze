/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.unieventbean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "editcompide", urlPatterns = {"/editcompide"})
public class editcompide extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();
            List<unieventbean> pd = progectdetails(name,request);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("editcompidea.jsp");
            r.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(edituniidea.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            unieventbean ueb = new unieventbean();
            ueb.setTitle(request.getParameter("title"));
            ueb.setType(request.getParameter("type"));
            ueb.setCnum(request.getParameter("cnum"));
            ueb.setLocation(request.getParameter("location"));
            ueb.setAddress(request.getParameter("address"));
            ueb.setStartdate(request.getParameter("startdate"));
            ueb.setStarttime(request.getParameter("starttime"));
            ueb.setEnddate(request.getParameter("enddate"));
            ueb.setEndtime(request.getParameter("endtime"));
            ueb.setDesc(request.getParameter("desc"));
            ueb.setUniid(request.getParameter("uniid"));
            ueb.setEid(request.getParameter("eveid"));
            
            String title = ueb.getTitle();
            String etype = ueb.getType();
            String cnum = ueb.getCnum();
            String location = ueb.getLocation();
            String address = ueb.getAddress();
            String startdate = ueb.getStartdate();
            String starttime = ueb.getStarttime();
            String enddate = ueb.getEnddate();
            String endtime = ueb.getEndtime();
            String desc = ueb.getDesc();
            String calstart = ueb.getcalstart();
            String calend = ueb.getcalend();
            
            String eid = ueb.getEid();
            
            DB.iud("UPDATE `comp_event` SET `title`='"+title+"',`type`='"+etype+"',`cnum`='"+cnum+"',`location`='"+location+"',`address`='"+address+"',"
                    + "`startdate`='"+startdate+"',`starttime`='"+starttime+"',`enddate`='"+enddate+"',`endtime`='"+endtime+"',`description`='"+desc+"',"
                    + "`calstart`='"+calstart+"',`calend`='"+calend+"' WHERE `eid` ='"+eid+"'");
        } catch (Exception ex) {
            PrintWriter writer = response.getWriter();
            writer.print(ex);
            writer.print(request.getParameter("eveid"));
        }
        
     
        
    }
    
    public List<unieventbean> progectdetails(String name,HttpServletRequest request) throws Exception {
        String id = "";
        ResultSet search = DB.search("SELECT `cid` FROM `company` WHERE `uname` ='" + name + "'");
        if (search.next()) {
            id = search.getString(1);
        }
        
        ArrayList<unieventbean> progs = new ArrayList<unieventbean>();
        ResultSet rs = DB.search("SELECT * FROM `comp_event`,`company` WHERE `company`.`cid` = comp_event.uid AND `comp_event`.`uid` = '" + id + "' AND comp_event.eid = '"+request.getParameter("evid")+"'");
        while (rs.next()) {
            unieventbean pb = new unieventbean();
            pb.setEid(rs.getString(1));
            pb.setTitle(rs.getString(2));
            pb.setType(rs.getString(3));
            pb.setCnum(rs.getString(4));
            pb.setLocation(rs.getString(5));
            pb.setAddress(rs.getString(6));
            pb.setStartdate(rs.getString(7));
            pb.setStarttime(rs.getString(8));
            pb.setEnddate(rs.getString(9));
            pb.setEndtime(rs.getString(10));
            pb.setDesc(rs.getString(11));
            pb.setSavepath(rs.getString(14));
            pb.setUniid(rs.getString(15));
            
            progs.add(pb);
            
        }
        
        return progs;
    }
    

}
