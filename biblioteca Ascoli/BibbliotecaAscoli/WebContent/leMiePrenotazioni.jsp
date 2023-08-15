<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Utente" import="model.Prestito" import="DAO.prestitoDAO" import="java.util.List"
    import="model.Libro"  import="DAO.libroDAO"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom header css -->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- Custom header css -->
    <link href="css/header.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Responsive -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- owl stylesheets -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <header class="header_section fixed-top">
        <% Utente u = (Utente) session.getAttribute("utente");
        boolean isAdmin = (u != null && u.getTipo().equals("admin")); %>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="logo"><% if (isAdmin) { %>
                       
                           <a href="homeAdmin.jsp">
                        
                        <% }else { %>
                            <a href="home.jsp">
                        <%} %><img src="img/Biblioteca.png"></a></div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="libri.jsp">Libri disponibili</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="leMiePrenotazioni.jsp">I miei libri affittati</a>
                        </li>

                        <%-- Controllo del ruolo per la visualizzazione del link --%>
                        <% if (isAdmin) { %>
                            <li class="nav-item">
                                <a class="nav-link" href="homeAdmin.jsp">Home Admin</a>
                            </li>
                        <% } else { %>
                            <li class="nav-item active">
                                <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                        <% } %>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

<div class="container border bg-white rounded" style="text-align: center; margin-top: 150px;">
    <h1>I tuoi prestiti</h1>
    <table class="table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">#ID</th>
                <th scope="col">Nome libro</th>
                <th scope="col">Data</th>
                <th scope="col">Stato</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Prestito> lista = prestitoDAO.getPrestitiByUtente(u.getIdUtente());

                for (Prestito p : lista) {
                    Libro b = libroDAO.getLibroById(p.getIdLibro());

            %>
            <tr>
                <th scope="row"><%= p.getIdPrestito() %></th>
                <td><%= b.getNomeLibro() %></td>
                <td><%= p.getData() %></td>
                <td>
                    <% if (!p.isRestituito()) { %>
                    Ancora da restituire
                    <% } else { String dataP= prestitoDAO.getDataRestituzioneById(p.getIdPrestito());
                    %>

                    Restituito in data: <%= dataP %>
                    <% } %>
                </td>
                <td>
                    <% if (!p.isRestituito()) { %>
                    <form action="servlet" method="post">
                        <input type="hidden" name="operazione" value="restituisciLibro">
                        <input type="hidden" name="idPrestito" value="<%= p.getIdPrestito() %>">
                        <input type="hidden" name="idLibro" value="<%= b.getIdLibro() %>">
                        <input type="submit" class="btn btn-primary" value="Restituisci">
                    </form>
                    <% } %>
                </td>
            </tr>
            <% }
            %>
        </tbody>
    </table>
</div>
</body>
</html>

