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


@WebServlet(name = "comp_event_controller", urlPatterns = {"/comp_event_controller"})
public class comp_event_controller extends HttpServlet {

   String id = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int idd = 0;
            String uid = "";

            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();

            ResultSet search = DB.search("SELECT `cid`FROM `company` WHERE `uname` = '"+name+"'");
            if (search.next()) {
                uid = search.getString(1);
            }
            ResultSet rss = DB.search("SELECT COUNT(`eid`) FROM `comp_event`");
            if (rss.next()) {
                idd = Integer.parseInt(rss.getString(1))+1;
            }
            id = "" + idd;

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
            ueb.setUniid(uid);
            ueb.setEid(id);

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
            String uniid = ueb.getUniid();
            String eid = ueb.getEid();

            String query = "INSERT INTO `comp_event`(`eid`, `title`, `type`, `cnum`, `location`, `address`, `startdate`, `starttime`, `enddate`, `endtime`, `description`, `calstart`, `calend`, `uid`)"
                    + " VALUES ('" + eid + "','" + title + "','" + etype + "','" + cnum + "','" + location + "','" + address + "','" + startdate + "','" + starttime + "','" + enddate + "','" + endtime + "','" + desc + "','" + calstart + "','" + calend + "','" + uniid + "')";
            DB.iud(query);
            doGet(request, response);
        } catch (Exception ex) {
            Logger.getLogger(unievent_controller.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<unieventbean> pd = progectdetails(id);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("company_add_event_step_2.jsp");
            r.forward(request, response);
           
        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<unieventbean> progectdetails(String id) throws Exception {
        ArrayList<unieventbean> progs = new ArrayList<unieventbean>();

        ResultSet rs = DB.search("SELECT * FROM `comp_event` WHERE `eid` = '" + id + "'");
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
            pb.setUniid(rs.getString(15));

            progs.add(pb);

        }

        return progs;
    }


   
   

}
