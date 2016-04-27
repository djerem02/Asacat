package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.repackaged.com.google.api.client.json.Json;
import com.google.appengine.repackaged.com.google.gson.JsonArray;
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

        Profil monProfil = new Profil();
        //monProfil.prenom =request.getParameter("profil_prenom");
        monProfil.nom = request.getParameter("profil_nom");
        //monProfil.role=request.getParameter("profil_role");
        //monProfil.phone=request.getParameter("profil_phone");
        monProfil.email=request.getParameter("profil_email");
        ObjectifyService.ofy().save().entities(monProfil).now();
    }
}
