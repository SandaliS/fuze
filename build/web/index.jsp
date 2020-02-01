<%-- 
    Document   : index
    Created on : Jul 5, 2018, 8:54:00 PM
    Author     : Saroj
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controller.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en" style="height:100%;">
    <head> 
        <meta charset="utf-8"> 
        <title>Konnect</title>
        
        <!-- Core CSS -->         
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet">
        <!-- Style Library -->         
        <link href="css/style-library-1.css" rel="stylesheet">
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/blocks.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>$(document).on('click', 'a[href^="#"]', function (event) {
                event.preventDefault();

                $('html, body').animate({
                    scrollTop: $($.attr(this, 'href')).offset().top
                }, 500);
            });</script>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->         
        <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>

    <![endif]-->         
    </head>     
    <body data-spy="scroll" data-target="nav">
        <header id="header-3" class="soft-scroll header-3">
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
            <section class="hero">
                <div class="container">
                    <div class="brand">
                        <a href="#"></a>
                    </div>
                    <div id='head' class="navicon">
                    </div>
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="editContent">
                            <h1>Konnect</h1>
                        </div>
                        <div class="editContent">
                            <p class="lead">The place where People , Universities and Industries meet...</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <div class="col-md-6">
                            <a href="signin.jsp" class="btn btn-info btn-block">log in</a>
                        </div>
                        <div class="col-md-6">
                            <a href="signup.jsp" class="btn btn-info btn-block">sign up</a>
                        </div>
                    </div>
                </div>
            </section>
        </header>
        <section id="content-2-7" class="content-block content-2-7">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="underlined-title">
                            <h1>Some facts &amp; figures</h1>
                            <h2></h2>
                        </div>
                    </div>
                    <div class="col-sm-4 text-center">
                        <div class="counter-icon">
                            <span class="fa fa-user"></span>
                        </div>
                        <div class="counter-text">
                            <h3 class="counter"><%
                                ResultSet rs1 = DB.search("SELECT COUNT(`id`) FROM `user`");
                                if (rs1.next()) {
                                    out.print(rs1.getString(1));
                                }
                                %></h3>
                            <span>Users</span>
                        </div>
                    </div>
                    <div class="col-sm-4 text-center">
                        <div class="counter-icon">
                            <span class="fa fa-briefcase"></span>
                        </div>
                        <div class="counter-text">
                            <h3 class="counter"><%
                                ResultSet rs2 = DB.search("SELECT COUNT(`cid`) FROM `company`");
                                if (rs2.next()) {
                                    out.print(rs2.getString(1));
                                }
                                %></h3>
                            <span>Companies</span>
                        </div>
                    </div>
                    <div class="col-sm-4 text-center">
                        <div class="counter-icon">
                            <span class="fa fa-building"></span>
                        </div>
                        <div class="counter-text">
                            <h3 class="counter"><%
                                ResultSet rs3 = DB.search("SELECT COUNT(`id`) FROM `university`");
                                if (rs3.next()) {
                                    out.print(rs3.getString(1));
                                }
                                %></h3>
                            <span>Universities</span>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center pad45"></div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>
        <section id="content-1-2" class="content-block content-1-2">
            <div class="container">
                <!-- Start Row -->
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Create Customizable events</h2>
                        <p class="lead">Create attractive events with user feedback</p>
                        <p>Universities and Companies can create events. manage them get feedback from the atendees. so why post elsewhere.. post it in here where everyone is</p>
                    </div>
                    <div class="col-sm-5 col-sm-offset-1">
                        <img class="img-rounded img-responsive" src="images/univ.jpg">
                    </div>
                </div>
                <!--// END Row -->
            </div>
        </section>
        <section id="content-1-2" class="content-block content-1-2">
            <div class="container">
                <!-- Start Row -->
                <div class="row">
                    <div class="col-sm-5">
                        <img class="img-rounded img-responsive" src="images/user.jpg">
                    </div>
                    <div class="col-sm-6  col-sm-offset-1">
                        <h2>Collab with industries and universities</h2>
                        <p class="lead">You don't want to miss such chances don't you</p>
                        <p>Attend events and meetups organized by compnaies and universities. comment them. Make them know that you are intersted in them or may be going for sure</p>
                    </div>
                </div>
                <!--// END Row -->
            </div>
        </section>
        <section id="content-2-1" class="content-block content-2-1 bg-deepocean">
            <div class="container text-center">
                <h2>So don't miss out any chances</h2>
                <p class="lead"><a href="#head">Sign up now</a></p>
            </div>
            <!-- /.container -->
        </section>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script>         
    </body>     
</html>

