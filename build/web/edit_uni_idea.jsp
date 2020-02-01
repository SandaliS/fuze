<%-- 
    Document   : edit_uni_idea
    Created on : Jul 10, 2018, 9:21:05 AM
    Author     : Saroj
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page import="beans.unieventbean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <jsp:include page="Uni_header.jsp" />
    </head>
    <body data-spy="scroll" data-target="nav">
        <header id="header-2" class="soft-scroll header-2" wp-cz-section="blocks_header_2" wp-cz-section-title="Header 2">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1>Konnect</h1>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav navbar-right" wp-nav-menu="primary" wp-nav-menu-depth="2" wp-nav-menu-type="bootstrap">
                            <li class="nav-item active">
                                <a href="index4.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="uni_add_event_step1.jsp">Create an event</a>
                            </li>
                            <li class="nav-item">
                                <a href="viewuniidea">view My event</a>
                            </li>
                            <li class="nav-item">
                                <a href="#">View other events</a>
                            </li>
                            
                            <li class="nav-item">
                                <a href="unilogout">logout</a>
                            </li>                            
                        </ul>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>
        <br><br>
        <section class="content-block team-1 team-1-1" wp-cz-section="blocks_team_1_1" wp-cz-section-title="Team 1-1" wp-cz-control="blocks_team_1_1_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_team_1_1">
            <div class="container">
                <div class="underlined-title">
                    <h1 wp-cz-control="blocks_team_1_1_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_team_1_1" wp-cz-theme-mod="blocks_team_1_1_title" wp-cz-control-type="textarea">My Events</h1>
                    <hr>
                </div>
                <div class="row">
                    <% String id = "";%>
                    <% String eeid = "";%>
                    <% String title = "";%>
                    <% String type = "";%>
                    <% String address = "";%>
                    <% String stdate = "";%>
                    <% String sttime = "";%>
                    <% String endd = "";%>
                    <% String endt = "";%>
                    <% String descr = "";%>
                    <% String cnum = "";%>
                    <% String loca = "";%>

                    <%
                        ArrayList<unieventbean> posts = (ArrayList<unieventbean>) request.getAttribute("progects");
                        for (unieventbean post : posts) {
                    %>


                    <div class="col-sm-12 team-member-wrap" wp-loop="blocks" wp-loop-clear-columns wp-loop-post_parent="get_theme_mod('blocks_team_1_1_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order">
                        <div class="team-member">
                            <img <img src="uni_images//<%= post.getSavepath()%>" class="img-responsive" alt="Member Image" wp-the-post-thumbnail="large">
                            <div class="team-details">
                                <h4 class="member-name" wp-the-title> <%=post.getTitle()%><input type="hidden" name="evid" value="<%=post.getEid()%>" readonly="readonly" /></h4>
                                <p class="position" wp-meta-value wp-meta-value-key="position" wp-if-get-post-meta="|position"> <%=post.getType()%></p>
                                <p wp-the-content> Location : &nbsp;<%=post.getLocation()%></p>
                                <p wp-the-content> Address : &nbsp;<%=post.getAddress()%></p>
                                <p wp-the-content> Start Date : &nbsp;<%=post.getStartdate()%></p>
                                <p wp-the-content> Start Time : &nbsp;<%=post.getStarttime()%></p>
                                <p wp-the-content> End Date : &nbsp;<%=post.getEnddate()%></p>
                                <p wp-the-content> End Time : &nbsp;<%=post.getEndtime()%></p>
                                <p wp-the-content> Description : &nbsp;<%=post.getDesc()%></p>
                                <% id = post.getUniid(); %>

                                <!-- /.social -->
                            </div>
                        </div>
                    </div>

                    <%}%>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <section class="hero" wp-cz-control="blocks_header_3_bck" wp-cz-control-label="Background image" wp-cz-control-type="media" wp-cz-control-mime-type="image" wp-cz-control-section="blocks_header_3" wp-attachment-bck wp-attachment-bck-theme-mod="blocks_header_3_bck" wp-attachment-bck-size="large">
            <div class="container">
                <div class="brand">
                    <a href="#" wp-href="url"></a>
                </div>
                <div class="navicon">
                </div>
                <div class="col-md-8 col-md-offset-2 text-center">
                    <div class="editContent">
                        <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Edit Event</h1>
                    </div>
                    <div class="editContent">
                        <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text"><hr></p>
                        <form name="myform" role="form" action="edituniidea" method="POST" > 
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput44">Event id</label>     

                                <select name="eveid" id="formInput44" class="form-control"> 
                                    <%
                                        ArrayList<unieventbean> postss = (ArrayList<unieventbean>) request.getAttribute("progects");
                                        for (unieventbean postr : postss) {
                                    %> <option><%=postr.getEid()%><% eeid = postr.getEid();%></option>
                                    <%}%>
                                    <% ResultSet rs = DB.search("SELECT * FROM `comp_event` WHERE `eid` = '" + eeid + "'");
                                        while (rs.next()) {

                                            title = rs.getString(2);
                                            type = rs.getString(3);
                                            cnum = rs.getString(4);
                                            loca = rs.getString(5);
                                            address = rs.getString(6);
                                            stdate = rs.getString(7);
                                            sttime = rs.getString(8);
                                            endd = rs.getString(9);
                                            endt = rs.getString(10);
                                            descr = rs.getString(11);

                                        }%>


                                </select>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">title</label>                                     
                                <input type="text" name="title" class="form-control" id="exampleInputEmail1" placeholder="Enter title" value="<%= title%>" required="required"> 
                            </div>  
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">type</label>                                     
                                <input type="text" name="type" class="form-control" id="exampleInputEmail1" placeholder="Enter type" value="<%= type%>" required="required"> 
                            </div> 
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">Contact Number</label>                                     
                                <input type="numeber" name="cnum" class="form-control" id="exampleInputEmail1" placeholder="Enter contact number" value="<%= cnum%>" required="required"> 
                            </div>   
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">Location name</label>                                     
                                <input type="text" name="location" class="form-control" id="exampleInputEmail1" placeholder="Location" value="<%= loca%>" required="required"> 
                            </div> 
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput26">Address</label>     

                                <textarea name="address" class="form-control" rows="3" id="formInput26" placeholder="Address" required="required"><%= address%></textarea>
                            </div>
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">Start date</label>                                     
                                <input type="date" name="startdate" class="form-control" id="exampleInputEmail1" placeholder="startdate"value="<%= stdate%>" required="required"> 

                                <label class="control-label" for="exampleInputEmail1">Start time</label>                                     
                                <input type="time" name="starttime" class="form-control" id="exampleInputEmail1" placeholder="starttime" value="<%= sttime%>" required="required"> 
                            </div> 
                            <div class="form-group"> 
                                <label class="control-label" for="exampleInputEmail1">End date</label>                                     
                                <input type="date" name="enddate" class="form-control" id="exampleInputEmail1" placeholder="enddate" value="<%= endd%>" required="required"> 

                                <label class="control-label" for="exampleInputEmail1">End time</label>                                     
                                <input type="time" name="endtime" class="form-control" id="exampleInputEmail1" placeholder="endtime" value="<%= endt%>" required="required"> 
                            </div>
                            <div class="form-group" data-pg-collapsed> 
                                <label class="control-label" for="formInput26">Description</label>     

                                <textarea name="desc" class="form-control" rows="3" id="formInput26" placeholder="decription of your event" required="required"><%= descr%></textarea>
                            </div>


                            <button type="submit" class="btn btn-info">Edit</button>                                 
                        </form>
                    </div>
                </div>
            </div>

        </section>
    </div>
</body>
</html>
