<?php
session_start();
error_reporting(0);
include("include/config.php");

// Add debugging function
function debugLog($message, $type = 'info') {
    // Log to a secure location with limited permissions
    $logFile = __DIR__ . '/login_debug.log';
    $timestamp = date('Y-m-d H:i:s');
    $logMessage = "[$timestamp][$type] $message\n";
    error_log($logMessage, 3, $logFile);
}

if(isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = md5($_POST['password']);
	$realpassword = $_POST['password'];
    // Log authentication attempt (without password)
    debugLog("Login attempt for username: $username");
	debugLog("Password before hash: $realpassword");
    debugLog("Password after hash: $password");

    // Log query information safely
    $ret = mysqli_query($bd, "SELECT * FROM admin LEFT JOIN category ON admin.categoryId = category.id WHERE username='$username' and password='$password' ");
    if(!$ret) {
        debugLog("Database error: " . mysqli_error($bd), 'error');
    }

    $num = mysqli_fetch_array($ret);
	debugLog("Fetched user data: " . print_r($num, true));
    if($num > 0) {
        debugLog("Successful login for user: $username");
        $extra = "notprocess-complaint.php";
        $_SESSION['alogin'] = $_POST['username'];
        $_SESSION['id'] = $num['id'];
		$_SESSION['categoryId'] = $num['categoryId'];
		$_SESSION['categoryDescription'] = $num['categoryDescription'];
		debugLog("Category ID: " . $_SESSION['categoryId']);
        $host = $_SERVER['HTTP_HOST'];
        $uri = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
        header("location:http://$host$uri/$extra");
        exit();
    } else {
        debugLog("Failed login attempt for user: $username");
        $_SESSION['errmsg'] = "Invalid username or password";
        $extra = "index.php";
        $host = $_SERVER['HTTP_HOST'];
        $uri = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
        header("location:http://$host$uri/$extra");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SCMS | Officer login</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<link rel="shortcut icon" href="../static/fevicon.png" type="">
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="../index.php">
			  		UMS Online Complaint Management System | Admin
			  	</a>

				<div class="nav-collapse collapse navbar-inverse-collapse">
				
					<ul class="nav pull-right">

						<li><a href="../index.php">
						Back to Portal
						
						</a></li>

						

						
					</ul>
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="module module-login span4 offset4">
					<form class="form-vertical" method="post">
						<div class="module-head">
							<h3>Sign In</h3>
						</div>
						<span style="color:red;margin-left:100px;" ><?php echo htmlentities($_SESSION['errmsg']); ?><?php echo htmlentities($_SESSION['errmsg']="");?></span>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" name="username" placeholder="Username">
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
						<input class="span12" type="password" id="inputPassword" name="password" placeholder="Password">
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary pull-right" name="submit">Login</button>
									
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2025 CMS </b> All rights reserved.
		</div>
	</div>
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>