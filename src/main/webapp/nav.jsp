<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.UserService" %><%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 19/04/2016
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    UserService service = UserServiceFactory.getUserService();
    User user = service.getCurrentUser();

    String user_prenom="";
    String user_nom="";
    String user_telephone="";
    String user_email="";
    String projet_nom="projet_nom";


    Key<Profil> profilKey = Key.create(Profil.class, user.getUserId());
    Profil monProfil = ObjectifyService.ofy().load().key(profilKey).now();

    if (user != null) {


        //Créer une clef
        Key<Projet> projetKey = Key.create(Projet.class,user.getUserId());
        //Charger une entité par sa clef
        Projet monProjet = ObjectifyService.ofy().load().key(projetKey).now();

        //Créer une clef
        Key<Sprint> sprintKey = Key.create(Sprint.class,user.getUserId());
        //Charger une entité par sa clef
        Sprint monSprint = ObjectifyService.ofy().load().key(sprintKey).now();

        user_email = user.getEmail();
        //projet_nom=monProjet.getNom();
        //user_prenom=monProfil.getPrenom();  //ERREUR
        //user_prenom=monProfil.prenom; //ERREUR


    }
%>
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
                <select name="role" onchange="window.location.href=this.value;">
                    <option value="" disabled selected>Rôle</option>
                    <option value="/board.jsp">Product Owner</option>
                    <option value="http://www.yahoo.fr/">Scrum Master</option>
                    <option value="http://www.commentcamarche.net/">Développeur</option>
                </select>
            </div>
            </li>

            <li> <%
                if (user_prenom==""){%>
                <div class="input-field col s6">
                    <input id="prenom" type="text" class="validate" name="prenom">
                    <label for="prenom" data-error="wrong" data-success="right">Prénom</label>
                    <!--<i class=" registerbtn tiny material-icons " >save</i>-->
                </div>

                <%}else{%>
                <span id="prenom" class="datainfo"><%= user_prenom %></span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>
                <%}%>
            </li>

            <li><%if (user_nom==""){%>
                <div class="input-field col s6">
                    <input id="nom" type="text" class="validate" name="nom">
                    <label for="nom" data-error="wrong" data-success="right">Nom</label>
                    <i class=" registerbtn tiny material-icons " >save</i>
                </div>

                <%}else{%>
                <span id="nom" class="datainfo"><%= user_nom%></span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>
                <%}%>
            </li>


            <li><span id="email" class="datainfo"><%= user_email%></span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>
            </li>
            <li><div class="input-field col s6">
                <i class="small material-icons prefix">lock</i>
                <input type="password" id="mdp" class="validate">
                <label for="mdp" data-error="wrong" data-success="right">Mot de passe</label>
            </div>
            </li>
            <li><%if (user_telephone==""){%>
                <div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="telephone" type="tel" class="validate" name="phone">
                    <label for="telephone" data-error="wrong" data-success="right">Telephone</label>
                    <i class=" registerbtn tiny material-icons " >save</i>
                </div>
                <%}else{%>
                <!--<span id="telephone" class="datainfo"><%/* user_telephone*/%></span>
                <i class=" tiny material-icons editlink">mode_edit</i>
                <i class="savebtn tiny material-icons ">save</i>-->
                <%}%>
            </li>
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header">Projets affectés</a>
                        <div class="collapsible-body">
                            <ul id="listprojet">
                                <% List<Projet> projets = ObjectifyService.ofy()
                            .load()
                            .type(Projet.class)
                            .filter("del",0)
                            .order("nom")
                            .list();
                            for(Projet projet:projets){%>
                                <li><a href="/board.jsp?projet_nom=<%=projet.nom%>"><%= projet.nom%></a><a class="delprojet"><i class=" tiny material-icons">delete</i></a></li>
                                <%}%>
                                <li><div id="projet"><a >Projet X</a><i class=" tiny material-icons delprojet ">delete</i></div></li>
                                <li><a class="add_projet"><i class="material-icons">add_circle</i></a></li>
                                <li><i class="savebtn tiny material-icons ">save</i></li>
                            </ul>
                        </div>
                    </li>
                    <div id="resultat"></div>
                </ul>
            </li>
        </ul><%}%>

        <ul class="right hide-on-med-and-down">
            <li><a href="#!" data-activates="dropdown1"><i class="medium material-icons">settings</i></a></li>
            <ul id='dropdown1' class='dropdown-content'>
                <li><a href="#!">First</a></li>
                <li><a href="#!">Second</a></li>
                <li><a href="#!">Third</a></li>
                <li><a href="#!">Fourth</a></li>
            </ul>
            <li><a href="#!"><i class=" medium material-icons">search</i></a></li>
            <li>
                <% if (user!=null){%>
                <a href="<%=service.createLogoutURL("/index.jsp")%>" class="dropdown-button">
                    <i class=" medium material-icons">exit_to_app</i></a>
            </li>
            <%} else {%>
            <a href="<%=service.createLoginURL("/index.jsp")%>" class="dropdown-button">
                <i class="medium material-icons">input</i></a></li>
            <%}
            %>


        </ul>
        <% if (user!=null){%>
        <a href="#" data-activates="slide-out" class="button-collapse show-on-large">  <i class="medium material-icons">menu</i></a>
    </form><%}%>
</nav>

<script>
    $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 240
                edge: 'left', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
    );

        $('select').material_select();



    /*
    $(".savebtn").on("click", function(e){
        e.preventDefault();
        var elink   = $(this).prev(".editlink");
        var dataset = elink.prev(".datainfo");
        var newid   = dataset.attr("id");

        var cinput  = "#"+newid+"-form";
        var einput  = $(cinput);
        var newval  = einput.attr("value");

        $(this).css("display", "none");
        einput.remove();
        dataset.html(newval);

        elink.css("display", "inline-block");
    });
    */

</script>

