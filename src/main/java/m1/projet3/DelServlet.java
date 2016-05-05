package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jérémy on 29/04/2016.
 */
public class DelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();


        Long projet_id=Long.parseLong(request.getParameter("projet_id"));
        System.out.println(projet_id);
        System.out.println(request.getParameter("projet_nom"));
        Projet monDelProjet = ObjectifyService.ofy().load().type(Projet.class).id(projet_id).now();

        monDelProjet.nom=request.getParameter("projet_nom");
        monDelProjet.del=1;

        ObjectifyService.ofy().save().entities(monDelProjet).now();

    }
}
