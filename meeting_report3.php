<?php
    // First we exec our common code to connection to the database and start the session
    require("common.php");

    // At the top of the page we check to see whether the user is logged in or not
    if(empty($_SESSION['user']))
    {
        // If they are not, we redirect them to the login page.
        header('Location: index.php');

        // Remember that this die statement is absolutely critical.  Without it,
        // people can view your members-only content without logging in.
        die("Redirecting to login.php");
    }

/*
 EDIT.PHP
 Allows user to edit specific entry in database
*/

 // creates the edit record form
 // since this form is used multiple times in this file, I have made it a function that is easily reusable
 function renderForm($meet_id, $meet_name, $meet_date, $meet_desc, $error)
 {
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>

<meta charset='utf-32'>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Manage the saved Employee Meeting Logs.">
<meta name="author" content="Keith Sanders & Joe Sanders">
<title>View Stats</title>
<!-- <link rel="stylesheet" href="assets/css/form.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href='http://fonts.googleapis.com/css?family=Ubuntu|Roboto|Roboto+Slab' /> -->
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap/css/bootstrap-theme.css" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<script type='text/javascript' src="assets/plugins/jquery-1.11.2.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<style>
table, td, th {    
    border: 0px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 60%;
}

th, td {
    padding: 9px;
}

</style>
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
      <a class="navbar-brand" href="edit_emp.php?meet_id=meet_id">Meeting Logs for:&nbsp;&nbsp;<i>(<?php echo $meet_date . '&nbsp;' ?>)</i></a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li>
        	<a href="index.php">Home</a>
        </li>
        
        
        
        <li><a title="Click to Go back to previous screen." href="list_emp_options3.php?meet_id=<?php echo $meet_id; ?>">Return</a></li>
        <li><a href="logout.php">Logout</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
<br><br><br><br><br>
<h3>Meeting Report</h3>
<p align="left">This Report is generated for the Meeting/Date indicated below.  If this is not the meeting you intended to run a report for, select a meeting from the list to the right and hit submit.</i></p>
<br><br>

<?php
// if there are any errors, display them
if ($error != '')
{
echo '<div style="padding:4px; border:1px solid red; color:red;">'.$error.'</div>';
}
?>
<form action="" method="post">
<input type="hidden" name="meet_id" value="<?php echo $meet_id; ?>"/>

</form>
<br>

<?php

$db = new PDO('mysql:host=localhost;dbname=untiemyw_VzW1;charset=utf8mb4', 'untiemyw_sandman', 'JAN1982jds!!!!');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);



// get results from database
	
$sql = "SELECT employees.first_name, employees.last_name, employees.emp_id, checkedout.checkout_id, checkedout.emp_id, checkedout.checkout_date, checkedout.meet_id, checkedin.checkin_id, checkedin.emp_id, checkedin.checkin_date, checkedin.meet_id, meeting_name.meet_date, meeting_name.meet_name, meeting_name.meet_desc, meeting_name.meet_id FROM employees , checkedout, checkedin, meeting_name WHERE checkedin.emp_id = employees.emp_id AND checkedin.meet_id = meeting_name.meet_id AND checkedin.meet_id = $meet_id OR checkedin.meet_id = $meet_id AND checkedout.meet_id = meeting_name.meet_id AND checkedout.emp_id = employees.emp_id ORDER BY employees.last_name ASC, checkedin.checkin_date ASC LIMIT 0, 200 ";	  


