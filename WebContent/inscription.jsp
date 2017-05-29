<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Inscription</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="ressources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/yomate-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/buttons.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/bootstrap-social.css" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<script src="ressources/js/bootstrap.js"> </script>
<!-- //js -->

<!-- header & footer -->
<script type="text/javascript"> 
	$(function(){
		$("#header").load("header_inscription.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
<!-- //header & footer -->

	
<body>
<!-- header -->
	<div id="header"></div>
<!-- //header -->
	<div class="container">
		<div class="row">
			<!-- LEFT COLUMN -->
			<div class="col-md-6">
				<div class="inscription-advantage">
					<h3>Pourquoi creer un compte?</h3>
					<ul class="list-group top-margin-3">
						<a class="list-group-item">
							<div>
								<div style="min-height:100px">
									<div style="float: left;">
										<img src="ressources/images/time_clock.png"
											class="img-thumbnail" style="height: 100px; height: 100px;">
									</div>
									<div style="float: left; margin-left: 10px">
										<p class="list-group-item-text"
											style="font-weight: bolder; font-size: 25px">Gagner du
											temps</p>
										<p class="list-group-item-text" style="font-size: 18px">dans
											vos recherches</p>
										<p class="list-group-item-text" style="font-size: 15px">effectuer
											simplement des recherches ciblees blabalabla</p>
									</div>
								</div>
							</div>
						</a>
						<a class="list-group-item">
							<div>
								<div style="min-height:100px">
									<div style="float: left;">
										<img src="ressources/images/bell.png" class="img-thumbnail"
											style="height: 100px; height: 100px;">
									</div>
									<div style="float: left; margin-left: 10px">
										<p class="list-group-item-text"
											style="font-weight: bolder; font-size: 25px">Soyez les
											premiers informes</p>
										<p class="list-group-item-text" style="font-size: 18px">dans
											vos recherches</p>
										<p class="list-group-item-text" style="font-size: 15px">effectuer
											simplement des recherches ciblees blabalabla</p>
									</div>
								</div>
							</div>
						</a>
						<a class="list-group-item">
							<div>
								<div style="min-height:100px">
									<div style="float: left;">
										<img src="ressources/images/fantasy.png" class="img-thumbnail"
											style="height: 100px; height: 100px;">
									</div>
									<div style="float: left; margin-left: 10px">
										<p class="list-group-item-text"
											style="font-weight: bolder; font-size: 25px">Profile
											matching intellectuel</p>
										<p class="list-group-item-text" style="font-size: 18px">dans
											vos recherches</p>
										<p class="list-group-item-text" style="font-size: 15px">effectuer
											simplement des recherches ciblees blabalabla</p>
									</div>
								</div>
							</div>
						</a>
						<a class="list-group-item">
							<div>
								<div style="min-height:100px">
									<div style="float: left;">
										<img src="ressources/images/eye.png" class="img-thumbnail"
											style="height: 100px; height: 100px;">
									</div>
									<div style="float: left; margin-left: 10px">
										<p class="list-group-item-text"
											style="font-weight: bolder; font-size: 25px">VIsibilite</p>
										<p class="list-group-item-text" style="font-size: 18px">dans
											vos recherches</p>
										<p class="list-group-item-text" style="font-size: 15px">effectuer
											simplement des recherches ciblees blabalabla</p>
									</div>
								</div>
							</div>
						</a>

					</ul>
				</div>
			</div>
			<!-- //RIGHT COLUMN -->
			<div class="col-md-6">
				<div class="row top-margin-3">
					<div class="col-md-12 inline-block">
						<div class="col-md-6 inscription-text-padding inline-block" style="padding-top:100px">
							<input type="text" class="form-control input-sm"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Nom"></input>
						</div>
						<div class="col-md-6 inscription-text-padding inline-block" style="padding-top:100px">
							<input type="text" class="form-control input-sm"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Prenom"></input>
						</div>
					</div>
				</div>
				<div class="row top-margin-3">
					<div class="col-md-6 inscription-text-padding"
						style="padding-left: 30px">
						<input type="text" class="form-control input-sm"
							style="height: 51px; width: 575px; font-size: 20px;"
							placeholder="Votre email"></input>
					</div>
				</div>
				<div class="row top-margin-3">
					<div class="col-md-12 inline-block">
						<div class="col-md-6 inscription-text-padding inline-block">
							<input type="text" class="form-control input-sm"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Mot de passe"></input>
						</div>
						<div class="col-md-6 inscription-text-padding inline-block">
							<input type="text" class="form-control input-sm"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Confirmation"></input>
						</div>
					</div>
				</div>
				<div class= "row top-margin-3">
					<div class="col-md-12 inline-block inscription-text-padding" style="padding-left:30px">
						<input type="radio" name="sex" value="0" style="font-size: 20px;"> Homme
						<input type="radio" name="sex" value="1" style="font-size: 20px;"> Femme

					</div>
				</div>
				<div class= "row top-margin-3">
					<div class="col-md-12 inscription-text-padding" style="padding-left:30px">
						<p><input type="checkbox" name="accept" value="0" /> J'accept Les conditions generales </p>  
					</div>
				</div> 
				<div class= "row top-margin-3" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" href="#">
						<i class="icon-edit icon-white" ></i>Creer mon compte</a> 
					</div>
				</div> 
				<div class= "row top-margin-3 bottom-margin-20" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-social btn-facebook" ><span class="fa fa-facebook"></span>Se connecter avec Facebook</a> 
					</div>
				</div> 
				
				
			</div>
		</div>
		<!-- //page content -->
		
		<!-- footer -->
		<div id="footer"></div>
		<!-- //footer -->
</body>
</html>