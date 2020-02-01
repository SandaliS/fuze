<%-- 
    Document   : asasa
    Created on : Jul 12, 2018, 5:01:10 PM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="Uni_header.jsp"/>
        <meta charset='utf-8' />
        <link href='bootstrap/css/fullcalendar.min.css' rel='stylesheet' />
        <link href='bootstrap/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <script src='bootstrap/js/moment.min.js'></script>
        <script src='bootstrap/js/jquery.min.js'></script>
        <script src='bootstrap/js/fullcalendar.min.js'></script>
        <script>

            $(document).ready(function () {

                $('#calendar').fullCalendar({
                    defaultDate: '2018-07-01',
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: "usercomeventcal"
                });

            });
        </script>
        <style>

            body {
                margin: 40px 10px;
                padding: 0;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                font-size: 14px;
            }

            #calendar {
                max-width: 1000px;
                margin: 0 auto;
            }

        </style>
    </head>
    <body>
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
                                <a href="index4.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="uni_add_event_step1.jsp">Create an event</a>
                            </li>
                            <li class="nav-item">
                                <a href="viewuniidea">view My event</a>
                            </li>
                            <li class="nav-item active">
                                <a href="uni_view_comp_events">View other events</a>
                            </li>
                            <li class="nav-item">
                                <a href="#">Add semester plan</a>
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
        <br><br><br>

        <div id='calendar'></div>

    </body>
</html>

