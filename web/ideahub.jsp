<%-- 
    Document   : ideahub
    Created on : Jun 30, 2018, 10:42:50 AM
    Author     : Saroj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="user_header.jsp" />
        <style>
            .wrapper {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: horizontal;
                -webkit-box-direction: normal;
                -ms-flex-direction: row;
                flex-direction: row;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
            }

            .box {
                display: block;
                min-width: 300px;
                height: 300px;
                margin: 10px;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
                -webkit-transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
                transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
                overflow: hidden;
            }

            .upload-options {
                position: relative;
                height: 75px;
                background-color: cadetblue;
                cursor: pointer;
                overflow: hidden;
                text-align: center;
                -webkit-transition: background-color ease-in-out 150ms;
                transition: background-color ease-in-out 150ms;
            }
            .upload-options:hover {
                background-color: #7fb1b3;
            }
            .upload-options input {
                width: 0.1px;
                height: 0.1px;
                opacity: 0;
                overflow: hidden;
                position: absolute;
                z-index: -1;
            }
            .upload-options label {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                width: 100%;
                height: 100%;
                font-weight: 400;
                text-overflow: ellipsis;
                white-space: nowrap;
                cursor: pointer;
                overflow: hidden;
            }
            .upload-options label::after {
                content: 'add';
                font-family: 'Material Icons';
                position: absolute;
                font-size: 2.5rem;
                color: #e6e6e6;
                top: calc(50% - 2.5rem);
                left: calc(50% - 1.25rem);
                z-index: 0;
            }
            .upload-options label span {
                display: inline-block;
                width: 50%;
                height: 100%;
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
                vertical-align: middle;
                text-align: center;
            }
            .upload-options label span:hover i.material-icons {
                color: lightgray;
            }

            .js--image-preview {
                height: 225px;
                width: 100%;
                position: relative;
                overflow: hidden;
                background-image: url("");
                background-color: white;
                background-position: center center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .js--image-preview::after {
                content: "photo_size_select_actual";
                font-family: 'Material Icons';
                position: relative;
                font-size: 4.5em;
                color: #e6e6e6;
                top: calc(50% - 3rem);
                left: calc(50% - 2.25rem);
                z-index: 0;
            }
            .js--image-preview.js--no-default::after {
                display: none;
            }

            i.material-icons {
                -webkit-transition: color 100ms ease-in-out;
                transition: color 100ms ease-in-out;
                font-size: 2.25em;
                line-height: 55px;
                color: white;
                display: block;
            }

            .drop {
                display: block;
                position: absolute;
                background: rgba(95, 158, 160, 0.2);
                border-radius: 100%;
                -webkit-transform: scale(0);
                transform: scale(0);
            }

            .animate {
                -webkit-animation: ripple 0.4s linear;
                animation: ripple 0.4s linear;
            }

            @-webkit-keyframes ripple {
                100% {
                    opacity: 0;
                    -webkit-transform: scale(2.5);
                    transform: scale(2.5);
                }
            }

            @keyframes ripple {
                100% {
                    opacity: 0;
                    -webkit-transform: scale(2.5);
                    transform: scale(2.5);
                }
            }
            /*basic settings */

            a:focus {
                outline: none !important;
                outline-offset: none !important;
            }

            body {
                background: #f5f6f5;
                color: #333;
            }

            /* helper classses */

            .margin-top-20 {
                margin-top: 20px;
            }

            .margin-bottom-20 {
                margin-top: 20px;
            }

            .no-margin {
                margin: 0px;
            }

            /* box component */

            .box {
                border-color: #e6e6e6;
                background: #FFF;
                border-radius: 6px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.25);
                padding: 10px;
                margin-bottom: 40px;
            }

            .box-center {
                margin: 20px auto;
            }

            /* input [type = file]
            ----------------------------------------------- */

            input[type=file] {
                display: block !important;
                right: 1px;
                top: 1px;
                height: 34px;
                opacity: 0;
                width: 100%;
                background: none;
                position: absolute;
                overflow: hidden;
                z-index: 2;
            }

            .control-fileupload {
                display: block;
                border: 1px solid #d6d7d6;
                background: #FFF;
                border-radius: 4px;
                width: 100%;
                height: 36px;
                line-height: 36px;
                padding: 0px 10px 2px 10px;
                overflow: hidden;
                position: relative;

                &:before, input, label {
                    cursor: pointer !important;
                }
                /* File upload button */
                &:before {
                    /* inherit from boostrap btn styles */
                    padding: 4px 12px;
                    margin-bottom: 0;
                    font-size: 14px;
                    line-height: 20px;
                    color: #333333;
                    text-align: center;
                    text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
                    vertical-align: middle;
                    cursor: pointer;
                    background-color: #f5f5f5;
                    background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
                    background-repeat: repeat-x;
                    border: 1px solid #cccccc;
                    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
                    border-bottom-color: #b3b3b3;
                    border-radius: 4px;
                    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                    transition: color 0.2s ease;

                    /* add more custom styles*/
                    content: 'Browse';
                    display: block;
                    position: absolute;
                    z-index: 1;
                    top: 2px;
                    right: 2px;
                    line-height: 20px;
                    text-align: center;
                }
                &:hover, &:focus {
                    &:before {
                        color: #333333;
                        background-color: #e6e6e6;
                        color: #333333;
                        text-decoration: none;
                        background-position: 0 -15px;
                        transition: background-position 0.2s ease-out;
                    }
                }

                label {
                    line-height: 24px;
                    color: #999999;
                    font-size: 14px;
                    font-weight: normal;
                    overflow: hidden;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                    position: relative;
                    z-index: 1;
                    margin-right: 90px;
                    margin-bottom: 0px;
                    cursor: text;
                }
            }
        </style>

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
                        <h1>Fuze</h1>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav navbar-right" wp-nav-menu="primary" wp-nav-menu-depth="2" wp-nav-menu-type="bootstrap">
                            <li class="nav-item ">
                                <a href="index2.jsp">Home</a>
                            </li>
                            <li class="nav-item active">
                                <a href="ideahub.jsp">Create your own profile</a>
                            </li>
                            <li class="nav-item">
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
                            <h1 wp-cz-control="blocks_header_3_title" wp-cz-control-label="Title" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_title">Fuze</h1>
                        </div>
                        <div class="editContent">
                            <p class="lead" wp-cz-control="blocks_header_3_text" wp-cz-control-label="Text" wp-cz-control-type="textarea" wp-cz-control-section="blocks_header_3" wp-cz-theme-mod="blocks_header_3_text">Fuze Profile Portal</p>
                            <form role="form" action="idea_control" method="POST" enctype="multipart/form-data"> 
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Summary</label>                                     
                                    <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="Summary about yourself" required="required"> 
                                </div>                                 

                                <div class="form-group" data-pg-collapsed> 
                                    <label class="control-label" for="formInput44">Educational Qualification</label>     
                                    <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="Please provide the latest educational qualification" required="required"> 
                                </div>

                                <div class="form-group" data-pg-collapsed> 
                                    <label class="control-label" for="formInput26">Skills Set</label>     
                                    <textarea name="desc" class="form-control" rows="3" id="formInput26" placeholder="mention as comma separated list ex : - java, php, python" required="required"></textarea>
                                </div>

                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Experience</label>                                     
                                    <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="Industry Experience" required="required"> 
                                </div>
                                
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Preferred fields</label>                                     
                                    <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="Mention your preferred fields as comma seperated list eg:- QA engineer,web developer, backend developer" required="required"> 
                                </div>
                                <div class="form-group"> 
                                    <label class="control-label" for="exampleInputEmail1">Experience</label>                                     
                                    <input type="text" name="idea" class="form-control" id="exampleInputEmail1" placeholder="Industry Experience" required="required"> 
                                </div>

                                <div class="form-group"> 
                                    <label for="file">Upload your CV</label>
                                    <span class="control-fileupload">
                                        <label for="file">please upload your CV</label>
                                        <input type="file" id="file" placeholder="please upload your CV">
                                    </span>
                                </div>

                                <div class="form-group"> 
                                    <div class="wrapper">
                                        <div class="box">
                                            <div class="js--image-preview"></div>
                                            <div class="upload-options">
                                                <label>
                                                    <input type="file" class="image-upload" accept="image/*" />
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-info">Submit</button>                                 
                            </form>
                        </div>
                    </div>
                </div>

            </section>
        </header>

        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>         
        <script type="text/javascript" src="js/bootstrap.min.js"></script>         
        <script type="text/javascript" src="js/plugins.js"></script>
        <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
        <script type="text/javascript" src="js/bskit-scripts.js"></script> 
        <script>
            $(function () {
                $('input[type=file]').change(function () {
                    var t = $(this).val();
                    var labelText = 'File : ' + t.substr(12, t.length);
                    $(this).prev('label').text(labelText);
                })
            });
            function initImageUpload(box) {
                let uploadField = box.querySelector('.image-upload');

                uploadField.addEventListener('change', getFile);

                function getFile(e) {
                    let file = e.currentTarget.files[0];
                    checkType(file);
                }

                function previewImage(file) {
                    let thumb = box.querySelector('.js--image-preview'),
                            reader = new FileReader();

                    reader.onload = function () {
                        thumb.style.backgroundImage = 'url(' + reader.result + ')';
                    }
                    reader.readAsDataURL(file);
                    thumb.className += ' js--no-default';
                }

                function checkType(file) {
                    let imageType = /image.*/;
                    if (!file.type.match(imageType)) {
                        throw 'Datei ist kein Bild';
                    } else if (!file) {
                        throw 'Kein Bild gewählt';
                    } else {
                        previewImage(file);
                    }
                }

            }

