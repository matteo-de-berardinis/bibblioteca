<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Libro" import="java.util.List" import="model.Utente" import="DAO.libroDAO"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--Custom header css-->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">

    <!--Bootstrap Icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<!-- Header -->





<body>
    
	<%Utente utente = (Utente) session.getAttribute("utente");
    boolean isAdmin = (utente != null && utente.getTipo().equals("admin")); 
	int idLibro=(int)session.getAttribute("idLibro");
	Libro b=libroDAO.getLibroById(idLibro);
	%>
	 <div class="header_section">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="logo"><a href="homeAdmin.jsp"><img src="img/Biblioteca.png"></a></div>
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
        
        <form action = "servlet" method = "post" autocomplete="on" >
              <input type="hidden" name="operazione" value="modificaDatiLibro">
              <input type="hidden" name="idLibro" value="<%=b.getIdLibro()   %>">
            <div class="container rounded">
                <div class="row d-flex justify-content-center"  >
                
                <div class="table-responsive" >
                    
                <table class="table" >
              
            <thead class="table-dark">
                    <tr>  
                        <td>
                           <h3 style="color: white;">Modifica i dati del libro</h3> </th></td>
                       <th></th>
                    
                        </tr> 
                   
                    </thead>
                 
            <thead class="table-light">
            
            <tr>
            <th><label for="username">Nome Libro:</label> </th>
            <td><input type="text" class="form-control-sm" name="nomeLibro" id="username" value="<%=b.getNomeLibro() %>"> 
            </td><br>
            </tr>

            <tr>  
            <th> <label for="nome">genere:</label></th>
            <td><input  type="text" class="form-control-sm" name="genere" id="nome" value="<%=b.getGenere() %>"> 
           </td>
            </tr> 

            <tr>  
                <th> <label for="cognome">numero copie :</label></th>
                <td><input  type="number" class="form-control-sm" name="nCopie" id="cognome" value="<%=b.getCopie() %>"> 
               </td>
                </tr> 
            
            <tr>

                



            

          

        </thead>
    </table>
                </div>
                </div> 
</div>   
        <div class="btn-group-sm" align="center">
            <input type="submit" role="button" class="btn-close-white" value="Aggiorna i Dati">
      
		</div>
    </form>
	</main>



	<footer>
	</footer>
 

</body>
</html>