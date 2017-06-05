<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
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
<link href="<c:url value="${path}/ressources/css/bootstrap.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/font-awesome.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/bootstrap-social.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" /> ></script>
<script src=<c:url value="${path}/ressources/js/yomate.js" /> ></script>
<!-- //js -->

<!-- header & footer -->
<script type="text/javascript"> 
	$(function(){
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<!-- sign up -->
<script type="text/javascript">
function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function signup() {
	$('#warning-msg-nom').hide();
	$('#warning-msg-email').hide();
	$('#warning-msg-mdp').hide();
	$('#warning-msg-sex').hide();
	$('#warning-msg-accept').hide();
	var nom = document.getElementById("nom_signup").value;
	var prenom = document.getElementById("prenom_signup").value;
	var email = document.getElementById("email_signup").value;
	var password = document.getElementById("mdp_signup").value;
	var re_password = document.getElementById("re_mdp_signup").value;
	var sex = $('input[name=sex]:checked').val();
	var accept_checked = document.getElementById('accept_signup').checked;
	var error = false;
	
	if (sex === undefined) {
		$('#warning-msg-sex').show();
		error = true;
	}
	if (nom === "" || prenom === "") {
		$('#warning-msg-nom').show();
		error = true;
	}
	if (!validateEmail(email)) {
		$('#warning-msg-email').show();
		error = true;
	}
	if (password === "") {
		$('#warning-msg-mdp').show();
		document.getElementById("warning-msg-mdp").innerHTML= "Saisissez votre mot de passe, svp";
		error = true;
	} else if (password !== re_password) {
		$('#warning-msg-mdp').show();
		document.getElementById("warning-msg-mdp").innerHTML= "Vérifiez votre mot de passe, svp";
		error = true;
	}
	if (accept_checked === false) {
		$('#warning-msg-accept').show();
		error = true;
	}

	if (!error) {
		var signupInfo = new Object();
		signupInfo.nom = nom;
		signupInfo.prenom = prenom;
		signupInfo.email = email;
		signupInfo.password = password;
		signupInfo.sex = sex;
		post('user/signup', signupInfo);
	}
}

function GetRequestResult(result) {
	if (result === "error") {
		alert("Cette adresse email est déjà utilisée comme identifiant");
	}
}

</script>
<!-- //sign up -->

<!-- Hide warning message-->
<script type="text/javascript">
function hideAllwarnings() {
	//alert("Here");
	$('#warning-msg-nom').hide();
	$('#warning-msg-email').hide();
	$('#warning-msg-mdp').hide();
	$('#warning-msg-sex').hide();
	$('#warning-msg-accept').hide();
}
</script>
<!-- //Hide warning message-->

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
							<div style="min-height:100px">
								<div style="float: left;">
									<img src="/Yomate/ressources/images/time_clock.png"
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
						</a>
						<a class="list-group-item">
							<div style="min-height:100px">
								<div style="float: left;">
									<img src="/Yomate/ressources/images/bell.png" class="img-thumbnail"
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
						</a>
						<a class="list-group-item">
							<div style="min-height:100px">
								<div style="float: left;">
									<img src="/Yomate/ressources/images/fantasy.png" class="img-thumbnail"
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
						</a>
						<a class="list-group-item">
							<div style="min-height:100px">
								<div style="float: left;">
									<img src="/Yomate/ressources/images/eye.png" class="img-thumbnail"
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
						</a>

					</ul>
				</div>
			</div>
			<!-- //RIGHT COLUMN -->
			<div class="col-md-6">
				<div class="row top-margin-3">
					<div class="col-md-12 inline-block">
						<div class="col-md-6 inscription-text-padding inline-block" style="padding-top:100px">
							<input type="text" class="form-control input-sm" id="nom_signup"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Nom"></input>
						</div>
						<div class="col-md-6 inscription-text-padding inline-block" style="padding-top:100px">
							<input type="text" class="form-control input-sm" id="prenom_signup"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Prenom"></input>
						</div>
					</div>
				</div>
				<div class= "row top-margin-0" >
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg-nom">
						Saisissez votre nom, svp.
					</div>
				</div> 
				
				<div class="row top-margin-3">
					<div class="col-md-6 inscription-text-padding"
						style="padding-left: 30px">
						<input type="text" class="form-control input-sm" id="email_signup"
							style="height: 51px; width: 575px; font-size: 20px;"
							placeholder="Votre email"></input>
					</div>
				</div>
				<div class= "row top-margin-0" >
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg-email">
						Saisissez une adresse email valide, svp.
					</div>
				</div> 
				
				<div class="row top-margin-3">
					<div class="col-md-12 inline-block">
						<div class="col-md-6 inscription-text-padding inline-block">
							<input type="password" class="form-control input-sm" id="mdp_signup"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Mot de passe"></input>
						</div>
						<div class="col-md-6 inscription-text-padding inline-block">
							<input type="password" class="form-control input-sm" id="re_mdp_signup"
								style="height: 51px; width: 300px; font-size: 20px;"
								placeholder="Confirmation"></input>
						</div>
					</div>
				</div>
				<div class= "row top-margin-0" >
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg-mdp">
						Erreur de mot de passe.
					</div>
				</div> 
				
				<div class= "row top-margin-3">
					<div class="col-md-12 inline-block inscription-text-padding" style="padding-left:30px" id="sex_signup">
						<input type="radio" name="sex" value="0" style="font-size: 20px;"> Homme
						<input type="radio" name="sex" value="1" style="font-size: 20px;"> Femme
					</div>
				</div>
				<div class= "row top-margin-0" >
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg-sex">
						Choisissez votre sexe, svp.
					</div>
				</div> 
				
				<div class= "row top-margin-3"">
					<div class="col-md-12 inscription-text-padding" style="padding-left:30px">
						<p><input type="checkbox" id="accept_signup" name="accept" value="0"/> J'accept Les conditions generales </p>  
					</div>
				</div> 
				
				<div class= "row top-margin-0" >
					<div class="col-md-12" style="text-align:center;color:#ff0000;" id="warning-msg-accept">
						Acceptez la Condition générale, svp.
					</div>
				</div> 
				
				<div class= "row top-margin-3" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-warning btn-search" onclick="signup()">
						<i class="icon-edit icon-white"></i>Creer mon compte</a> 
					</div>
				</div> 
				<div class= "row top-margin-3 bottom-margin-20" >
					<div class="col-md-12 inscription-text-padding" style="text-align :center;">
						<a class="btn btn-social btn-facebook" ><span class="fa fa-facebook"></span>Se connecter avec Facebook</a> 
					</div>
				</div> 
			</div>
		</div>
	</div>
	<!-- //page content -->
	
	<!-- Hide warning message-->
	<script type="text/javascript">
		hideAllwarnings();
		GetRequestResult('${result}');
	</script>
	<!-- //Hide warning message-->
	
	<!-- footer -->
	<div id="footer"></div>
	<!-- //footer -->
</body>
</html>