// initialize box-scope
            var boxes = document.querySelectorAll('.box');

            for (let i = 0; i < boxes.length; i++) {
                if (window.CP.shouldStopExecution(1)) {
                    break;
                }
                let box = boxes[i];
                initDropEffect(box);
                initImageUpload(box);
            }
            window.CP.exitedLoop(1);




/// drop-effect
            function initDropEffect(box) {
                let area, drop, areaWidth, areaHeight, maxDistance, dropWidth, dropHeight, x, y;

                // get clickable area for drop effect
                area = box.querySelector('.js--image-preview');
                area.addEventListener('click', fireRipple);

                function fireRipple(e) {
                    area = e.currentTarget
                    // create drop
                    if (!drop) {
                        drop = document.createElement('span');
                        drop.className = 'drop';
                        this.appendChild(drop);
                    }
                    // reset animate class
                    drop.className = 'drop';

                    // calculate dimensions of area (longest side)
                    areaWidth = getComputedStyle(this, null).getPropertyValue("width");
                    areaHeight = getComputedStyle(this, null).getPropertyValue("height");
                    maxDistance = Math.max(parseInt(areaWidth, 10), parseInt(areaHeight, 10));

                    // set drop dimensions to fill area
                    drop.style.width = maxDistance + 'px';
                    drop.style.height = maxDistance + 'px';

                    // calculate dimensions of drop
                    dropWidth = getComputedStyle(this, null).getPropertyValue("width");
                    dropHeight = getComputedStyle(this, null).getPropertyValue("height");

                    // calculate relative coordinates of click
                    // logic: click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center
                    x = e.pageX - this.offsetLeft - (parseInt(dropWidth, 10) / 2);
                    y = e.pageY - this.offsetTop - (parseInt(dropHeight, 10) / 2) - 30;

                    // position drop and animate
                    drop.style.top = y + 'px';
                    drop.style.left = x + 'px';
                    drop.className += ' animate';
                    e.stopPropagation();

                }
            }


        </script>        
    </body>     
</html>
