<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head/>
<body>
<!-- set user session -->
<script type="text/javascript">
function SendLoginRequest() {
	// Hide warning message
	$('#warning-msg').hide();
	// Get input value
	var email = document.getElementById("email_login").value;
	var pwd = document.getElementById("pwd_login").value;
	var remember = document.getElementById('remember_login').checked;
	//alert("email :" + email + " psd : " + pwd);
	
	// Verify login & pwd
	if (email == "" || pwd == "") {
		$('#warning-msg').show();
		document.getElementById("warning-msg").innerHTML="Saisissez votre email et mot de passe, svp";
	} else {
		var loginInfo = new Object();
		loginInfo.email = email;
		loginInfo.password = pwd;
		loginInfo.remember = remember;
		post('user/login', loginInfo);
	}
}
</script>
<!-- //save user session -->

<!-- check user session -->
<script type="text/javascript">
function checkCookie() {
    var user = getCookie("idUser");
    if (user != "") {
        // user has logged in
        $('#navbar-loggedIn').show();
        $('#navbar-NotLoggedIn').hide();
        // set to current page
		$(function() {
			// this will get the full URL at the address bar
			var url = window.location.href;
			// passes on every "a" tag
			$(".navbar-default .navbar-nav a").each(function() {
				// set espacePersonnel href
				var aEp = document.getElementById('espacePersonnel-href'); //or grab it by tagname etc
				aEp.href = "/Yomate/espacePersonnel/"+user;
				
				// checks if its the same on the address bar
				if (this.href !== "" && url.indexOf(this.href) !== -1) {
				    $(this).closest("li").addClass("active");
				}
			});
		});
    } else {
        // user hasn't logged in
        var p = window.location.href.split("/").pop();
       	if (p === "" || p.indexOf("index") !== -1 
       	       	|| p.indexOf("inscription") !== -1 
       	       	|| p.indexOf("signup") !== -1) {
           	// on the index/inscription page
           	$('#navbar-loggedIn').hide();
           	$('#navbar-NotLoggedIn').show();
       	} else {
           	// jump to index page
       		window.location.href = "/Yomate/index.jsp";
         }
    }
}
</script>
<!-- //check user session -->

<!-- delete user session -->
<script type="text/javascript">
function logout() {
	deleteCookie("idUser");
	window.location.reload();
}
</script>
<!-- //delete user session -->

<!-- banner -->
	<div class="banner1">
		<script type="text/javascript">
			checkCookie();
		</script>
		<div class="container-fluid">
			<div class="header-nav">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavBar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="logo">
							<a class="navbar-brand" href="/Yomate/index.jsp">YoMate! <span>Trouvez vos colocataires parfaits</span></a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="myNavBar">
						<ul class="nav navbar-nav navbar-right" id="navbar-loggedIn">
							<li><a href="/Yomate/index.jsp"><i class="glyphicon glyphicon-home"></i>  Home</a></li>
							<li><a href="/Yomate/search/"><i class="glyphicon glyphicon-search"></i>  Recherche</a></li>
							<li><a id="espacePersonnel-href"><i class="glyphicon glyphicon-user"></i>  Mon Espace</a></li>
							<li><a href="/Yomate/messagerie.jsp"><i class="glyphicon glyphicon-envelope"></i>  Message</a></li>
							<li><a style="cursor: pointer; font-size: 12px;" onclick="logout()">Déconnectez-vous</a></li>
						</ul>
					  	
					  	<ul class="nav navbar-nav navbar-right" id="navbar-NotLoggedIn">
							<li><a data-toggle="modal" data-target="#login"><i class="glyphicon glyphicon-user"></i>Connectez-vous</a>							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					
				</nav>
			</div>
		</div>
	</div>
<!-- //banner -->

<!-- Personal info Modal -->
<div class="modal fade" id="login" role="dialog">
	<!-- Hide warning message-->
	<script type="text/javascript">
		$('#warning-msg').hide();
	</script>
	<!-- //Hide warning message-->
	<div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<button type="button" class="close" data-dismiss="modal">&times;</button>
	    		<h4 class="modal-title">Connectez-vous</h4>
	    	</div>
	    	<div class="modal-body">
	    		<!-- //warning -->
				<div class="row top-margin-0">
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg">
						warning msg
					</div>
				</div>
				<!-- //warning -->
				<!-- email -->
	    		<div class="row top-margin-3">
	    			<div class="col-md-12 ">
						<input type="text" name="email" id="email_login" class="form-control input-lg" placeholder="Votre email" required></input>
					</div>
					
	    		</div>
	    		<!-- //email -->
	    		<!-- mote de passe -->
	    		<div class="row top-margin-3">
	    			<div class="col-md-12">
						<input type="password" name="password" id="pwd_login" class="form-control input-lg" placeholder="Mot de passe" required></input>
					</div>
					
	    		</div>
	    		<!-- //mote de passe -->
	    		<!-- souvenir -->
	    		<div class= "row top-margin-0">
					<div class="col-md-12 inscription-text-padding" style="padding-left:30px">
						<p><input type="checkbox" id="remember_login" name="accept" value="0" /> Se souvenir de moi </p>  
					</div>
				</div> 
	    		<!-- //souvenir -->
	    		<!-- button connectez-vous -->
	    		<div class= "row top-margin-0" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn button-action btn-search" onclick="SendLoginRequest()">
						<i class="icon-edit icon-white"></i>Connectez-vous</a> 
					</div>
				</div> 
	    		<!-- //button connectez-vous -->
	    		<!-- mot de passe oublie -->
	    		<div class="row top-margin-3" style="text-align :center;">
					<span class=" index-span " style="text-center "> <a
						href="inscription.jsp">Mot de passe oublie</a>
					</span>
				</div>
	    		<!-- //mot de passe oublie -->
	    		<hr style="width: 100%; color: black; height: 1px; background-color:#A9A9A9;" />
	    		<!-- pas encore le compte -->
	    		<div class= "row top-margin-5" >
	    			<p style= "text-align :center;">Vous n'avez pas de compte ?</p>
	    		</div>
	    		<!-- //pas encore le compte -->
	    		<!-- creer un compte -->
	    		<div class= "row top-margin-0" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" href="inscription.jsp">
						<i class="icon-edit icon-white" ></i>Créer mon compte</a> 
					</div>
				</div> 
	    		<!-- //creer un compte -->
	    		<!-- facebook -->
	    		<div class= "row top-margin-3 bottom-margin-20" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-social btn-facebook" ><span class="fa fa-facebook"></span>Se connecter avec Facebook</a> 
					</div>
				</div> 
	    		<!-- //facebook -->
	    	</div>
	    	<div class="modal-footer">
	    		</div>
	    	</div>
	    </div>
	    <!-- //Modal content-->
  	</div>
<!-- //Personal info Modal -->
</body>
</html>