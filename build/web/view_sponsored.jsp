<%-- 
    Document   : viewmyidea
    Created on : Jul 4, 2018, 11:37:08 AM
    Author     : Saroj
--%>

<%@page import="beans.sponsored_project_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="user_header.jsp" />
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
                            <li class="nav-item ">
                                <a href="index2.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="ideahub.jsp">post an idea</a>
                            </li>
                            <li class="nav-item">
                                <a href="viewuseridea">view my ideas</a>
                            </li>
                            <li class="nav-item active">
                                <a href="sponsored">view sponsored</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false" href="#">Events <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="userviewevents">view university events</a>
                                    </li>
                                    <li>
                                        <a href="userviewcompevents">view company events</a>
                                    </li>
                                </ul>                                 
                            </li>
                            <!-- /.dropdown -->                             
                            <li class="nav-item">
                                <a href="logout">Logout</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>
        <section id="content-3-6" class="content-block content-3-6" wp-cz-section="blocks_content_3_6" wp-cz-section-title="Content 3-6" wp-cz-control="blocks_content_3_6_source" wp-cz-control-label="Content source" wp-cz-control-type="custom" wp-cz-control-type-custom="WP_BlocksContentDropdown_Customize_Control" wp-cz-control-section="blocks_content_3_6">
            <div class="container">
                <div class="row">
                    <!-- Feature Box 1 -->
                    <%
                        ArrayList<sponsored_project_bean> posts = (ArrayList<sponsored_project_bean>) request.getAttribute("progects");
                        for (sponsored_project_bean post : posts) {
                    %>
                    <div class="col-sm-12 col-xs-12" style="background-color: white;" wp-loop="blocks" wp-loop-post_parent="get_theme_mod('blocks_content_3_6_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order" wp-loop-clear-columns>
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-check" wp-meta-value wp-meta-value-key="icon" wp-meta-value-set="attr" wp-meta-value-set-attr="class" wp-meta-value-set-attr-append="true" wp-remove-class="fa-pencil"></span>
                            </div>
                            <h3 wp-the-title>Idea number :<%=post.getProgid()%>  </h3>
                            <h3 wp-the-title>Comapany name :<%=post.getCompname()%> </h3>
                            <h3 wp-the-title>Amount sponsoring :<%=post.getMoney()%> Rs. </h3>
                            <h3 wp-the-title>Description :<%=post.getDescription()%> </h3>
                            <h3 wp-the-title>Idea name :<%=post.getP_name()%> </h3>
                            <h3 wp-the-title>Idea description : <%=post.getP_desc()%></h3>
                            

                            
                        </div>
                    </div>
                    <!-- Feature Box 2 -->
                    <!-- Feature Box 3 -->
                    <%}%>
                </div>
                <!-- Row Ends -->
            </div>
         
            <!-- Container Ends -->
        </section>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>
