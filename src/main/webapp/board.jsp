<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.googlecode.objectify.Objectify" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.repackaged.com.google.common.base.Flag" %>
<%@ page import="m1.projet3.*" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="java.util.Random" %>
<%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 19/04/2016
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Bienvenue</title>
    <!--<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/materialize.min.css">-->

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css">
    <link rel="stylesheet" href="../css/icons.css">
    <link rel="stylesheet" href="../css/style.css">


    <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

    <script src="../js/jquery-2.2.2.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/profile.js"></script>
</head>
<body>

<%@include file="nav.jsp" %>


<center>
    <%  String nom_du_projet=request.getParameter("projet_nom");
        String id_du_projet=request.getParameter("projet_id");

        //Récuperation 1ere
        //String nom_du_sprint=request.getParameter("sprint_nom");
        //String valeur_du_sprint=request.getParameter("sprint_valeur");
        String etat_du_sprint=request.getParameter("sprint_etat");


        //Créer une clef

        Key<Projet> key = Key.create(Projet.class,nom_du_projet);
        //Charger une entité par sa clef

        //Projet monProjet = ObjectifyService.ofy().load().key(key).now();


        //Créer une clef
        //Key<Sprint> sprintKey = Key.create(Sprint.class,user.getUserId());
        //Charger une entité par sa clef
        //Sprint monSprint = ObjectifyService.ofy().load().key(sprintKey).now();

        int tcount=1;

        String nbstorys_du_sprint = request.getParameter("sprint_nbstorys");

    %>
    <h1><%= nom_du_projet%></h1>
    <input type="hidden" id="parentprojet" value="<%= id_du_projet%>">

    <ul class="collapsible popout" data-collapsible="accordion" id="sprint_list">
        <%
            Random rd= new Random();


            List<Sprint> sprints = ObjectifyService.ofy()
                    .load()
                    .type(Sprint.class)
                    .filter("del",0)
                    /*.ancestor(parent)*/
                    .filter("parentprojet",id_du_projet)
                    .order("nom")
                    .list();
            for(Sprint sprint :sprints){
                int progression = rd.nextInt(100)+1;
        %>
        <li id="<%= sprint.id%>" class="item-S clear">
            <div class="collapsible-header">
                <i class="material-icons">directions_run</i>
                <h3 id="<%= sprint.id%>">
                    <span class="left" id="sprint_valeur "><%= sprint.valeur%></span>
                    Sprint: <span id="sprint_nom"><%= sprint.nom%></span>
                    <span class="right">
                        <i class="editsprint  material-icons md-dark md-inactive pointer bleu ">mode_edit</i>
                        <i class="delsprint tiny material-icons md-dark md-inactive  rouge" >clear</i>
                    </span>
                </h3>
                <h4>En cours</h4>
                <div class="progress">
                    <div class="determinate" style="width:<%= progression %>%"></div> // nombre taches done/nombre total de taches(nombre de tachesn ayant l'id ancetre et etat done/nolbres de taches yaant l'ancetre)
                </div>
            </div>
            <div class="collapsible-body">
                <ul id="userstory_list" class="userstory_list">
                <% System.out.println(sprint.id);
                    List<UserStory> userStories = ObjectifyService.ofy()
                    .load()
                    .type(UserStory.class)
                    .filter("del",0).filter("parentsprint >", null)
                    .order("parentsprint")
                    .list();
            for(UserStory userStory: userStories){%>
                <li id="<%=userStory.id%>" class="item-US" style="display: inline-block;">

                <div class="userstory " style="display: inline-block;border: solid 1px darkgrey;" >
                    <h4>
                        <span class="left"><%= userStory.valeur%></span>
                        User Story:<%=userStory.nom%>
                        <i  class="delsprint tiny material-icons md-dark md-inactive right rouge" >clear</i>
                    </h4>
                        <ul class="tache_list collapsible" data-collapsible="accordion">
                        <% List<Tache> taches = ObjectifyService.ofy()
                            .load()
                            .type(Tache.class)
                            .filter("del",0).filter("parentuserstory >", null)
                            .order("parentuserstory")
                            .list();

                            for(Tache tache: taches){%>

                            <li>
                                <div class="task collapsible-header">
                                        <h5 ><span id="task1" name="tache_nom" >Tâche:<%=tache.nom%></span>
                                                <span class="switch">
                                                    <label>
                                                        <input type="checkbox">
                                                        <span class="lever"></span>
                                                    </label>
                                                </span>
                                                <span class="right">
                                                <i class="material-icons md-dark md-inactive pointer bleu ">mode_edit</i>
                                                <i class="material-icons md-dark md-inactive pointer rouge">clear</i>

                                                </span>
                                        </h5>
                                </div>
                                <div class="collapsible-body">
                                    <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" length="120"></textarea>
                                        <label for="description">Description</label>
                                        </div>
                                    <input type="date" class="datepicker">
                                    <p>Temps estimé</p>

                                </div>
                            </li>
                        <%}%>
                        <li><i  class=" newtache material-icons md-dark md-inactive md-24 pointer vert">add</i>
                            <i   class="addtache material-icons md-dark md-inactive pointer bleu md-24 " style="display: none;">send</i></li>
                    </ul> <!-- FIN LISTE TACHES -->
                </div>

                </li>
                <%}%>
                </ul>
                    <i  class="newuserstory material-icons md-dark md-inactive md-36 pointer vert">add</i>
                    <i  id="adduserstory" class="adduserstory material-icons md-dark md-inactive pointer bleu md-36 " style="display: none;">send</i>


        </div></li><!--Fin li Sprint-->

        <%} //Fin for sprint%>

    </ul>
    <i id="newsprint" class="material-icons md-dark md-inactive md-48 pointer vert">add</i>
    <i  id="addsprint" class="material-icons md-dark md-inactive pointer bleu md-48 " style="display: none;">send</i>

</center>
<script>

//Supprimer une tâche
/*$('#clears<=s%>u<=u%>t<//=t%>').click(function(){
    $('#tasks<=s%>u<=u%>t<=t%>').hide();

    var id = $(this).attr('id');
});*/






/*Enregistrer une tache OK*/
$tache_nom=$("#task1").text();
//alert($tache_nom);

/*$.get({
    url:'TacheServlet',
    datatype:'json',
    data:{tache_nom:$tache_nom},

})*/



</script>
<script src="../js/add.js"></script>
<script src="../js/edit.js"></script>
<script src="../js/del.js"></script>


</body>
</html>