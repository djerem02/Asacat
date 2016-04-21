<%@ page import="m1.projet3.Profil" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="m1.projet3.Sprint" %>
<%@ page import="java.util.List" %>
<%@ page import="m1.projet3.Projet" %>
<%@ page import="com.googlecode.objectify.Objectify" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.repackaged.com.google.common.base.Flag" %>
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
<html>
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
        /*String nom_du_sprint=request.getParameter("sprint_nom");
        String valeur_du_sprint=request.getParameter("sprint_valeur");
        String etat_du_sprint=request.getParameter("sprint_etat");*/

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
            /*List<Sprint> sprints = ObjectifyService.ofy()
                    .load()
                    .type(Sprint.class)
                    .order("nom")
                    .list();
            for(Sprint sprint:sprints){*/
            Integer s;
            for(s=1;s<=scount;s++){

        %>



        <!--<li>

            <div class="collapsible-header"><i class="material-icons">filter_drama</i><h2>Sprint en cours </h2><a href="sprint?id=<%/*sprint.id*/%>"><%/* sprint.nom  */ %></a></div>
            <div class="collapsible-body"><%/* sprint.etat  */ %><%/* sprint.valeur   */%><%/* sprint.userstory  */ %></div>
        </li>-->
        <li>
            <div class="collapsible-header"><i class="material-icons">place</i><h3>Sprint n°<%=s%> </h3></div>
            <div class="collapsible-body">
                <% Integer u=0;

                    for(u=1;u<=ucount;u++){%>
                <div class="userstory" style="display: inline-block;border: solid 1px darkgrey;" >
                    <h4>User Story n°<%=u%></h4>
                    <table>
                    <% Integer t;
                        for(t=1;t<=tcount;t++){%>
                            <tr style="border: solid 1px dimgrey;">
                                <td id="tasks<%=s%>u<%=u%>t<%=t%>">Tâche n°<%=t%></td>
                                <td><a>Edit</a></td>
                                <td><!-- Switch -->
                                    <div class="switch">
                                        <label>
                                            <input type="checkbox">
                                            <span class="lever"></span>
                                        </label>
                                    </div></td>
                                <td><a><i class="material-icons">clear</i></a></td>
                            </tr>
                        <%}%>
                        <td><i class="material-icons">add_circle</i></td>

                    </table>
                </div>


                <%}%>
                <i class="material-icons">add_circle</i>
            </div>

        </li>



        <%}
            //Fin for sprint
        %>
        <i class="material-icons">add</i>
    </ul>

</center>
<script>

</script>

</body>
</html>
