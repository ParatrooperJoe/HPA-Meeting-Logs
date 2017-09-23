<?php
    // First we exec our common code to connection to the database and start the session
    require("common.php");

    // At the top of the page we check to see whether the user is logged in or not
    if(empty($_SESSION['user']))
    {
        // If they are not, we redirect them to the login page.
        header("Location: login.php");

        // Remember that this die statement is absolutely critical.  Without it,
        // people can view your members-only content without logging in.
        die("Redirecting to login.php");
    }


?>
<!doctype html>
<html>
<head>

	<meta charset='utf-32'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Manage HPA Faculty Meeting Logs.">
    <meta name="author" content="Keith Sanders & Joe Sanders">
	<title>HPA Admin Portal</title>
	<!-- <link rel="stylesheet" href="assets/css/form.css" /> -->
	<!-- <link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Ubuntu|Roboto|Roboto+Slab' /> -->
<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap-theme.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap-theme.css" >
	<script type='text/javascript' src="assets/plugins/jquery-1.11.2.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="home-page">
    <div class="wrapper">
        <div class="content container">
            <div class="page-wrapper">



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
        	<a href="index.php">Home</a>
        </li>
        
        
        
        <li><a href="form.php">Add Employee</a></li>
        <li><a href="logout.php">Logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
<br><br><br><br><br>




&nbsp; &nbsp;  

<u><H3>CURRENT EMPLOYEES</H3></u>
<i><h5>(SELECT AN EMPLOYEE NAME TO SEE AVAILABLE OPTIONS) </h5></i><br><br>
<!-- MY CONTENT GOES HERE -->

<?php
/* 
	VIEW.PHP
	Displays all data from 'employees' table
*/

	// connect to the database
try {
  $dbh = new PDO("mysql:host={$host};dbname={$dbname};charset=utf8", $username, $password, $options);
} catch (PDOException $e) {
  echo 'Connection failed: ' . $e->getMessage();
}


// get results from database
$result = 'SELECT * FROM employees';
// $dbh->beginTransaction();	
	  
		
	// display data in table
	
	
	echo "<table border='0' cellpadding='25'>";

	// loop through results of database query, displaying them in the table
        foreach ($dbh->query($result) as $row) {
		
		// echo out the contents of each row into a table
		echo "<tr>";
                echo '<td><center><a href="list_emp_options3.php?emp_id=' . $row['emp_id'] . '">' . $row['first_name'] . '&nbsp' . $row['last_name'] . '</a></center></td>';
                
		echo "</tr><td>&nbsp;</td>";
	 
}
	// close table>
	echo "</table><br>";
?>

<!-- MY CONTENT ENDS HERE -->



</div></div></div>
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
</body>
</html>