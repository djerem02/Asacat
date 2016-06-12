package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jérémy on 08/04/2016.
 */
public class UserStoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        UserStory monUserStory= new UserStory();
        //attribut de la classe , name de la balise
        monUserStory.nom=request.getParameter("nom");
        monUserStory.valeur= request.getParameter("valeur");
        monUserStory.description= request.getParameter("description");
        monUserStory.etat="A faire";
        monUserStory.del=0;
        monUserStory.priorite= Integer.valueOf(request.getParameter("priorite"));
        /*Enregistrement dans le datastore*/
        ObjectifyService.ofy().save().entities(monUserStory).now();
        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
