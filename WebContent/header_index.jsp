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
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					  <ul class="nav navbar-nav">
						<li><a href="aide.jsp"><i class="glyphicon glyphicon-home"></i>Aide</a></li>
						<li><a href="inscription.jsp"><i class="glyphicon glyphicon-user"></i>Creer un compte</a></li>
						<li><a href="javascript:openLogin();"><i class="glyphicon glyphicon-user"></i>Connectez-vous</a></li>
					  </ul>
					</div><!-- /.navbar-collapse -->
				</nav>
			</div>
		</div>
	</div>
<!-- //banner -->
</body>
</html>