<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Espace Personnel</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Yomate"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="ressources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="ressources/css/buttons.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<script src="ressources/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- FlexSlider -->
<link rel="stylesheet" href="ressources/css/flexslider.css" type="text/css" media="screen" />
<script defer src="ressources/js/jquery.flexslider.js"></script>
<script type="text/javascript">
						$(window).load(function(){
						  $('.flexslider').flexslider({
							animation: "slide",
							start: function(slider){
							  $('body').removeClass('loading');
							}
						  });
						});
					  </script>
<!-- //FlexSlider -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
	
<body>
<!-- banner -->
	<div class="banner1">
		<div class="container">
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
							<a class="navbar-brand" href="index.html">Yomate <span>Trouvez vos colocataires parfaits</span></a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					  <ul class="nav navbar-nav">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="recherche.jsp">Recherche</a></li>
						<li class="active"><a href="espacePersonnel.jsp">Espace personel</a></li>
					  </ul>
					</div><!-- /.navbar-collapse -->
				</nav>
			</div>
		</div>
	</div>
<!-- //banner -->
<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class = "row">
				<div class="col-md-4">
					<h1 style= "color:#FF66FF; margin-left:10px">Espace Personnel</h1>
				</div>
			</div>
			<div class = "row">
				<br>
			</div>
			<div class = "row">
				<div class="col-md-2" style = "text-align:center">
					<img src="ressources/images/4.png" class="img-thumbnail" style = "width:100px;height:100px">
				</div>
				<div class="col-md-4">
					<p style = "font-weight:bolder;font-size:25px">Paul Babiste</p>
					<p>Homme, 23 ans</p>
				</div>
			</div class = "row">
			<div class = "row">
				<br>
			</div>
			<div class="col-md-12">
				<div class="col-md-8">
					<div class="sap_tabs"  style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">	
						<div id="horizontalTabProfilPhoto" style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Mon profile</span></li>
							  <li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab" style = "padding:10px 10px 10px 10px"><span>Mes photos</span></li>
							  <div class="clear"></div>
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">R�gion:</span>
											<span id = "region">Paris, France</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Animal de compagnie:</span>
											<span id = "haspet">Non</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation:</span>
											<span id = "situation">Etudiant</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Langue:</span>
											<span id = "langue">Fran�ais, Chinois</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Nationnalit�:</span>
											<span id = "nationnalite">Fran�aise</span>
										</div>
										<div class = "col-md-6">
											<span style = "font-weight: bold">Loisir:</span>
											<span id = "loisir">Basketball</span>
										</div>
									</div>
									<div class = "row">
										<div class = "col-md-6">
											<span style = "font-weight: bold">Situation familiale:</span>
											<span>C�libataire</span>
										</div>
										
									</div>
									<div class = "row">
										<div class = "col-md-6"></div>
										<div class = "col-md-2">
											<button class = "button button-action button-rounded button-small">Editer</button>
										</div>
									</div>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<img src="ressources/images/6.jpg" class="img-thumbnail" style= "height: 100px; width: 100px">
									<img src="ressources/images/8.jpg" class="img-thumbnail" style= "height: 100px; width: 100px">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row" style = "text-align:center">
		                <button class = "button button-caution button-rounded button-large">Cr�er une annonce</button>					
		            </div>
				</div>
			</div>
			
			<div class="col-md-12" style = "margin-top:10px;">
				<div class="col-md-8">
					<div class="sap_tabs" style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">	
						<div id="horizontalTabAnnonce" style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab" style = "padding:10px 10px 10px 10px"><span>Annonces favoris</span></li>
							  <li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab" style = "padding:10px 10px 10px 10px"><span>Mes annonces</span></li>
							  <div class="clear"></div>
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<ul class="list-group">
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1113</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class="list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class="list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class="list-group-item-text">Je cherche une colocataire...</p>  					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
										<a class="list-group-item">
											<div>
										    	<h4 class="list-group-item-heading" style = "font-size:18px">Annonce 1543</h4>
											    <div style = "height:100px">
											    	<div style="float: left;">
											    		<img src="ressources/images/1.png" class="img-thumbnail" style = "height:100px;height:100px;">
													</div>
													<div style="float: left;margin-left:10px">
														<p class = "list-group-item-text"  style = "font-weight: bolder; font-size:25px">Jean Gregory </p>
														<p class = "list-group-item-text"  style = "font-weight: bolder">26 ans, Paris, france</p>
														<p class = "list-group-item-text">Je cherche une colocataire...</p>					  
													</div>
													<div style="float: left;margin-left:200px">
														<button class = "button button-caution button-circle button-small" style = "font-weight : bolder; font-size:20px">X</button> 
													</div>
												</div>
										    </div>
										</a>
									</ul>
								</div>
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<ul class="list-group">
										<a class="list-group-item">AnnonceH1</a>
										<a class="list-group-item">Annonce2</a>
										<a class="list-group-item">Annonce3</a>
										<a class="list-group-item">Annonce4</a>
										<a class="list-group-item">Annonce5</a>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="list-group" style = "border-radius:5px 5px 5px 5px; border:3px solid #FF66FF;">
						<li class="list-group-item">Avis 1</li>
						<li class="list-group-item">Avis 2</li>
						<li class="list-group-item">Avis 3</li>
						<li class="list-group-item">Avis 1</li>
						<li class="list-group-item">Avis 1</li>
					</ul>		
				</div>
			</div>
			
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //contact -->
<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-row">
				<div class="col-md-3 footer-grids">
					<h4><a href="index.html">Deliccio</a></h4>
					<p><a href="mailto:info@example.com">mail@example.com</a></p>
					<p>+2 000 222 1111</p>
				</div>
				<div class="col-md-3 footer-grids">
					<h3>Navigation</h3>					
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="index.html">About us</a></li>
						<li><a href="menu.html">Menu</a></li>
						<li><a href="typo.html">Typo</a></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grids">
					<h3>Support</h3>
					<ul>
						<li><a href="services.html">Services</a></li>
						<li><a href="#">Help Center</a></li>
						<li><a href="#">Lemollisollis</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grids">	
					<h3>Newsletter</h3>
					<p>It was popularised in the 1960s with the release Ipsum. <p>
					<form>					 
					    <input type="text" class="text" value="Enter Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Email';}">
						<input type="submit" value="Go">					 
				 </form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">		
			<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>					
		</div>
	</div>
	<script src="ressources/js/easyResponsiveTabs.js" type="text/javascript"></script>
						<script type="text/javascript">
							$(document).ready(function () {
								$('#horizontalTabProfilPhoto').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true   // 100% fit in a container
								});
							});
							$(document).ready(function () {
								$('#horizontalTabAnnonce').easyResponsiveTabs({
									type: 'default', //Types: default, vertical, accordion           
									width: 'auto', //auto or any width like 600px
									fit: true   // 100% fit in a container
								});
							});
						</script>
<!--//footer-->	
<!-- for bootstrap working -->
		<script src="ressources/js/bootstrap.js"> </script>
<!-- //for bootstrap working -->
</body>
</html>