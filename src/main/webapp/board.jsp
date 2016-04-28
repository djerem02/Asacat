<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.googlecode.objectify.Objectify" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.repackaged.com.google.common.base.Flag" %>
<%@ page import="m1.projet3.*" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
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
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css">
    <link rel="stylesheet" href="../css/icons.css">


    <!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

    <script src="../js/jquery-2.2.2.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/profile.js"></script>

    <style>
        /*header, main, footer {
            padding-left: 240px;
        }

        @media only screen and (max-width : 992px) {
            header, main, footer {
                padding-left: 0;
            }
        }*/


    </style>
</head>
<body>

<%@include file="nav.jsp" %>



<center>
    <%  String nom_du_projet=request.getParameter("projet_nom");

        //Récuperation 1ere
        String nom_du_sprint=request.getParameter("sprint_nom");
        String valeur_du_sprint=request.getParameter("sprint_valeur");
        String etat_du_sprint=request.getParameter("sprint_etat");




        int scount=1;
        int ucount=1;
        int tcount=1;


        String nbstorys_du_sprint = request.getParameter("sprint_nbstorys");
        if(nbstorys_du_sprint!=null){
            ucount= Integer.parseInt(nbstorys_du_sprint);
        }
    %>
    <h1><%= nom_du_projet%></h1>
    <ul class="collapsible popout" data-collapsible="accordion">
        <%
            List<Sprint> sprints = ObjectifyService.ofy()
                    .load()
                    .type(Sprint.class)
                    .filter("del",0)

                    /*.ancestor("projet",nom_du_projet)*/
                    .order("nom")
                    .list();
            for(Sprint sprint :sprints){
            /*Integer s;
            for(s=1;s<=scount;s++){*/

        %>
        <li>
            <div class="collapsible-header">
                <i class="material-icons">place</i>
                <h3>Sprint n°: <%=nom_du_sprint%><span style="float: right;"><%=valeur_du_sprint%></span> </h3>
            </div>
            <div class="collapsible-body">
                <% /*List<UserStory> userStories = ObjectifyService.ofy()
                    .load()
                    .type(UserStory.class)
                    .filter("del",0)
                    .ancestor("nom",sprint[s])
                    .order("priorite")
                    .list();
            for(UserStory userStory: userStories){*/

                    Integer u=0;
                    for(u=1;u<=ucount;u++){%>
                <div class="userstory" style="display: inline-block;border: solid 1px darkgrey;" >
                    <h4>User Story n°<%=u%></h4>
                        <ul class="collapsible" data-collapsible="accordion">
                        <%/* List<Tache> taches = ObjectifyService.ofy()
                            .load()
                            .type(Tache.class)
                            .filter("del",0)
                            .ancestor("nom",userStory[u])
                            .order("priorite")
                            .list();

                            for(Tache tache: taches){*/
                            Integer t;
                        for(t=1;t<=tcount;t++){%>
                            <li>
                                <div class="task collapsible-header" style="border: solid 1px dimgrey;" id="tasksu<%=u%>t<%=t%>" >
                                    <ul id="taskheader" >
                                        <li><span id="task1" name="tache_nom" >Tâche n°<%=t%></span></li>
                                        <li><a>Edit</a></li>
                                        <li><div class="switch">
                                            <label>
                                                <input type="checkbox">
                                                <span class="lever"></span>
                                            </label>
                                        </div></li>
                                        <li><a id="clearsu<%=u%>t<%=t%>"><i class="material-icons">clear</i></a></li>
                                    </ul>
                                </div>
                                <div class="collapsible-body">
                                    <p>Description</p>
                                    <p>Temps estimé</p>
                                </div>
                            </li>
                        <%}%>
                        <li><a id="add"><i class="material-icons">add_circle</i></a></li>
                    </ul> <!-- FIN LISTE TACHES -->
                </div>


                <%}%>
                <i class="material-icons">add_circle</i>

        </li>
        <%} //Fin for sprint%>
        <i class="material-icons">add</i>
    </ul>

</center>
<script>

//Supprimer une tâche
/*$('#clears<=s%>u<=u%>t<//=t%>').click(function(){
    $('#tasks<=s%>u<=u%>t<=t%>').hide();

    var id = $(this).attr('id');
});*/

/*Ajouter une tâche*/
$('#add').click(function(){
    /*var $idcobaye = $('tr[id^="task"]:last');
    var num= parseInt($idcobaye.prop("id").match(/\d+/g),10)+1;
    var $clone= $idcobaye.clone().prop('id','task'+num).find("td").val("");
    var name= $(c).attr('name');

    $idcobaye.after($clone);*/


    /*var copie = $('.task').clone();
    copie.attr("id",)
    copie.insertBefore($('#add'));*/



   /* var value= name.split('-');
    name = value[0]+'-'+(parseInt(value[1])+1);
    $(c).attr('name',name);
    $("#task1").append(c);*/

});

/*Enregistrer une tache*/
$tache_nom=$("#task1").text();
//alert($tache_nom);

/*$.get({
    url:'TacheServlet',
    datatype:'json',
    data:{tache_nom:$tache_nom},

})*/
</script>
</body>
</html>