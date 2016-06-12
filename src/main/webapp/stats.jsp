<%@ page import="m1.projet3.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.google.appengine.api.datastore.*" %>
<%@ page import="com.googlecode.objectify.annotation.*" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %><%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 10/05/2016
  Time: 09:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stats</title>

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css">
    <link rel="stylesheet" href="../css/icons.css">
    <link rel="stylesheet" href="../css/gantt.css">

    <script src="../js/jquery-2.2.2.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/profile.js"></script>

    <style>
        .stats{
            display: inline-block;
            margin: 1em;
        }
    </style>

</head>
<body>

<%@include file="nav.jsp" %>

<center>
        <h1>Chiffres & Statistiques</h1>
    <ul>
        <%int projet_number = ObjectifyService.ofy().load().type(Projet.class).filter("parentprofil >",null).count();
            int sprint_number = ObjectifyService.ofy().load().type(Sprint.class).filter("parentprojet >",null).count();
            int userstory_number  = ObjectifyService.ofy().load().type(UserStory.class).filter("parentsprint >",null).count();
            int tache_number  = ObjectifyService.ofy().load().type(Tache.class).filter("parentuserstory >",null).count();

        %>
        <li class="stats"><i class=" material-icons md-48 md-dark md-inactive right " >folder</i><%= projet_number%></li>
        <li class="stats"><i class=" material-icons md-48 md-dark md-inactive right " >directions_run</i><%= sprint_number%></li>
        <li class="stats"><i class=" material-icons md-48 md-dark md-inactive right " ></i><%= userstory_number%></li>
        <li class="stats"><i class=" material-icons md-48 md-dark md-inactive right " >star</i><%= tache_number%></li>


    </ul>

    <ul class="tache_list collapsible" data-collapsible="accordion">
        <%   int i=0;
            List<Tache> taches = ObjectifyService.ofy()
                .load()
                .type(Tache.class)
                .filter("del",0).filter("parentuserstory >", null)
                .order("parentuserstory")
                .list();

            for(Tache tache: taches){

                %>

        <li>
                <span id="<%=i%>" name="tache_nom" ><%=tache.nom%></span>
        </li>
        <%i++;
        }%>

    </ul> <!-- FIN LISTE TACHES -->

</center>
<script src="../js/jquery-2.2.2.js"></script>
<script type="text/javascript" src="../js/d3js/d3.v3.min.js"></script>
<script type="text/javascript" src="../js/d3js/gantt-chart-d3.js"></script>
<script type="text/javascript" src="../js/d3js/gantt.js"></script>
</body>
</html>

