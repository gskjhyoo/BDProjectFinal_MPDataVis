<%@page import="bdp.model.dto.PersonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BDProject ver 1.0</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="https://github.com/BD-P-Projcet/BDPProjectJSPServer.git" target="blank">GitHub Link</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="project?cmd=index">Home</a>
                    </li>
                    <li>
                        <a href="project?cmd=about_us">About Us</a>
                    </li>
                    <li>
                        <a href="project?cmd=db_layout">D.B Layout</a>
                    </li>
                    <li>
                        <a href="project?cmd=visual">Visualization</a>
                    </li>
                    <li>
                        <a href="project?cmd=board">Board</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/visual-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="page-heading">
                        <h1>Medical Data Visualization</h1>
                        <hr class="small">
                        <%
                        /* PersonDTO user = (PersonDTO) session.getAttribute("user");
                        if(user != null) */
                        
                        %>
                        
                        <span class="subheading"> 
                        	<a href="project?cmd=vis_geo">M.P Geo Vis</a> | 
                        	<a href="project?cmd=vis_sgperson">M.P SG Person Vis</a> | 
                        	<a href="project?cmd=vis_pstatic">Personal Health Vis </a>
                        	</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <h1>Data Visualization Detail</h1><br>
            	<table width="100%">
            		<tr>
            			<td width="20%" ><img src="./img/vis-geo.jpg" width="100%"><br></td>
            			<td style="padding-left: 10px;"><p><strong>GeoMatric Visualization</strong><br><font size="3">This is Visualization of Medical & Pharmacial Data in Korean GeoMap</font></p></td>
            		</tr>
            		<tr>
            			<td width="20%" ><img src="./img/vis-sgperson.jpg" width="100%"></td>
            			<td style="padding-left: 10px;"><p><strong>SG Person Visualization</strong><br><font size="3">This is Visualization of Medical & Pharmacial in Korean </font></p></td>
            		</tr>
            		<tr>
            			<td width="20%" ><img src="./img/vis-pstatic.jpg" width="100%"></td>
            			<td style="padding-left: 10px;"><p><strong>Personal Medical & Pharmacial Data Visualization</strong><br><font size="3">This is Visualization of Medical & Pharmacial Data from Personal Record</font></p></td>
            		</tr>
            	</table>
            </div>
        </div>
        <div class="row">
        	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        	 <p style="font-family: 나눔고딕;">
        	 	수천개의 수치보다 한개의 데이터 시각화가 낫다. 시각화의 결과물을 통하여 새로운 인사이트를 얻는다.  의료 정보의 시각화를 통해 광역적인 데이터 추세를 파악하고 각 시도군별 다수의 건강상태를 파악할 수 있다. 그리고 개인 로그인을 통하여 
        	 	자신의 건강 추이를 파악하고 대비한다. 
        	 </p>
        	</div>
        </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <ul class="list-inline text-center">
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
