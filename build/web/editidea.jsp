<%-- 
    Document   : editidea
    Created on : Jul 4, 2018, 10:53:49 AM
    Author     : Saroj
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.projectbean"%>
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
                            <li class="nav-item active">
                                <a href="viewuseridea">view my ideas</a>
                            </li>
                            <li class="nav-item">
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
                        ArrayList<projectbean> posts = (ArrayList<projectbean>) request.getAttribute("progects");
                        for (projectbean post : posts) {
                    %>
                    <div class="col-sm-4 col-xs-12" style="background-color: white;" wp-loop="blocks" wp-loop-post_parent="get_theme_mod('blocks_content_3_6_source')" wp-loop-post-type-custom="blocks_content" wp-loop-post-status="publish" wp-loop-nopaging="true" wp-loop-order="ASC" wp-loop-orderby="menu_order" wp-loop-clear-columns>
                        <div class="feature-box">
                            <div class="icon">
                                <span class="fa fa-pencil" wp-meta-value wp-meta-value-key="icon" wp-meta-value-set="attr" wp-meta-value-set-attr="class" wp-meta-value-set-attr-append="true" wp-remove-class="fa-pencil"></span>
                            </div>
                            <h3 wp-the-title>Idea Number : <%=post.getProgid()%></h3>
                            <h3 wp-the-title>Idea Name : <%=post.getName()%></h3>
                            <h3 wp-the-title>Idea Type : <%=post.getType()%></h3>
                            <h3 wp-the-title>Description : <%=post.getDescription()%></h3>
                        </div>
                    </div>
                    <!-- Feature Box 2 -->
                    <!-- Feature Box 3 -->
                    <%}%>
                </div>
                <!-- Row Ends -->
            </div>
            <header id="header-3" class="soft-scroll header-3" wp-cz-section="blocks_header_3" wp-cz-section-title="Header 3">
                <nav>
                    <div class="container">
                        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2">
                            <nav class="pull">


                            </nav>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </nav>
                <!-- /.nav -->
                <section class="hero" wp-cz-control="blocks_header_3_bck" wp-cz-control-label="Background image" wp-cz-control-type="media" wp-cz-control-mime-type="image" wp-cz-control-section="blocks_header_3" wp-attachment-bck wp-attachment-bck-theme-mod="blocks_header_3_bck" wp-attachment-bck-size="large">
                    <div class="container">
                        <div class="brand">
                            <a href="#" wp-href="url"></a>
                        </div>
                        <div class="navicon">
                        </div>
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <div class="editContent">
                                <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Konnect</h1>
                            </div>
                            <div class="editContent">
                                <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Edit Idea (Sponsored ideas are un editable)</p>
                                <form role="form" action="edit_idea" method="POST"> 
                                    <div class="form-group" data-pg-collapsed> 
                                        <label class="control-label" for="formInput44">Idea Number</label>     

                                        <select name="progid" id="formInput44" class="form-control"> 
                                            <%
                                                ArrayList<projectbean> posts1 = (ArrayList<projectbean>) request.getAttribute("progects");
                                                for (projectbean post1 : posts1) {
                                            %>
                                            <option><%=post1.getProgid()%></option>         
                                            <%}%>
                                        </select>
                                    </div>


                                    <div class="form-group"> 
                                        <label class="control-label" for="exampleInputEmail1">Idea Name</label>                                     
                                        <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="name your idea" required="required"> 
                                    </div>                                 

                                    <div class="form-group" data-pg-collapsed> 
                                        <label class="control-label" for="formInput44">Idea Type</label>     

                                        <select name="type" id="formInput44" class="form-control"> 
                                            <option>technical</option>         
                                            <option>misc</option>         

                                        </select>
                                    </div>

                                    <div class="form-group" data-pg-collapsed> 
                                        <label class="control-label" for="formInput26">Description</label>     

                                        <textarea name="desc" class="form-control" rows="3" id="formInput26" placeholder="decription of your idea" required="required"></textarea>
                                    </div>

                                    <button type="submit" class="btn btn-info">Submit Idea</button>                                 
                                </form>
                            </div>
                        </div>
                    </div>
                    
                </section>
            </header>
            
            <!-- Container Ends -->
        </section>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>
</html>
