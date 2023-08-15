<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Libro" import="java.util.List" import="model.Utente" import="DAO.libroDAO"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">

<head>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/b60ea6b0a3.js" crossorigin="anonymous"></script>
    <!--Owl Carousel-->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
        integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
        crossorigin="anonymous" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" />

    <!--Custom header css-->
    <link href="css/header.css" rel="stylesheet">

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

    <%-- Controllo del ruolo dell'utente --%>
    <% Utente utente = (Utente) session.getAttribute("utente");
       boolean isAdmin = (utente != null && utente.getTipo().equals("admin")); %>

    <div class="header_section">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="logo"> <% if (isAdmin) { %>
                       
                           <a href="homeAdmin.jsp">
                        
                        <% }else { %>
                            <a href="home.jsp">
                        <%} %><img src="img/Biblioteca.png"></a></div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                  
                        <li class="nav-item active">
                            <a class="nav-link" href="libri.jsp">libri disponibili</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="leMiePrenotazioni.jsp">i miei libri afittati</a>
                        </li>

                        <%-- Controllo del ruolo per la visualizzazione del link --%>
                        <% if (isAdmin) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="homeAdmin.jsp">Home Admin</a>
                        </li>
                        <% }else { %>
                              <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home</a>
                        </li>
                        <%} %>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

   <main>
   
    <div class="container my-3 rounded border bg-dark" style="min-width: 75%; text-align: center;">
        <div class="container p-5 my-2 bg-dark text-white">
            <h1 style="color: white; font-size: 28px;">I nostri libri</h1>
        </div>
        <div class="container p-3 my-2 bg-dark text-white">
    <form action="servlet" method="get" class="d-flex justify-content-center">
        <input type="hidden" name="operazione" value="ricerca">
        <input type="text" name="titolo" class="form-control me-2" placeholder="Cerca per titolo">
        <button type="submit" class="btn btn-primary">Cerca libro </button>
    </form>
</div>
        <div class="row">
            <!-- Elenco libri -->
            <% List<Libro> listaL = libroDAO.listaLibri();
            Utente u=(Utente)session.getAttribute("utente");
            if (listaL != null) {
                for (Libro l : listaL) { %>
            <div class="col-md-8 col-lg-4 col-xl-3 col-xxl-2 my-3">
                <div class="cards_wrapper">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= l.getNomeLibro() %></h5>
                            <p class="card-text"><%= l.getGenere() %></p>
                            <%  String nCopie=libroDAO.getNumeroCopieRimaste(l.getIdLibro()); %>
                            <p class="card-text">Il numero di copie rimaste sono <%= nCopie%></p>
                            <% if(l.getCopie()> 0) { %>
                                <form class="px-md-2" action="servlet" method="post" autocomplete="on">
                                    <input type="hidden" name="operazione" value="prenota">
                                    <input type="hidden" name="idUtente" value="<%=u.getIdUtente() %>">
                                    <input type="hidden" name="idLibro" value="<%=l.getIdLibro() %>">
                                    <input type="submit" value="Prenota" class="btn btn-primary btn-outline-light btn-lg">
                                </form>
                            <% } else { %>
                               <h5 style="color: red; font-size: 18px; font-weight: bold;">Libro terminato</h5>

                            <% } %>
                             <% if (isAdmin) { %>
                             <form class="px-md-2" action="servlet" method="post" autocomplete="on">
                                    <input type="hidden" name="operazione" value="modificaLibro">
                                    <input type="hidden" name="idUtente" value="<%=u.getIdUtente() %>">
                                    <input type="hidden" name="idLibro" value="<%=l.getIdLibro() %>">
                                    <input type="submit" value="modifica dati " class="btn btn-primary btn-outline-light btn-lg">
                                </form>
                             
                             <%} %>
                            
                        </div>
                    </div>
                </div>
            </div>
            <% }
            } %>
        </div>
    </div>
</main>
</body>
</html>

