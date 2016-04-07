package m1.projet3;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jérémy on 06/04/2016.
 */
public class SprintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Sprint monSprint= new Sprint();
        //attribut de la classe , name de la balise
        monSprint.nom=request.getParameter("nom");
        monSprint.valeur= Integer.valueOf(request.getParameter("valeur"));
        monSprint.etat=request.getParameter("etat");
        monSprint.userstory= Integer.valueOf(request.getParameter("userstory"));
        /*Enregistrement dans le datastore*/
        //ObjectifyService.ofy().save().entities(monProfil).now();
        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
