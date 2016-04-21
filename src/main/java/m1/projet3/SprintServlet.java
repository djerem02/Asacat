package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.googlecode.objectify.ObjectifyService;

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

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        Projet monProjet = new Projet();
        monProjet.nom=request.getParameter("projet_nom");
        ObjectifyService.ofy().save().entities(monProjet).now();

        Sprint monSprint= new Sprint();
        monSprint.nom=request.getParameter("sprint_nom");
        ObjectifyService.ofy().save().entities(monSprint).now();



        //monSprint.valeur= Integer.valueOf(request.getParameter("sprint_valeur"));
        //monSprint.etat=request.getParameter("etat");
        //monSprint.userstory= Integer.valueOf(request.getParameter("sprint_nbstorys"));

        this.getServletContext().getRequestDispatcher("/board.jsp").forward(request,response);
        // OU response.sendRedirect("board.jsp");
    }
}
