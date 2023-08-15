package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.libroDAO;
import DAO.prestitoDAO;
import DAO.utenteDAO;
import model.Libro;
import model.Prestito;
import model.Utente;

@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public servlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("operazione");
		System.out.println(action);

		switch (action) {
		case "registrazioneUtente":
			registrazioneUtente(request, response);
			break;
		case "login":
			login(request, response);
			break;
		case "prenota":
			prenotazioneUtenteLibro(request, response);
			break;
		case "restituisciLibro":
			restituisciLibro(request, response);
			break;
		case "registrazioneLibro":
			registrazioneLibro(request,response);
			break;
		case "modificaLibro":
			modificaLibro(request,response);
			break;
		case "modificaDatiLibro":
			modificaDatiLibro(request,response);
			break;
		case "ricerca":
			ricercaLibro(request,response);
			break;
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void registrazioneUtente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		Utente u = new Utente(email, pass, username);
		utenteDAO.inserisciUtente(u);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession sessione = request.getSession(true);

	    String email = request.getParameter("email");
	    String pass = request.getParameter("pass");
	    List<Utente> lista = utenteDAO.listaUtenti();
	    boolean utenteTrovato = false;
	    boolean isAdmin = false;
	    
	    for (Utente u : lista) {
	        if (u.getEmail().equals(email) && u.getPassword().equals(pass)) {
	            sessione.setAttribute("utente", u);
	            List<Libro> listaLibri = libroDAO.listaLibri();
	            sessione.setAttribute("listaLibri", listaLibri);
	            utenteTrovato = true;
	            if (u.getTipo().equals("admin")) {
	                isAdmin = true;
	            }
	            break;
	        }
	    }
	    
	    if (utenteTrovato) {
	    	Utente u=(Utente)sessione.getAttribute("utente");
	        if (u.getTipo().equals("admin")) {
	            RequestDispatcher dispatcher = request.getRequestDispatcher("homeAdmin.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
	            dispatcher.forward(request, response);
	        }
	    } else {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("errore.jsp");
	        dispatcher.forward(request, response);
	    }
	}

	private void prenotazioneUtenteLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		int idUtente = Integer.parseInt(request.getParameter("idUtente"));
		int idLibro = Integer.parseInt(request.getParameter("idLibro"));
		Date dataCorrente = new Date();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String dataPrenotazioneStringa = formatter.format(dataCorrente);
		Prestito p = new Prestito(idLibro, idUtente);
		p.setData(dataPrenotazioneStringa);
		prestitoDAO.inserisciPrestito(p);
		libroDAO.sottraiCopiaLibro(idLibro);
		RequestDispatcher dispatcher = request.getRequestDispatcher("confermaPrenotazione.jsp");
		dispatcher.forward(request, response);

	}

	private void restituisciLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		int idPrestito = Integer.parseInt(request.getParameter("idPrestito"));
		int idLibro = Integer.parseInt(request.getParameter("idLibro"));
		

		Date dataCorrente = new Date();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String dataPrenotazioneStringa = formatter.format(dataCorrente);
		libroDAO.aggiungiCopiaLibro(idLibro);
		prestitoDAO.restituisciPrestito(idPrestito, dataPrenotazioneStringa);

		RequestDispatcher dispatcher = request.getRequestDispatcher("leMiePrenotazioni.jsp");
		dispatcher.forward(request, response);

	}
	private void registrazioneLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		 String username = request.getParameter("username");
	        String genere = request.getParameter("genere");
	        String copies = request.getParameter("copies");
	        Integer copie = Integer.parseInt(copies);

		Libro  b = new Libro(username, genere, copie);
		libroDAO.creaLibro(username, genere, copie);
		RequestDispatcher dispatcher = request.getRequestDispatcher("confermaInserimento.jsp");
		dispatcher.forward(request, response);
	}
	private void modificaLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		String idlibro = request.getParameter("idLibro");
	        Integer idLibro = Integer.parseInt(idlibro);

	sessione.setAttribute("idLibro", idLibro);
		RequestDispatcher dispatcher = request.getRequestDispatcher("modificaLibro.jsp");
		dispatcher.forward(request, response);
	}
	private void modificaDatiLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		String idlibro = request.getParameter("idLibro");
        Integer idLibro = Integer.parseInt(idlibro);
		String nomeLibro = request.getParameter("nomeLibro");
		String genere = request.getParameter("genere");
		int numeroCopie = Integer.parseInt(request.getParameter("nCopie"));
		libroDAO.modificaLibro(idLibro, nomeLibro, genere, numeroCopie);

	
		RequestDispatcher dispatcher = request.getRequestDispatcher("confermaModifica.jsp");
		dispatcher.forward(request, response);
	}
	private void ricercaLibro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sessione = request.getSession(true);
		String titolo = request.getParameter("titolo");
		List<Libro> risultati = libroDAO.cercaLibriPerTitolo(titolo);
		sessione.setAttribute("risultato", risultati);

	
		RequestDispatcher dispatcher = request.getRequestDispatcher("risultati.jsp");
		dispatcher.forward(request, response);
	}
}