echo '<font size="5"><u><b>MEETING NAME:</b></u></font>&nbsp;&nbsp;<font size="6">&nbsp;&nbsp;' . $meet_name . '</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
echo '&nbsp;<font size="6"><u><b></b></u></font>&nbsp;&nbsp;<font size="6">(' . $meet_date . ')</font>';
echo '<br><br>';
echo '<font size="5"><u><i>Meeting Description:</i></u></font><br><br>';
echo '<font size="5">' . $meet_desc . '</font>' ;
echo '<br><br>';

	// display data in table
	
	
	echo "<table>";

	// loop through results of database query, displaying them in the table
        echo "<tr><th>&nbsp;<u>Employee Name</u></th><th>&nbsp;<u>Check In Time</u>&nbsp;</th><th>&nbsp;<u>Check Out Time</u>&nbsp;</th></tr>";

        foreach ($db->query($sql) as $row) {
		
		// echo out the contents of each row into a table
		
                echo '<tr><td>' . $row['first_name'] . '&nbsp;' . $row['last_name'] . '</td>&nbsp;' . '<td>' . $row['checkin_date'] . '</td>&nbsp;' . '<td>' . $row['checkout_date'] . '</td>&nbsp;' . '<td><center>' . '<div>&nbsp;&nbsp;' . '&nbsp;</div>' . '</center></td>&nbsp;' . '<td><center>' . '<div>&nbsp;&nbsp;' . '&nbsp;</div>' . '</center></td>&nbsp;' . '<td><center>' . '<div>&nbsp;&nbsp;' . '&nbsp;</div>' . '</center></td></tr>&nbsp;';
                



		
	 
}
	// close table>
	echo "</table><br>";


?>
</div></div></div>

<br><br><br>
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
<!-- Javascript -->

</body>
</html>
<?php
}
error_reporting(E_ALL); ini_set('display_errors', 'On');
 // connect to the database
include('connect-db.php');
// check if the form has been submitted. If it has, process the form and save it to the database
if (isset($_POST['submit']))
{
// confirm that the 'meet_id' value is a valid integer before getting the form data
if (is_numeric($_POST['meet_id']))
{
// get form data, making sure it is valid
$meet_id = $_POST['meet_id'];
$meet_name = mysql_real_escape_string(htmlspecialchars($_POST['meet_name']));
$meet_date = mysql_real_escape_string(($_POST['meet_date']));
$meet_desc = mysql_real_escape_string(htmlspecialchars($_POST['meet_desc']));

// check that meet_id/meet_name/meet_date/meet_desc fields are all filled in
if ($meet_id == '' || $meet_name == '' || $meet_date == '' || $meet_desc == '')
{
// generate error message
$error = 'ERROR: Please fill in all required fields!';
//error, display form
renderForm($meet_id, $meet_name, $meet_date, $meet_desc, $error);
}
else
{
// save the data to the database
mysql_query("UPDATE meeting_name SET meet_id='$meet_id',meet_name,='$meet_name',meet_date='$meet_date',meet_desc='$meet_desc' WHERE meet_id='$meet_id'")
or die(mysql_error());
// once saved, redirect back to the view page
echo "Successfully Submitted changes!";
echo '<script>window.location = "list_emp.php";</script>';
    die;
}
}
else
{
// if the 'meet_id' isn't valid, display an error
echo 'Error!';
}
}
else
// if the form hasn't been submitted, get the data from the db and display the form
{
// get the 'meet_id' value from the URL (if it exists), making sure that it is valid (checking that it is numeric/larger than 0)
if (isset($_GET['meet_id']) && is_numeric($_GET['meet_id']) && $_GET['meet_id'] > 0)
{
// query db
$meet_id = $_GET['meet_id'];
$result = mysql_query("SELECT * FROM meeting_name WHERE meet_id=$meet_id")
or die(mysql_error());
$row = mysql_fetch_array($result);
// check that the 'meet_id' matches up with a row in the database
if($row)
{
// get data from db
$meet_id = $row['meet_id'];
$meet_name = $row['meet_name'];
$meet_date = $row['meet_date'];
$meet_desc = $row['meet_desc'];
// show form
renderForm($meet_id, $meet_name, $meet_date, $meet_desc,  '');
}
else
// if no match, display result
{
echo "No results!";
}
}
else
// if the 'meet_id' in the URL isn't valid, or if there is no 'meet_id' value, display an error
{
echo 'Error!';
}
}
?>
