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
                    .filter("parentprojet",id_du_projet)
                    .order("nom")
                    .list();
            for(Sprint sprint :sprints){
                Long id_du_sprint=sprint.id_sprint;
                int progression = rd.nextInt(100)+1;
        %>
        <li id="<%= sprint.id_sprint%>" class="item-S clear">
            <div class="collapsible-header">

                <h3 id="<%= sprint.id_sprint%>">
                    <i class="material-icons tooltipped" data-position="bottom" data-tooltip="Sprint" data-delay="0">directions_run</i>
                    <span class="left" id="sprint_valeur "><%= sprint.valeur%></span>
                    <span id="sprint_nom"><%= sprint.nom%></span>
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
                <% //Key<Sprint> theSprint = Key.create(Sprint.class, sprint.id_sprint);
                    List<UserStory> userStories = ObjectifyService.ofy()
                    .load()
                    .type(UserStory.class)
                    .filter("del",0).filter("parentsprint ", String.valueOf(id_du_sprint))
                    /*.ancestor(theSprint)*/
                    .order("parentsprint")
                    .list();
            for(UserStory userStory: userStories){
                Long id_du_userstory = userStory.id;%>

                <li id="<%=userStory.id%>" class="item-US" style="display: inline-block;">
                <div class="userstory " style="display: inline-block;border: solid 1px darkgrey;" >
                    <h4>
                        <i class="material-icons tooltipped" data-delay="0" data-position="left" data-tooltip="UserStory">description</i>
                        <span class="left"><%= userStory.valeur%></span><span id="userstory_nom"><%=userStory.nom%></span>
                        <i  class="deluserstory tiny material-icons md-dark md-inactive right pointer rouge" >clear</i>
                    </h4>
                        <ul class="tache_list collapsible" data-collapsible="accordion">

                        <%
                            List<Tache> taches = ObjectifyService.ofy()
                            .load()
                            .type(Tache.class)
                            .filter("del",0).filter("parentuserstory", String.valueOf(id_du_userstory))
                            .order("parentuserstory")
                            .list();

                            for(Tache tache: taches){%>

                            <li id="<%=tache.id%>" class="item-T">
                                <div class="task collapsible-header "  >

                                    <h5 class="row">
                                        <i class="material-icons col-md-1 col-sm-1 tooltipped" data-delay="0" data-position="left" data-tooltip="Tâche">lens</i>
                                        <span id="tache_nom" name="tache_nom"  class="col-md-4 col-sm-4" style="padding-top: 5px;"><%=tache.nom%></span>
                                        <span class="switch col-md-2 col-sm-2" style="padding-left:5px;padding-top: 10px;">
                                            <label>
                                                <input type="checkbox">
                                                <span class="lever"></span>
                                            </label>
                                        </span>
                                        <i class="material-icons md-dark md-inactive pointer jaune modal-trigger col-md-1 col-sm-1 " href="#modal<%=tache.id%>">open_in_new</i>
                                        <i class=" deltache material-icons md-dark md-inactive pointer rouge col-md-1 col-sm-1">clear</i>

                                        </h5>
                                </div>

                                <!-- Modal Structure -->
                                <div id="modal<%=tache.id%>" class="modal">
                                    <div class="modal-header">
                                        <h4 id="<%=tache.id%>"><span id="datanomtache"><%= tache.nom%></span>
                                        <span class="right">
                                            <i class="edittache  material-icons md-dark md-inactive pointer bleu ">mode_edit</i>
                                            <i class="savetache material-icons md-36 md-dark md-inactive pointer bleu" style="display: none;">save</i>
                                        </span>
                                        <span id="datavaleurtache" class="left">
                                            <%= tache.valeur%>
                                        </span>
                                        </h4>
                                    </div>
                                    <div class="modal-content">
                                        <%= tache.description%>
                                        <textarea id="description" class="materialize-textarea" length="120"></textarea>
                                        <label for="description">Description</label>
                                        <%= tache.etat%>
                                        <%= tache.priorite%>
                                        <%= tache.temps_estim%>
                                        <input type="date" >
                                        <p>Temps estimé</p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                                    </div>
                                </div>
                            </li>

                        <%}%>
                            <i   class="addtache material-icons md-dark md-inactive pointer bleu md-24 " style="display: none;">send</i>
                        <i  class=" newtache material-icons md-dark md-inactive md-24 pointer vert">add</i>

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
<script type="text/javascript">
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
    });
</script>
<script src="../js/add.js"></script>
<script src="../js/edit.js"></script>
<script src="../js/del.js"></script>


</body>
</html>