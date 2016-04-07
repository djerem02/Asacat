package m1.projet3;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Created by Jérémy on 04/04/2016.
 */
public class ProfilServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Profil monProfil = new Profil();
        monProfil.prenom =request.getParameter("prenom");
        monProfil.nom = request.getParameter("nom");
        monProfil.role=request.getParameter("role");
        monProfil.phone=request.getParameter("phone");
        //ObjectifyService.ofy().save().entities(monProfil).now();
        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
