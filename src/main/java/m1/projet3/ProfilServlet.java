package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.repackaged.com.google.api.client.json.Json;
import com.google.appengine.repackaged.com.google.gson.JsonArray;
import com.googlecode.objectify.Key;
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

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        UserService service = UserServiceFactory.getUserService();
        User user = service.getCurrentUser();

        //Charger si existe , sinon créer
        String user_id = request.getParameter("user_id");
        Profil monProfil = ObjectifyService.ofy().load().type(Profil.class).id(user_id).now();
        System.out.print(monProfil);
        if (monProfil != null) {
            System.out.println("profil chargé : " + user_id );
            monProfil.prenom =request.getParameter("profil_prenom");
            monProfil.nom = request.getParameter("profil_nom");
            monProfil.role=request.getParameter("profil_role");
            monProfil.phone=request.getParameter("profil_phone");
            monProfil.email=request.getParameter("profil_email");
            ObjectifyService.ofy().save().entities(monProfil).now();
        }else{
            System.out.println(" profil crée");
            monProfil = new Profil();
            System.out.println(" nouveau profil" + user_id);
            monProfil.id = user_id;
            monProfil.prenom =request.getParameter("profil_prenom");
            monProfil.nom = request.getParameter("profil_nom");
            monProfil.role=request.getParameter("profil_role");
            monProfil.phone=request.getParameter("profil_phone");
            monProfil.email=request.getParameter("profil_email");
            ObjectifyService.ofy().save().entities(monProfil).now();

        }

        //Charger ET AFFICHER
    }
}
