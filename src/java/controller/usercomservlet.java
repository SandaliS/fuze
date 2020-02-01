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
@WebServlet(name = "usercomservlet", urlPatterns = {"/usercomservlet"})
public class usercomservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();
            List<unieventbean> pd = progectdetails(name, request);
            request.setAttribute("progects", pd);
            RequestDispatcher r = request.getRequestDispatcher("user_add_uni_event_comment.jsp");
            r.forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(listidea.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String name = session.getAttribute("name").toString();
            String cid = "";
            String uid = "";

            ResultSet searchui = DB.search("SELECT `id` FROM `user` WHERE `un` = '" + name + "'");
            if (searchui.next()) {
                uid = searchui.getString(1);
                
            }

            ResultSet search = DB.search("SELECT COUNT(`com_id`) FROM `user_uni_event_comment`");
            if (search.next()) {
                cid = search.getString(1) + 1;

            }
            DB.iud("INSERT INTO `user_uni_event_comment`(`com_id`, `uid`, `uni_id`, `eid`, `comment`) VALUES ('" + cid + "','"+uid+"',"
                    + "'"+request.getParameter("uniid")+"','"+request.getParameter("eid")+"','"+request.getParameter("comment")+"')");

        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print(ex);
        }

    }

    public List<unieventbean> progectdetails(String name, HttpServletRequest request) throws Exception {

        ArrayList<unieventbean> progs = new ArrayList<unieventbean>();
        ResultSet rs = DB.search("SELECT * FROM `uni_event` WHERE `eid` ='" + request.getParameter("evid") + "'");
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
