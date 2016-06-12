package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jérémy on 08/05/2016.
 */
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        UserService service = UserServiceFactory.getUserService();
        User user = service.getCurrentUser();

        //Charger si existe , sinon créer
        System.out.print("Editache! ");
        Long tache_id = Long.valueOf(request.getParameter("tache_id"));
        Tache maTache = ObjectifyService.ofy().load().type(Tache.class).id(tache_id).now();
        System.out.print(maTache);
        if (maTache != null) {
            System.out.println("tache chargée : " + tache_id );
            maTache.valeur =request.getParameter("tache_valeur");
            maTache.nom = request.getParameter("tache_nom");
            //maTache.role=request.getParameter("profil_role");
            //maTache.phone=request.getParameter("profil_phone");
            //maTache.email=request.getParameter("profil_email");
            ObjectifyService.ofy().save().entities(maTache).now();
        }

    }
}
