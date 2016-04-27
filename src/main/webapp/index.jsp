        <%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

        <%@ page import="m1.projet3.Profil" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.google.appengine.api.users.User" %>
        <%@ page import="m1.projet3.Sprint" %>
        <%@ page import="java.util.List" %>
        <%@ page import="m1.projet3.Projet" %>
        <%@ page import="com.googlecode.objectify.Objectify" %>
        <%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
        <%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
        <%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 01/04/2016
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Asacat !</title>
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



<!--AFFICHE HORS CONNEXION-->
<%
    Integer connexion=0;//Plus tard, s'il existe un Sprint
    if (user==null || connexion==0){


%>
<center>
    <h2>Hello <del>World</del> Asacat !</h2>
    <h3>Bienvenue sur la plateforme de gestion de projet agile Asacat </h3>
    <p>Asacat permet la gestion de votre projet de manière agile.Devenez aussi agile qu'un chat !</p>
</center>
<%

    /* SI 1ere Connexion*/
    if (connexion==0 && user!= null){%>
<center>
    <form action="SprintServlet" method="get">
        <input type="text" name="projet_nom" placeholder="Nom du Projet">
        <h4>Ce n'est peut-être pas le Sprint final , mais vous devez lui accorder toute son importance:</h4>
        <h5>Sprint n°1:</h5>

        <input type="text" name="sprint_nom" placeholder="Nom du Sprint" class="validate">
        <input type="number" name="sprint_valeur" placeholder="Nombre de points" class="validate">
        <input type="hidden" name="sprint_etat" value="0" >
        <input type="number" name="sprint_nbstorys"placeholder="Nombre de storys" class="validate" >
        <input type="submit"  class="btn" value="C'est parti!">
    </form>
</center><%}else{%><center><p>Connectez-vous vite !</p></center><%}%>
<%}else{%>



<center>
    <ul class="collapsible popout" data-collapsible="accordion">
    <%
        /*List<Sprint> sprints = ObjectifyService.ofy()
                .load()
                .type(Sprint.class)
                .order("nom")
                .list();
        for(Sprint sprint:sprints){*/
        Integer s;
        for(s=1;s<4;s++){

    %>



        <!--<li>

            <div class="collapsible-header"><i class="material-icons">filter_drama</i><h2>Sprint en cours </h2><a href="sprint?id=<%/*sprint.id*/%>"><%/* sprint.nom  */ %></a></div>
            <div class="collapsible-body"><%/* sprint.etat  */ %><%/* sprint.valeur   */%><%/* sprint.userstory  */ %></div>
        </li>-->
        <li>
            <div class="collapsible-header"><i class="material-icons">place</i><h3>Sprint n°</h3></div>
            <div class="collapsible-body">
                <% /*Integer i=0;
                    for(i=1;i<monSprint.userstory;i++){*/%>
                <div class="userstory">
                    <h4>User Story n°</h4>
                </div>

                <%/*}*/%>
            </div>
        </li>


    <%}
        //Fin for sprint
    %>
    </ul>

</center>
<%}///Fin si ni 1ere co ni null

%>

<script>

/*
    function getProfil(){
        var user_nom=jQuery('#nom').val();
        jQuery.ajax({
            type:'GET',
            url: '/ProfilServlet',
            data:{
                nom:user_nom
            },
            success: function (result) {
                jQuery

            }
        })
    }*/
</script>
</body>
</html>
