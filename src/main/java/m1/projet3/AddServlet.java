package m1.projet3;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Jérémy on 03/05/2016.
 */
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

        /*AddTache*/
        if (request.getParameter("addtache_nom") != null){
            System.out.println("t:"+request.getParameter("addtache_nom"));
            Tache monAddTache= new Tache();
            monAddTache.nom=request.getParameter("addtache_nom");
            monAddTache.parentuserstory=request.getParameter("parentuserstory");
            //monAddUserStory.valeur =request.getParameter("adduserstory_valeur");
            monAddTache.del = 0;
            //monAddUserStory.etat=request.getParameter("etat");
            // monAddUserStory.priorite= Integer.valueOf(request.getParameter("priorite"));
            //ObjectifyService.ofy().save().entities(monAddTache).now();

        /*AddUS*/
        }else if (request.getParameter("addtache_nom")==null && request.getParameter("adduserstory_nom") != null){
            System.out.println("us:"+request.getParameter("adduserstory_nom"));
            UserStory monAddUserStory= new UserStory();
            monAddUserStory.nom=request.getParameter("adduserstory_nom");
            monAddUserStory.valeur =request.getParameter("adduserstory_valeur");
            monAddUserStory.del = 0;
            monAddUserStory.parentsprint=request.getParameter("parentsprint");
            //monAddUserStory.etat=request.getParameter("etat");
            //monAddUserStory.priorite= Integer.valueOf(request.getParameter("priorite"));
            ObjectifyService.ofy().save().entities(monAddUserStory).now();
        }else if (request.getParameter("addtache_nom")==null && request.getParameter("adduserstory_nom")== null && request.getParameter("addsprint_nom")!= null){
            System.out.println("sprint: "+ request.getParameter("addsprint_nom")+request.getParameter("parentprojet"));
             Sprint monAddSprint = new Sprint();
             monAddSprint.nom = request.getParameter("addsprint_nom");
             monAddSprint.valeur = request.getParameter("addsprint_valeur");
             //monAddSprint.userstory=request.getParameter("addsprint_nbstorys");
             monAddSprint.creadate = new Date();
             System.out.print(monAddSprint.creadate);
             monAddSprint.del = 0;
             monAddSprint.parentprojet=request.getParameter("parentprojet");
             monAddSprint.etat = "À faire";
             //ObjectifyService.ofy().save().entities(monAddSprint).now();

        }else if(request.getParameter("addtache_nom")==null && request.getParameter("adduserstory_nom")== null
                && request.getParameter("addsprint_nom")== null && request.getParameter("addprojet_nom")!=null){
            System.out.println("projet:"+request.getParameter("addprojet_nom"));
            Projet monAddProjet = new Projet();
            monAddProjet.nom = request.getParameter("addprojet_nom");
            monAddProjet.del = 0;
            //By first co (useless?)
            if(request.getParameter("parentprofil")!=null){
                String parentprofil = request.getParameter("parentprofil");
                System.out.print("byfirst: "+parentprofil);
                monAddProjet.parentprofil = parentprofil;
            }

            // By profile
            if(request.getParameter("parent")!= null){
                String parent = request.getParameter("parent");
                System.out.print("byprofile: "+parent);
                monAddProjet.parentprofil = parent;
            }

            ObjectifyService.ofy().save().entities(monAddProjet).now();
            System.out.print("nom&id: "+monAddProjet.nom+monAddProjet.id);
            //RequestDispatcher rd = request.getRequestDispatcher("/board.jsp?projet="+monAddProjet.nom+"&projet_id="+monAddProjet.id);
            //this.getServletContext().getRequestDispatcher("/board.jsp?projet="+monAddProjet.nom+"&projet_id="+monAddProjet.id).forward(request,response);
            //rd.forward(request,response);
            String id=String.valueOf(monAddProjet.id) ;
            System.out.print(id);
            request.setAttribute("id",id);
            this.getServletContext().getRequestDispatcher("/board.jsp?projet="+monAddProjet.nom+"&projet_id="+id).forward(request,response);

        }

    }
}
