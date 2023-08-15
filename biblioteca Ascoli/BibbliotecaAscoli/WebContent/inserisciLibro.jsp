<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--FontAwesome-->
<script src="https://kit.fontawesome.com/b60ea6b0a3.js"
	crossorigin="anonymous"></script>
<!--Custom css-->
<link href="css/header.css" rel="stylesheet">
<link href="css/registrazione.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

</head>

<body>
 <!--header section start -->
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <div class="logo"><a href="homeAdmin.jsp"><img src="img/Biblioteca.png"></a></div>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a class="nav-link" href="homeAdmin.jsp">Home</a>
                     </li>
                      <li class="nav-item active">
                        <a class="nav-link" href="libri.jsp">libri disponibili</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="inserisciLibro.jsp">inserisci nuovo libro </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="leMiePrenotazioni.jsp">i tuoi libri in prestito  </a>
                     </li>
                       <li class="nav-item">
                        <a class="nav-link" href="TutteLePrenotazioni.jsp">vedi tutti i libri in prestito  </a>
                     </li>
                      <li class="nav-item">
                        <a class="nav-link" href="index.jsp">logout</a>
                     </li>
                  
                    
                    
                  </ul>
               </div>
            </nav>
         </div>
      </div>
	<section class="h-100 h-custom" style="background-color: #ffffff00;">
		<div class="container registrazione py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						
							
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registra nuovo
								libro</h3>


							<form class="px-md-2" action="servlet" method="post"
								autocomplete="on">
								<input type="hidden" name="operazione"
									value="registrazioneLibro">

								<!-- Nome Utente -->
								<div class="form-floating form-outline mb-4">
									<input type="text" class="form-control" id="username"
										placeholder="Nome Libro" name="username"> <label
										for="username">Nome libro</label>
								</div>

								<!-- Email -->
								<div class="form-floating mb-3 mt-3">
									<input type="text" class="form-control" id="email"
										placeholder="genere" name="genere" required> <label
										for="email" style="color: black;">genere</label>
								</div>

								<!-- Numero di copie -->
								<div class="form-floating mt-3 mb-3">
									<input type="number" class="form-control" id="copies"
										placeholder="Numero di copie" name="copies" required>
									<label for="copies" style="color: black;">Numero di
										copie</label>
								</div>

								<br>

								<button type="submit" class="btn btn-dark btn-lg mb-1"
									value="Completa registrazione">Registra</button>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>