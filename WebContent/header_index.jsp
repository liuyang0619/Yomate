<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head/>
<body>

<!-- set to current page -->
<script src="ressources/js/jquery-1.11.1.min.js" type="text/javascript"></script> 
<script type="text/javascript">
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
</script>
<!-- //set to current page -->

<!-- banner -->
	<div class="banner1">
		<div class="container-fluid">
			<div class="header-nav">
				<nav class="navbar navbar-default"> <!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="logo">
						<a class="navbar-brand" href="index.jsp">YoMate! <span>Trouvez
								vos colocataires parfaits</span></a>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="aide.jsp"><i
								class="glyphicon glyphicon-home"></i>Aide</a></li>
						<li><a href="inscription.jsp"><i
								class="glyphicon glyphicon-user"></i>Creer un compte</a></li>
						<li><a data-toggle="modal" data-target="#login "><i
								class="glyphicon glyphicon-user" ></i>Connectez-vous</a></li>

					</ul>
				</div>
				<!-- /.navbar-collapse --> </nav>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
						<input type="text" class="form-control input-sm" placeholder="Votre email" style="height: 51px; width: 550px; font-size: 20px;" required></input>
					</div>
					
	    		</div>
	    		<!-- //email -->
	    		<!-- mote de passe -->
	    		<div class="row top-margin-3">
	    			<div class="col-md-12">
						<input type="text" class="form-control input-sm" placeholder="Mot de passe" style="height: 51px; width: 550px; font-size: 20px;" required></input>
					</div>
					
	    		</div>
	    		<!-- //mote de passe -->
	    		<!-- souvenir -->
	    		<div class= "row top-margin-0">
					<div class="col-md-12 inscription-text-padding" style="padding-left:30px">
						<p><input type="checkbox" name="accept" value="0" />Se souvenir de moi </p>  
					</div>
				</div> 
	    		<!-- //souvenir -->
	    		<!-- button connectez-vous -->
	    		<div class= "row top-margin-0" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" href="#">
						<i class="icon-edit icon-white" ></i>Connectez-vous</a> 
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
	    			<p style= "text-align :center;">Vous n'avez pas de compte?</p>
	    		</div>
	    		<!-- //pas encore le compte -->
	    		<!-- creer un compte -->
	    		<div class= "row top-margin-0" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" href="#">
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

	<!-- //banner -->
</body>
</html>