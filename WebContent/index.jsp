<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<%
	//!
	%>
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
    <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>BigData M.P Data Visualization</h1>
                        <hr class="small">
                        <span class="subheading">JunhoKim | JinHwangKim <br><br>
                        	<font size ="2">Graduate School of Human ICT Convergence <br>
                        		Sungkyunkwan University</font></span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <!-- 구분1 -->
<!-- 	<div class="container">
		<div class="row">Login</div>
	</div> -->
	<hr>
	<div class="container">
	<center>
	
    <form action="project" method="post">
    	ID: <input type="text" name="id"  > 
    	PW: <input type="password" name="pwd" > 
    	<input type="submit" value="login">
    </form>
    </center>
    </div>
    <hr>
    
    <%
    // 현재 날짜
    String strToDay = "";
    // 현재 날짜시간
    String strToDateTime = "";
    
	// 총 의료 보험 인원
	int nCPerson = (int) request.getAttribute("IndexCountPerson");
    List<Integer> lstCountManWoman= (List<Integer>) request.getAttribute("IndexCountManWoman");
   	int nCMan = lstCountManWoman.get(0);
   	int nCWoman = lstCountManWoman.get(1);
 	// 남여 성비 
 	
 	// 현재 내원 환자수 
 	/// 의료보건
 	int nCM = (int) request.getAttribute("IndexCountM");
 	/// 치과한방
 	int nCDH = (int) request.getAttribute("IndexCountDH");
 	/// 약국
 	int nCP = (int) request.getAttribute("IndexCountP");
	/// 약국 금액 	
 	int nSDMD_P = (int) request.getAttribute("IndexSumDMD_P");
 	/// 의료 보건 금액
 	int nSDMD_M = (int) request.getAttribute("IndexSumDMD_M");
 	/// 치과 한방 금액
 	int nSDMD_DH = (int) request.getAttribute("IndexSumDMD_DH");
 	
    %>

	<div class="container">
		<table>
		
		
		</table>
	</div>

	<!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                       의료, 보건, 치과, 한방, 약국 의료데이터 현황
                            <!-- Man must explore, and this is exploration at its greatest -->
                        </h2>
                        <h3 class="post-subtitle">
                       의료 코호트 정보를 기반으로 함.
                        </h3>
                    </a>
                    <p class="post-meta">Analysis by <a href="project?cmd=about_us">JH.Kim * 2</a> on </p>
                </div>
                <hr>
                의료보험자수 - 남자: <%=nCMan %> | 여자: <%=nCWoman %> | 총인원: <%=nCPerson %>
                <hr>
                내원환자수 - 의과보건: <%=nCM %> | 치과한방: <%=nCDH %> | 약국: <%=nCP %>
                <hr>
                의료비 총액 - 의과보건: <%=nSDMD_M %> 원 | 치과한방: <%=nSDMD_DH %> 원 | 약국: <%=nSDMD_P %> 원
                <hr>
                
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
