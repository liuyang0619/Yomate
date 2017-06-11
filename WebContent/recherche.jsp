<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Yomate - Page de Recherche</title>

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords" content="Yomate" />
<!-- //for-mobile-apps -->

<!-- css -->
<link href="<c:url value="${path}/ressources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/yomate-style.css" />"
	rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value="${path}/ressources/css/buttons.css" />"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="<c:url value="${path}/ressources/css/bootstrap-datetimepicker.min.css" />"
	rel="stylesheet" type="text/css" media="all" />
<!-- //css -->

<!-- js -->
<script src=<c:url value="${path}/ressources/js/jquery-1.11.1.min.js" />></script>
<script src=<c:url value="${path}/ressources/js/bootstrap.js" />></script>
<script src=<c:url value="${path}/ressources/js/moment.min.js" />></script>
<script src=<c:url value="${path}/ressources/js/bootstrap-datetimepicker.min.js" />></script>
<script src=<c:url value="${path}/ressources/js/yomate.js" />></script>
<!-- //js -->

<!-- initAutocomplete -->
<script>
	function initAutocomplete() {
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('search-city')), {
			types : [ '(cities)' ],
			componentRestrictions : {
				country : "fr"
			}
		});
	}
</script>
<!-- //initAutocomplete -->

<!-- header & footer -->
<script type="text/javascript">
	$(function() {
		$("#header").load("/Yomate/header.jsp");
		$("#footer").load("/Yomate/footer.jsp");
	});
</script>
<!-- //header & footer -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

<!-- datepicker1 -->
<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
			format : 'YYYY-MM-DD'
		});
	});
</script>
<!-- //datepicker1 -->

<!-- datepicker2 -->
<script type="text/javascript">
	$(function() {
		$('#datetimepicker2').datetimepicker({
			format : 'YYYY-MM-DD'
		});
	});
</script>
<!-- //datepicker2 -->

<!-- go espace personnel -->
<script type="text/javascript">
	function goToEP() {
		var user = getCookie("idUser");
		window.location.href = "/Yomate/espacePersonnel/" + user;
	}
</script>
<!-- //go espace personnel -->

<!-- search -->
<script type="text/javascript">
	function getValues() {
		var city = document.getElementById("search-city").value;
		var budget_min = document.getElementById("search-budget-min").value;
		var budget_max = document.getElementById("search-budget-max").value;
		var budget_max = document.getElementById("search-budget-max").value;
		var period_begin = document.getElementById("search-period-begin").value;
		var period_end = document.getElementById("search-period-end").value;
		var logement = document.getElementById("search-logement").value;

		var sex = $('input[name=sex]:checked').val();
		if (sex === undefined) {
			sex = "";
		}
		var age_min = document.getElementById("search-age-min").value;
		var age_max = document.getElementById("search-age-max").value;
		var animal = $('input[name=animal]:checked').val();
		if (animal === undefined) {
			animal = "";
		}
		var situation_familale = document
				.getElementById("search-situation-fam").value;
		var situation = document.getElementById("search-situation").value;
		var nationalite = document.getElementById("search-nationalite").value;
		var langue = document.getElementById("search-langue").value;
		var loisir = document.getElementById("search-loisir").value;
		
		var searchCriteres = new Object();
		searchCriteres.lieu = city.split(",")[0].toLowerCase();
		searchCriteres.budget = budget_max;
		searchCriteres.budgetMax = budget_max;
		searchCriteres.budgetMin = budget_min;
		searchCriteres.dateDebut = period_begin;
		searchCriteres.dateFin = period_end;
		searchCriteres.sex = sex;
		searchCriteres.ageMin = age_min;
		searchCriteres.ageMax = age_max;
		searchCriteres.haspet = animal;
		searchCriteres.situationFam = situation_familale;
		searchCriteres.profession = situation;
		searchCriteres.nationnalite = nationalite;
		searchCriteres.loisir = loisir;
		searchCriteres.language = langue;
		searchCriteres.logement = logement;
		return searchCriteres;
	}

	function searchCritere() {
		var values = getValues();
		if (values.lieu === "" && values.budgetMin === "" && values.budgetMax === "" && values.dateDebut === "" && values.dateFin === "" && values.logement === ""
			&& values.sex === "" && values.ageMin === "" && values.ageMax === "" && values.haspet === "" && values.situationFam === "" && values.profession === ""
				&& values.nationnalite === "" && values.language === "" && values.loisir === "") {
			alert("Saisissez au moins un critère, svp");
			return;
		}
		post("/Yomate/search/criteres/", values);
	}
</script>
<!-- //search -->

