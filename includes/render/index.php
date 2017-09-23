<?php
    // First we exec our common code to connection to the database and start the session
    require("../../common.php");

    // At the top of the page we check to see whether the user is logged in or not
    if(empty($_SESSION['user']))
    {
        // If they are not, we redirect them to the login page.
        header("Location: ../../login.php");

        // Remember that this die statement is absolutely critical.  Without it,
        // people can view your members-only content without logging in.
        die("Redirecting to ../../login.php");
    }


?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Verizon Employee Baseball Card</title>
    <link href="https://fonts.googleapis.com/css?family=Chewy|Orbitron:500|Vast+Shadow" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron-narrow.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.bgimg {
    background-image: url('assets/img/bbcard_ex3.png');
background-repeat: no-repeat;
}
.img {
    vertical-align: top;
    position:relative;
    bottom:14px;
}
.emppic {
    vertical-align: top;
    position:relative;
    bottom:47px;
    left:39px;
}
.tmlogo {
    vertical-align: top;
    position:relative;
    bottom:349px;
    left:239px;
}
.dateposted {
    font-family: 'Chewy', cursive;
    vertical-align: top;
    position:relative;
    bottom:184px;
    left:294px;
}
.empname {
    font-family: 'Orbitron', sans-serif;
    vertical-align: top;
    position:relative;
    bottom:352px;
    left:90px;
}
.vaps {
    font-family: 'Orbitron', sans-serif;
    position:relative;
    bottom:0px;
    left:-181px;
}
.newlines {
    font-family: 'Chewy', cursive;
    position:relative;
    bottom:57px;
    left:-40px;
}
.upgrades {
    font-family: 'Chewy', cursive;
    position:relative;
    bottom:115px;
    left:140px;
}
.accessories {
    font-family: 'Orbitron', sans-serif;
    position:relative;
    bottom:65px;
    left:-103px;
}
.insurance {
    font-family: 'Orbitron', sans-serif;
    position:relative;
    bottom:112px;
    left:110px;
}
</style>

  </head>

  <body>
<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li <?php if ($pg=='id') echo "class=\"active\"" ?>>
        	<a href="../../index.php">Home</a>
        </li>
        
        
        
        <li><a title="Click to Go back to previous screen." href="../../view_stats.php?emp_id=<?php echo $_GET['emp_id']; ?>">Return</a></li>
        <li><a href="../../logout.php">Logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<form action="" method="post">
<input type="hidden" name="emp_id" value="<?php echo $_GET['emp_id']; ?>"/>
<input type="hidden" name="stats_id" value="<?php echo $_GET['stats_id']; ?>"/>
</form>


    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active">&nbsp;</li>
            <li role="presentation">&nbsp;</li>
            <li role="presentation"><&nbsp;</li>
          </ul>
        </nav>
        <h3 class="text-muted">&nbsp;</h3>
      </div>



        <div class="jumbotron">
        <div class="bgimg">
        <h1>&nbsp;</h1>
        <div class="row marketing">
        <div class="col-lg-6">
          <?php

$db = new PDO('mysql:host=localhost;dbname=untiemyw_VzW1;charset=utf8mb4', 'untiemyw_sandman', 'JAN1982jds!!!!');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

// get results from database

$sql = "SELECT employees.first_name, employees.last_name, employees.emp_picture, employees.emp_id, emp_stats.stats_id, emp_stats.date, emp_stats.vaps, emp_stats.newlines, emp_stats.upgrades, emp_stats.accessories, emp_stats.insurance FROM employees , emp_stats WHERE employees.emp_id = emp_stats.emp_id AND emp_stats.stats_id ='".$_GET['stats_id']."' ";	  

// display results of database query, displaying them in the table
        foreach ($db->query($sql) as $row) {
// echo out the contents of each row into a table
		
echo '<img class="emppic" src="' . $row['emp_picture'] . '"' . '&nbsp;' . 'height="95%" width="95%"><p><img class="tmlogo" src="assets/img/incr_logo.png" height="115%" width="115%"></p><div  class="dateposted"><h3>' . $row['date'] . '</h3></div><p>' . '&nbsp;' . '</p></div><div class="col-lg-8"><h4>' . '&nbsp;' . '</h4><div class="empname"><p style="text-align:center"><span><font class="img" size="6" color="black"><b>' . $row['first_name'] . '&nbsp;' . $row['last_name'] . '</b></font></span></p><br><br><br><br><br><p class="vaps"><font size="5" color="#386704"><b>$' . $row['vaps'] . '</b></font></p><p class="newlines"><font size="6" color="blue"><b>' . $row['newlines'] . '</b></font></p><p class="upgrades"><font size="6" color="blue"><b>' . $row['upgrades'] . '</b></font></p><p class="accessories"><font size="5" color="#386704"><b>$' . $row['accessories'] . '</b></font></p><p class="insurance"><font size="5" color="#386704"><b>$' . $row['insurance'] . '</b></font></p></div>';

}

?>

       

        </div>


      </div>
        </div>
      

      



    </div> <!-- /container -->
<!-- ******FOOTER****** --> 
    <footer class="footer">
       
        <div class="bottom-bar">
            <div class="container">
                <div class="row">
                    <small class="copyright col-md-6 col-sm-12 col-xs-12">Copyright @ 2017 Joe Sanders</small>
                    
                </div><!--//row-->
            </div><!--//container-->
        </div><!--//bottom-bar-->
    </footer><!--//footer-->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
