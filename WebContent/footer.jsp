<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head/>
<body>
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
</body>
</html>