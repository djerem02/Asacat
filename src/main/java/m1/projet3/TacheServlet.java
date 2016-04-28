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
 * Created by Jérémy on 23/04/2016.
 */
public class TacheServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        Tache maTache = new Tache();

        maTache.nom=request.getParameter("tache_nom");

        ObjectifyService.ofy().save().entities(maTache).now();
    }
}
