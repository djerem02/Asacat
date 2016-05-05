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
 * Created by Jérémy on 03/05/2016.
 */
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        if (request.getParameter("addprojet_nom")!="") {
            System.out.println("projet");
            Projet monAddProjet = new Projet();
            monAddProjet.nom = request.getParameter("addprojet_nom");
            monAddProjet.del = 0;
            ObjectifyService.ofy().save().entities(monAddProjet).now();
        }else {
            if (request.getParameter("addsprint_nom") != "") {
                System.out.println("sprint");
                Sprint monAddSprint = new Sprint();
                monAddSprint.nom = request.getParameter("addsprint_nom");
                monAddSprint.valeur = request.getParameter("addsprint_valeur");
                //monAddSprint.userstory=request.getParameter("addsprint_nbstorys");
                monAddSprint.del = 0;
                monAddSprint.etat = "À faire";
                ObjectifyService.ofy().save().entities(monAddSprint).now();
            }
        }
    }
}