<!-- create annonce -->
<script type="text/javascript">
	function createAnnonce() {
		var values = getValues();
		if (values.lieu === "" || values.budgetMin === "" || values.budgetMax === "" || values.dateDebut === "" || values.dateFin === "" || values.logement === ""
			|| values.sex === "" || values.ageMin === "" || values.ageMax === "" || values.haspet === "" || values.situationFam === "" || values.profession === ""
				|| values.nationnalite === "" || values.language === "" || values.loisir === "") {
			alert("Veuillez remplir tous les champs pour créer une annonce, svp");
			return;
		}
		values.userId = getCookie("idUser");
		post("/Yomate/search/createAnnonce", values);
	}
</script>
<!-- //create annonce -->
	
<!-- set search field -->
<script type="text/javascript">
	function setSearchField(city, budgetMax, budgetMin, dateDebut, dateFin,
			sex, ageMin, ageMax, animal, situationFam, profession,
			nationnalite, loisir, language, logement) {
		var hasSearchValue = false;
		document.getElementById("search-city").value = city;
		document.getElementById("search-budget-min").value = budgetMin;
		document.getElementById("search-budget-max").value = budgetMax;
		document.getElementById("search-period-begin").value = dateDebut;
		document.getElementById("search-period-end").value = dateFin;
		document.getElementById("search-logement").value = logement;

		if (sex === "0") {
			$('#sex-h').prop('checked', true);
		}
		if (sex === "1") {
			$('#sex-f').prop('checked', true);
		}
		document.getElementById("search-age-min").value = ageMin;
		document.getElementById("search-age-max").value = ageMax;
		if (animal === "0") {
			$('#animal-non').prop('checked', true);
		}
		if (animal === "1") {
			$('#animal-oui').prop('checked', true);
		}
		document.getElementById("search-situation-fam").value = situationFam;
		document.getElementById("search-situation").value = profession;
		document.getElementById("search-nationalite").value = nationnalite;
		document.getElementById("search-langue").value = language;
		document.getElementById("search-loisir").value = loisir;

		if (hasSearchValue === false) {
			$('#no-result').hide();
		}
	}
</script>
<!-- //set search field -->

<!-- set result list -->
<script type="text/javascript">
	function setResultList(jsonResults) {
		if (jsonResults == "return") {
			$('#result-nb').hide();
			$('#no-result').hide();
		} else if (jsonResults === "") {
			$('#result-nb').hide();
			$('#no-result').show();
		} else {
			$('#no-result').hide();
			var results = JSON.parse(jsonResults);
			for (var i = 0; i < results.length; i++) {
				var listitem = "<a href=/Yomate/annonce/"+results[i]['idAnnonce']+" class='list-group-item'>"
						+ "<div>"
						+ "<h4 class='list-group-item-heading' style = 'font-size:18px'>Annonce 00"
						+ results[i]['idAnnonce']
						+ "</h4>"
						+ "<div style = 'height:100px'>"
						+ "<div style='float: left;'>"
						+ "<img src='/Yomate/ressources/" + results[i]['image'] + "' class='img-thumbnail' style = 'height:100px;height:100px;'>"
						+ "</div>"
						+ "<div style='float: left;margin-left:10px'>"
						+ "<p class='list-group-item-text'  style = 'font-weight: bolder; font-size:25px'>"
						+ setUCfirst(results[i]['proposer_prenom'])
						+ " "
						+ results[i]['proposer_nom'].toUpperCase()
						+ "</p>"
						+ "<p class='list-group-item-text'  style = 'font-weight: bolder'>"
						+ getSex(results[i]['proposer_sex'])
						+ ", "
						+ jsGetAge(results[i]['proposer_birthday'])
						+ " ans, "
						+ setUCfirst(results[i]['lieu'])
						+ ", France</p>"
						+ "<p class='list-group-item-text'>"
						+ results[i]['description']
						+ "</p>"
						+ "</div>"
						+ "</div>" + "</div>" + "</a>";
				$('#result-list-group').append(listitem);
			}
		}
	}
</script>
<!-- //set result list -->
</head>

