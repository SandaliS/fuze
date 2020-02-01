<%-- 
    Document   : index
    Created on : Jul 1, 2018, 4:53:08 PM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Company_header.jsp" />
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
                                <a href="index3.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="listidea">view an idea</a>
                            </li>
                            <li class="nav-item">
                                <a href="view_my_sponsored_comp">view sponsored ideas</a>
                            </li>
                            <li class="nav-item">
                                <a href="company_add_event_step_1.jsp">Create an event</a>
                            </li>
                            <li class="nav-item">
                                <a href="view_comp_idea">View my events</a>
                            </li>
                            <li class="nav-item ">
                                <a href="compviewevents">View other events</a>
                            </li>
                            <li class="nav-item">
                                <a href="clogout">logout</a>
                            </li>                            
                        </ul>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>
        <img src="images/Screenshot (311).png" class="img-responsive" alt=" Image" >
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>


</html>
