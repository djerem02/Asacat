        <%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="m1.projet3.Profil" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.google.appengine.api.users.User" %>
        <%@ page import="m1.projet3.Sprint" %>
        <%@ page import="java.util.List" %><%--
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
<%
    UserService service = UserServiceFactory.getUserService();
    User user = service.getCurrentUser();

    String pseudo = "pseudo";
    String email = null;
    if (user != null) {


        //Créer une clef
        Key<Profil> profilKey = Key.create(Profil.class, user.getUserId());
        //Charger une entité par sa clef
        Profil monProfil = ObjectifyService.ofy().load().key(profilKey).now();
        email = user.getEmail();
    }
%>
    <!-- BARRE-->

    <nav>
        <% if (user !=null){%>
        <form action="/ProfilServlet" method="post">

        <ul id="slide-out" class="side-nav" style="color:grey;">
            <li><i class="small material-icons">perm_identity</i><a href="#!">Avatar </a>
                <div class="file-field input-field">
                <div class="btn">
                    <span>File</span>
                    <input type="file">
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
            </div>
            </div>
            </li>
            <li><div class="input-field col s12">
                <select name="role">
                    <option value="" disabled selected>Rôle</option>
                    <option value="value1">Product Owner</option>
                    <option value="value2">Scrum Master</option>
                    <option value="value3">Développeur</option>
                </select>
               </div>
            </li>
            <li><span id="prenom" class="datainfo">Prénom</span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>

            </li>

            <!--<input type="text" id="nom" placeholder="Nom">-->
            <li><span id="nom" class="datainfo">Nom</span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>
            </li>


            <li><%=email%></li>
            <li><div class="input-field col s6">
                    <i class="small material-icons prefix">lock</i>
                    <input type="password" id="mdp" class="validate">
                    <label for="mdp" data-error="wrong" data-success="right">Mot de passe</label>
                </div>
            </li>
            <li><div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="telephone" type="tel" class="validate">
                    <label for="telephone" data-error="wrong" data-success="right">Telephone</label>
                </div>
            </li>
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header">Projets affectés</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><a href="#!">Projet 1</a></li>
                                <li><a href="#!">Projet 2</a></li>
                                <li><a href="#!">Projet 3</a></li>
                            </ul>
                        </div>
                    </li>
                    <div id="resultat"></div>
                </ul>
            </li>
        </ul><%}%>

        <ul class="right hide-on-med-and-down">
            <li><a href="#!" data-activates="dropdown1"><span class=" glyphicon glyphicon-plus btn-large">
            </span></a></li>
            <ul id='dropdown1' class='dropdown-content'>
                <li><a href="#!">First</a></li>
                <li><a href="#!">Second</a></li>
                <li><a href="#!">Third</a></li>
                <li><a href="#!">Fourth</a></li>
            </ul>
            <li><a href="#!"><span class="glyphicon glyphicon-search btn-large" aria-hidden="true"></span></a></li>
            <li>
            <% if (user!=null){%>
                <a href="<%=service.createLogoutURL("/index.jsp")%>" class="dropdown-button">
                    <span class="glyphicon glyphicon-log-out btn-large" aria-hidden="true"></span></a>
            </li>
                <%} else {%>
                <a href="<%=service.createLoginURL("/index.jsp")%>" class="dropdown-button">
                    <span class="glyphicon glyphicon-log-in btn-large" aria-hidden="true"></span></a></li>
                <%}
                %>


        </ul>
        <% if (user!=null){%>
        <a href="#" data-activates="slide-out" class="button-collapse show-on-large">  <i class="large material-icons">view_headline</i></a>
        </form><%}%>
    </nav>






    <!--AFFICHE HORS CONNEXION-->
    <% Integer connexion=1; //Plus tard, s'il existe un Sprint
        if (user==null){%>
    <center>
        <h2>Hello <del>World</del> Asacat !</h2>
        <h3>Bienvenue sur la plateforme de gestion de projet agile Asacat </h3>
        <p>Asacat permet la gestion de votre projet de manière agile.Devenez aussi agile qu'un chat !</p>
    <%
        /*Si CONNECTE*/
    }else{
            /* SI 1ere Connexion*/
            if (connexion==0){%>

        <h4>Ce n'est peut-être pas le Sprint final , mais vous devez lui accorder toute son importance:</h4>
        <h5>Sprint n°1:</h5>
        <form action="/SprintServlet" method="get">
        <input type="text" name="nom" placeholder="Nom du Sprint">
        <input type="text" name="valeur" placeholder="Nombre de points">
        <!--<input type="text" name="etat" >-->
        <input type="text" name="userstorys"placeholder="Nombre de storys" >
        <input type="submit" value="C'est parti!">
        </form>
    </center>
            <%}else{%>
<center>
    <h1>Projet 1</h1>
    <h2>Sprint en cours </h2>
    <%
    List<Sprint> sprints = ObjectifyService.ofy()
        .load()
        .type(Sprint.class)
        .order("nom")
        .list();
    for(Sprint sprint:sprints){
%>


    <ul class="collapsible popout" data-collapsible="accordion">
        <li>
            /* active sera le sprint ayant l'etat "en cours"*/
            <div class="collapsible-header active"><i class="material-icons">filter_drama</i><a href="sprint?id=<%=sprint.id%>"><%= sprint.nom   %></a></div>
            <div class="collapsible-body"><%= sprint.etat   %><%= sprint.valeur   %><%= sprint.userstory   %></div>
        </li>
        <li>
            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
        </li>
    </ul>

<%} //Fin for
%>
        </center>
    <%}//Fin si connexion else que 1ere co
    }//Fin si connecté
    %>



<script>
    // Initialize collapse button
    $(".button-collapse").sideNav();
    // Initialize collapsible (uncomment the line below if you use the dropdown variation)
    $('.collapsible').collapsible();

    $('.button-collapse').sideNav({
                menuWidth: 240, // Default is 240
                edge: 'right', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
    );

    $(document).ready(function() {
        $('select').material_select();
    });

    // Show sideNav
    //$('.button-collapse').sideNav('show');
    // Hide sideNav
    $('.button-collapse').sideNav('hide');
    /*
    $(document).ready(function () {
        $("#submit").click(function(){
            $.post(
                    'ProfilServlet.java',
                    {
                        prenom: $("#prenom").val(),
                        nom: $("#nom").val()
                    },
            function(data){
                if(data == 'Success'){
                    $("#resultat").html("<p>Votre Profil a été modifié avec succès !</p>");
                }else{
                    $("#resultat").html("<p>Erreur</p>");
                }

            },
            'text'
            );

        });

    });

    */
</script>
</body>
</html>
