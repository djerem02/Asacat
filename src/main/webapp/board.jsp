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
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css">
    <link rel="stylesheet" href="../css/icons.css">


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

        //Récuperation 1ere
        //String nom_du_sprint=request.getParameter("sprint_nom");
        //String valeur_du_sprint=request.getParameter("sprint_valeur");
        String etat_du_sprint=request.getParameter("sprint_etat");


        //Créer une clef

        //Key<Projet> parent = Key.create(Projet.class,nom_du_projet);
        //Charger une entité par sa clef

        //Projet monProjet = ObjectifyService.ofy().load().key(parent).now();
        //Créer une clef
        //Key<Sprint> sprintKey = Key.create(Sprint.class,user.getUserId());
        //Charger une entité par sa clef
        //Sprint monSprint = ObjectifyService.ofy().load().key(sprintKey).now();

        int ucount=1;
        int tcount=1;

        String nbstorys_du_sprint = request.getParameter("sprint_nbstorys");
        if(nbstorys_du_sprint!=null){
            ucount= Integer.parseInt(nbstorys_du_sprint);
        }
    %>
    <h1><%= nom_du_projet%></h1>
    <ul class="collapsible popout" data-collapsible="accordion" id="sprint_list">
        <%
            Random rd= new Random();


            List<Sprint> sprints = ObjectifyService.ofy()
                    .load()
                    .type(Sprint.class)
                    .filter("del",0)
                    /*.ancestor(parent)*/
                    .order("nom")
                    .list();
            for(Sprint sprint :sprints){
                int progression = rd.nextInt(100)+1;
                /*Integer s;
            for(s=1;s<=scount;s++){*/

        %>
        <li id="item-<%= sprint.id%>" >
            <div class="collapsible-header">
                <i class="material-icons">place</i>
                <h3 id="<%= sprint.id%>"><span style="float: left;"><%= sprint.valeur%></span>Sprint n°<%= sprint.id%>: <span><%= sprint.nom%></span><i id="id<%=sprint.id%>" class="delsprint tiny material-icons md-dark md-inactive right rouge" >clear</i></a></h3>
                <div class="progress">
                    <div class="determinate" style="width:<%= progression %>%"></div> // nombre taches done/nombre total de taches(nombre de tachesn ayant l'id ancetre et etat done/nolbres de taches yaant l'ancetre)
                </div>
            </div>
            <div class="collapsible-body">
                <ul id="userstory_list">
                <% List<UserStory> userStories = ObjectifyService.ofy()
                    .load()
                    .type(UserStory.class)
                    .filter("del",0)
                    .order("priorite")
                    .list();
            for(UserStory userStory: userStories){%>
                <li>

                <div class="userstory" style="display: inline-block;border: solid 1px darkgrey;" >
                    <h4>User Story n°<%= userStory.id %></h4>
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
                                <div class="task collapsible-header">
                                        <h5 ><span id="task1" name="tache_nom" >Tâche n°<%=t%></span>
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
                        <li><i id="addtache" class="material-icons md-dark md-inactive md-24 pointer vert">add</i></li>
                    </ul> <!-- FIN LISTE TACHES -->
                </div>

                </li>
                <%}%>
                </ul>
                    <i id="newuserstory" class="material-icons md-dark md-inactive md-36 pointer vert">add</i>
                    <i  id="adduserstory" class="material-icons md-dark md-inactive pointer bleu md-36 " style="display: none;">send</i>


        </li>

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

/*Créer un Sprint */
$('#newsprint').click(function(){
    $('#sprint_list').append($('<li><div class="collapsible-header">' +
            '<i class="material-icons">place</i> <h3>Sprint n°Y: <input id="addsprint_nom"type="texte" style="width: 4em;" placeholder="Nom"><input id="addsprint_valeur" style="float: left;width: 45px;" placeholder="Valeur"><a id="delete"><i class=" tiny material-icons md-dark md-inactive right rouge" >clear</i></a>' +
            //'<div class="progress"> <div class="determinate" style="width:0%"></div></div>' +
            '</h3>'+
            '</div>' +
            '<!--<div class="collapsible-body"><div class="userstory" style="display: inline-block;border: solid 1px darkgrey;" >'+
            '<h4>User Story n°Y</h4><ul class="collapsible" data-collapsible="accordion"> '+
            '<li><div class="task collapsible-header"> ' +
            '<h5 ><span id="task1" name="tache_nom" >Tâche n°</span>'+
                                                '<span class="switch"><label> <input type="checkbox"> <span class="lever"></span> </label>'+
                                                '</span><span class="right"> <i class="material-icons md-dark md-inactive pointer bleu ">mode_edit</i> <i class="material-icons md-dark md-inactive pointer rouge">clear</i> </span>'+
            '</h5></div>'+
            '<div class="collapsible-body"> <div class="input-field col s12"> <textarea id="description" class="materialize-textarea" length="120"></textarea> <label for="description">Description</label> </div> <input type="date" class="datepicker"> <p>Temps estimé</p> </div> </li>'+
            '</div></li>-->'));
    $(this).css("display", "none");
    $('#addsprint').css("display","block");
})
/*Valider et Enregister un Sprint*/
/*Valider  input to span*/
/*Enregistrer BDD via Servlet*/
$('#addsprint').click(function(){
    event.preventDefault();
    $addsprint_nom=$('#addsprint_nom').val()
    $addsprint_valeur=$('#addsprint_valeur').val()

    alert($addsprint_valeur);
    alert($addsprint_nom);
    $.get({
        url:'AddServlet',
        datatype:'json',
        data:{addsprint_nom:$addsprint_nom,addsprint_valeur:$addsprint_valeur},

    })

    $(this).css("display", "none");
    $('#newsprint').css("display","block");
    Materialize.toast($addsprint_nom+" crée !", 3000);


});


$('#newuserstory').click(function(){

    $('#userstory_list')
            .append($(' <div class="userstory" style="display: inline-block;border: solid 1px darkgrey;" >'+
                    '<h4><input id="adduserstory_valeur" style="float: left;width: 25px;" placeholder="Valeur">User Story n°TEST : <input id="adduserstory_nom" type="text"></h4>'+
                '<ul class="collapsible" data-collapsible="accordion"><li>'+
                                '<div class="task collapsible-header"><h5 ><span id="task1" name="tache_nom" >Tâche n°</span>'+
                        '<span class="switch"><label><input type="checkbox"><span class="lever"></span> </label> </span>'+
                        '<span class="right"> <i class="material-icons md-dark md-inactive pointer bleu ">mode_edit</i> <i class="material-icons md-dark md-inactive pointer rouge">clear</i> </span>'+
                        '</h5> </div> <div class="collapsible-body"> <div class="input-field col s12"> <textarea id="description" class="materialize-textarea" length="120"></textarea> <label for="description">Description</label> </div> <input type="date" class="datepicker"> <p>Temps estimé</p> </div>'+
                            '</li></ul> </div>'));
        $(this).css("display", "none");
        $('#adduserstory').css("display","block");
    });
    /*Valider et Enregister un Sprint*/

    $('#adduserstory').click(function(){
        event.preventDefault();
        $adduserstory_nom=$('#adduserstory_nom').val();
        $adduserstory_valeur=$('#adduserstory_valeur').val();
        $adduserstory_description=$('#adduserstory_description').val();
        $adduserstory_etat=$('#adduserstory_etat').val();
        $adduserstory_priorite=$('#adduserstory_priorite').val();

        alert($adduserstory_valeur);
        alert($adduserstory_nom);
        $.get({
            url:'AddServlet',
            datatype:'json',
            data:{adduserstory_nom:$adduserstory_nom,adduserstory_valeur:$adduserstory_valeur},

        })

        $(this).css("display", "none");
        $('#newuserstory').css("display","block");
        Materialize.toast($adduserstory_nom+" crée !", 3000);
    });


/*Ajouter une tâche*/
$('#addtache').click(function(){
    alert("Tâche Ajoutée !")
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

/*Enregistrer une tache OK*/
$tache_nom=$("#task1").text();
//alert($tache_nom);

/*$.get({
    url:'TacheServlet',
    datatype:'json',
    data:{tache_nom:$tache_nom},

})*/

/*Supprimer un sprint */
 $(".delsprint").click(function(event){

        event.preventDefault();
        $sprint_id = $(this).parent('h3').attr('id');
        $sprint_nom = $(this).prev('span').text();
        alert($sprint_id);
        alert($sprint_nom);

        $.get({
            url: 'DelServlet',
            datatype: 'json',
            data: {sprint_id: $sprint_id, sprint_nom: $sprint_nom},

        })

        $('#item-' + $sprint_id).fadeToggle();
        Materialize.toast($sprint_nom + " supprimé !", 3000);
})
</script>
</body>
</html>