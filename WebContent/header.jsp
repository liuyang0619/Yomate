<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head/>
<body>

<!-- set user session -->
<script type="text/javascript">
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function login() {
	// Get input value
	var email = document.getElementById("email_login").value;
	var pwd = document.getElementById("pwd_login").value;
	var remember = document.getElementById('remember_login').checked;
	// Verify login & pwd

	// Set user session
	if (remember) {
		setCookie("email", email, 7);
		window.location.reload();
	} else {
		setCookie("email", email, 0.5);
		window.location.reload();
	}
}
</script>
<!-- //save user session -->

<!-- check user session -->
<script type="text/javascript">
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    var user = getCookie("email");
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
				// checks if its the same on the address bar
				if (url == (this.href)) {
				    $(this).closest("li").addClass("active");
				}
			});
		});
    } else {
        // user hasn't logged in
        var p = window.location.href.split("/").pop();
       	if (p === "" || p === "index.jsp") {
           	// on the index page
           	$('#navbar-loggedIn').hide();
           	$('#navbar-NotLoggedIn').show();
       	} else {
           	// jump to index page
       		window.location.href = "index.jsp";
         }
    }
}
</script>
<!-- //check user session -->

<!-- delete user session -->
<script type="text/javascript">
function deleteCookie(cname) {
  document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

function logout() {
	deleteCookie("email");
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
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="logo">
							<a class="navbar-brand" href="index.jsp">YoMate! <span>Trouvez vos colocataires parfaits</span></a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil">
						<div id="navbar-loggedIn">
							<ul class="nav navbar-nav row">
								<li><a href="index.jsp"><i class="glyphicon glyphicon-home"></i>  Home</a></li>
								<li><a href="recherche.jsp"><i class="glyphicon glyphicon-search"></i>  Recherche</a></li>
								<li><a href="espacePersonnel.jsp"><i class="glyphicon glyphicon-user"></i>  Espace personel</a></li>
							</ul>
							<ul class="nav navbar-nav row" style="float:right;">
								<li><a onclick="logout()" style="font-size: 12px;">D�connectez-vous</a></li>
							</ul>
						</div>
					  	
					  	<div id="navbar-NotLoggedIn">
						  	<ul class="nav navbar-nav" id="navbar-NotLoggedIn">
								<li><a data-toggle="modal" data-target="#login"><i class="glyphicon glyphicon-user"></i>Connectez-vous</a>							</li>
							</ul>
						</div>
					</div>
					<!-- /.navbar-collapse -->
					
				</nav>
			</div>
		</div>
	</div>
<!-- //banner -->

<!-- Personal info Modal -->
<div class="modal fade" id="login" role="dialog">
	<div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<button type="button" class="close" data-dismiss="modal">&times;</button>
	    		<h4 class="modal-title">Connectez-vous</h4>
	    	</div>
	    	<div class="modal-body">
	    		<!-- email -->
	    		<div class="row top-margin-3">
	    			<div class="col-md-12 ">
						<input type="text" name="email" id="email_login" class="form-control input-sm" placeholder="Votre email" style="height: 51px; width: 550px; font-size: 20px;" required></input>
					</div>
					
	    		</div>
	    		<!-- //email -->
	    		<!-- mote de passe -->
	    		<div class="row top-margin-3">
	    			<div class="col-md-12">
						<input type="password" name="password" id="pwd_login" class="form-control input-sm" placeholder="Mot de passe" style="height: 51px; width: 550px; font-size: 20px;" required></input>
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
						<a class="btn button-action btn-search" onclick="login()">
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
	    		<h3 style= "text-align :center;">____________________________________________________________</h3>
	    		<!-- pas encore le compte -->
	    		<div class= "row top-margin-5" >
	    			<p style= "text-align :center;">Vous n'avez pas de compte ?</p>
	    		</div>
	    		<!-- //pas encore le compte -->
	    		<!-- creer un compte -->
	    		<div class= "row top-margin-0" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" href="inscription.jsp">
						<i class="icon-edit icon-white" ></i>Creer mon compte</a> 
					</div>
				</div> 
	    		<!-- //creer un compte -->
	    		<!-- facebook -->
	    		<div class= "row top-margin-3 bottom-margin-20" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-info btn-search" href="#">
						<i class="icon-edit icon-white" ></i>Se connecter avec Facebook</a> 
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
</div>
<!-- //Personal info Modal -->
</body>
</html>