<body>
	<!-- header -->
	<div id="header"></div>
	<!-- //header -->

	<!-- page content -->
	<div class="container">
		<div class="row">
			<!-- LEFT COLUMN -->
			<div class="col-md-4">

				<!-- filtre d'annonce -->
				<div class="search-notices-filter">
					<h3>Filtre d'announce</h3>
					<div class="row top-margin-3">
						<div class="col-md-3 search-filter-item-name">Ville</div>
						<div class="col-md-9">
							<input type="text" class="form-control input-sm" id="search-city"
								placeholder="Nom de ville" autocomplete="on"></input>
						</div>
					</div>

					<div class="row top-margin-3">
						<div class="col-md-3 search-filter-item-name">Budget</div>
						<div class="col-md-9">
							<div class="col-md-6 padding-0">
								<input type="number" class="form-control input-sm" min="0"
									placeholder="min" id="search-budget-min"></input>
							</div>
							<div class="col-md-6 padding-0">
								<input type="number" class="form-control input-sm" min="0"
									placeholder="max" id="search-budget-max"></input>
							</div>
						</div>
					</div>

					<!-- begin datepicker -->
					<div class="row top-margin-3">
						<div class="col-md-3 search-filter-item-name">Durée</div>
						<div class="col-md-9">
							<div class="col-md-2 padding-0"
								style="font-weight: bold; vertical-align: middle;">Du</div>
							<div class="col-md-10 padding-0">
								<div class="input-group" id="datetimepicker1">
									<input type="text" class="form-control input-sm"
										id="search-period-begin" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- //begin datepicker -->

					<!-- //end datepicker -->
					<div class="row margin-0">
						<div class="col-md-3 margin-0"></div>
						<div class="col-md-9 margin-0">
							<div class="col-md-2 padding-0 margin-0"
								style="font-weight: bold; vertical-align: middle;">Au</div>
							<div class="col-md-10 padding-0 margin-0">
								<div class="input-group" id="datetimepicker2">
									<input type="text" class="form-control input-sm"
										id="search-period-end" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- //end datepicker -->

					<!-- filtre d'annonce -->
					<div class="row top-margin-3">
						<div class="col-md-3 search-filter-item-name">Logement</div>
						<div class="col-md-9">
							<select class="form-control input-sm" id="search-logement">
								<option value="" selected disabled></option>
								<option value="0">J'ai besoin de logement</option>
								<option value="1">J'ai un logement</option>
							</select>
						</div>
					</div>
				</div>
				<!-- //filtre d'annonce -->


				<!-- filtre de profil -->
				<div class="search-profile-filter">
					<h3>Vous cherchez un(e) colocataire :</h3>
					<!-- sexe -->
					<div class="row top-margin-3">
						<div class="col-md-4 search-filter-item-name">Sexe</div>
						<div class="col-md-8 inline-block" id="search-sex">
							<input type="radio" id="sex-h" name="sex" value="0" style="font-size: 20px;"> Homme
							<input type="radio" id="sex-f" name="sex" value="1" style="font-size: 20px;"> Femme
						</div>
					</div>
					<!-- //sexe -->

					<!-- age -->
					<div class="row top-margin-3">
						<div class="col-md-4 search-filter-item-name">Age</div>
						<div class="col-md-8">
							<div class="col-md-6 padding-0">
								<input type="number" class="form-control input-sm" min="0"
									placeholder="min" id="search-age-min"></input>
							</div>
							<div class="col-md-6 padding-0">
								<input type="number" class="form-control input-sm" min="0"
									placeholder="max" id="search-age-max"></input>
							</div>
						</div>
					</div>
					<!-- //age -->

					<!-- Animal -->
					<div class="row top-margin-3">
						<div class="col-md-4 search-filter-item-name">Animal</div>
						<div class="col-md-8 inline-block" id="search-animal">
							<input type="radio" id="animal-oui" name="animal" value="1" style="font-size: 20px;"> oui
							<input type="radio" id="animal-non" id="" name="animal" value="0" style="font-size: 20px;"> non
						</div>
					</div>
					<!-- //Animal -->

					<!-- Situation Familiale -->
					<div class="row top-margin-3">
						<div class="col-md-4 search-filter-item-name">Situation Fam</div>
						<div class="form-group col-md-8">
							<select id="search-situation-fam" name="search-situation-fam"
								class="form-control input-sm">
								<option value=""></option>
								<option value="Célibataire">Célibataire</option>
								<option value="Couple">Couple</option>
								<option value="Marié">Marié</option>
								<option value="Autre">Autre</option>
							</select>
						</div>
					</div>
					<!-- //Situation Familiale -->

					<!-- Situation -->
					<div class="row">
						<div class="col-md-4 search-filter-item-name">Profession</div>
						<div class="form-group col-md-8">
							<select id="search-situation" name="search-situation"
								class="form-control input-sm">
								<option value=""></option>
								<option value="39">Etudiant</option>
								<option value="69">Salarié</option>
								<option value="68">Retraité</option>
								<option value="13">Autre cadres</option>
							</select>
						</div>
					</div>
					<!-- //Situation -->

					<!-- Nationalite -->
					<div class="row">
						<div class="col-md-4 search-filter-item-name">Nationalité</div>
						<div class="col-md-8 form-group">
							<select id="search-nationalite" name="search-nationalite"
								class="form-control input-sm">
								<option value=""></option>
								<option value="64">Française</option>
								<option value="41">Chinoise</option>
								<option value="83">Italienne</option>
								<option value="148">Russee</option>
								<option value="14">Bahamienne</option>
								<option value="196">Autre</option>
							</select>
						</div>
					</div>
					<!-- //Nationalite -->

					<!-- Langue -->
					<div class="row">
						<div class="col-md-4 search-filter-item-name">Langue</div>
						<div class="col-md-8 form-group">
							<select id="search-langue" name="search-langue"
								class="form-control input-sm">
								<option value=""></option>
								<option value="27">Français</option>
								<option value="20">Chinois mandarin</option>
								<option value="3">Anglais</option>
								<option value="1">Allemand</option>
								<option value="36">Italien</option>
								<option value="73">Autre</option>
							</select>
						</div>
					</div>
					<!-- //Langue -->

					<!-- Loisir -->
					<div class="row">
						<div class="col-md-4 search-filter-item-name">Loisir</div>
						<div class="col-md-8 form-group">
							<select id="search-loisir" name="selectLoisir"
								class="form-control input-sm">
								<option value=""></option>
								<option value="2">Voyage</option>
								<option value="3">Sport</option>
								<option value="5">Cuisine</option>
								<option value="19">Jeux vidéo</option>
								<option value="9">Lecture</option>
								<option value="35">Autre</option>
							</select>
						</div>
					</div>
					<!-- //Loisir -->
				</div>
				<!-- //filtre de profil -->

				<!-- buttons -->
				<div class="search-buttons">
					<!-- search button -->
					<div class="row">
						<a class="btn btn-success search-btn" onclick="searchCritere()"> <i
							class="icon-search icon-white"></i> Rechercher
						</a>
					</div>
					<!-- //search button -->
				</div>
				<!-- //buttons -->
			</div>
			<!-- //LEFT COLUMN -->


			<!-- RIGHT COLUMN -->
			<div class="col-md-8">

				<!-- amelioration de profil -->
				<div class="search-improve-profile" style="cursor: pointer;"
					onclick="goToEP()">
					<h3>3 étapes pour un meilleur matching de profile</h3>
					<div class="row top-margin-5">
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span class="glyphicon glyphicon-user search-improve-icon"></span>
							</div>
							<p>Ajouter un photo</p>
						</div>
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span
									class="glyphicon glyphicon-question-sign search-improve-icon"></span>
							</div>
							<p>Répondre aux 5 questions</p>
						</div>
						<div class="col-md-4">
							<div class="glyphicon-ring">
								<span class="glyphicon glyphicon-th-list search-improve-icon"></span>
							</div>
							<p>Compléter votre profile</p>
						</div>
					</div>
				</div>
				<!-- //am??lioration de profil -->

				<!-- resultats de recherche -->
				<div class="search-result">
					<div id="result-nb" style="font-size:">Résultats :</div>
					<ul class="list-group top-margin-3" id="result-list-group">
					</ul>
					<div class="col-md-12" style="text-align: center; color: #000000;"
						id="no-result">Désolé, aucun résultat ne correspond à vos
						critères de sélection.</div>
				</div>
				<!-- //resultats de recherche -->
			</div>
			<!-- //RIGHT COLUMN -->
		</div>

		<!-- create annonce button -->
		<div class="row">
			<div class="search-create-annonce">
				<p>Pas de résultats satisfaisants ? Envie d'ajouter une priorité à vos critères de cherche ?</p>
				<a class="btn btn-warning"onclick="createAnnonce()"><i
					class="icon-edit icon-white"></i>Créer votre Annonce</a>
			</div>
		</div>
		<!-- create annonce button -->
	</div>

	<!-- //page content -->

	<!-- footer -->
	<div id="footer"></div>
	<!-- //footer -->

	<!-- set value -->
	<script type="text/javascript">
		setResultList('${results}');
		setSearchField('${city}', '${budgetMax}', '${budgetMin}',
				'${dateDebut}', '${dateFin}', '${sex}', '${ageMin}',
				'${ageMax}', '${animal}', '${situationFam}', '${profession}',
				'${nationnalite}', '${loisir}', '${language}', '${logement}');
	</script>
	<!-- //set value -->

	<!-- for autoComplete working -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBYWCDw3df4KmbFKZ-9e51hPizIipPnlM&libraries=places&callback=initAutocomplete"
		async defer></script>
	<!-- //for autoComplete working -->
</body>
</html>