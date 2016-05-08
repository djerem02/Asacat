package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.repackaged.com.google.common.base.Flag;
import com.google.appengine.repackaged.com.google.storage.onestore.v3.proto2api.OnestoreEntity;
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
        System.out.println("DELSERVLET");
        System.out.println("delsp:"+request.getParameter("sprint_id"));
        if (request.getParameter("userstory_id") != null){
            System.out.println("delus:"+request.getParameter("userstory_id"));
            Long userstory_id=Long.parseLong(request.getParameter("userstory_id"));
            UserStory monDelUserStory = ObjectifyService.ofy().load().type(UserStory.class).id(userstory_id).now();
            monDelUserStory.nom=request.getParameter("projet_nom");
            monDelUserStory.del=1;
            ObjectifyService.ofy().save().entities(monDelUserStory).now();

        }else if (request.getParameter("userstory_id")== null && request.getParameter("sprint_id")!=null){
            System.out.println("delsp:"+request.getParameter("sprint_nom"));
            Long sprint_id=Long.parseLong(request.getParameter("sprint_id"));
            Sprint monDelSprint = ObjectifyService.ofy().load().type(Sprint.class).id(sprint_id).now();
            monDelSprint.nom=request.getParameter("sprint_nom");
            monDelSprint.del=1;
            ObjectifyService.ofy().save().entities(monDelSprint).now();

        }else if(request.getParameter("userstory_id")== null
                && request.getParameter("sprint_id")== null && request.getParameter("projet_id")!=null){

            Long projet_id=Long.parseLong(request.getParameter("projet_id"));
            System.out.println("delpr: "+projet_id);
            System.out.println(request.getParameter("projet_nom"));
            Projet monDelProjet = ObjectifyService.ofy().load().type(Projet.class).id(projet_id).now();

            monDelProjet.nom=request.getParameter("projet_nom");
            monDelProjet.del=1;

            ObjectifyService.ofy().save().entities(monDelProjet).now();
        }

    }
}
