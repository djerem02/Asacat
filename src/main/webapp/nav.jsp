<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="m1.projet3.Profil" %>
<%@ page import="m1.projet3.Projet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.googlecode.objectify.LoadResult" %>
<%@ page import="com.google.appengine.repackaged.com.google.common.base.Flag" %><%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 19/04/2016
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserService service = UserServiceFactory.getUserService();
    User user = service.getCurrentUser();
%>

<nav>
    <%
    if(request.getAttribute("id") != null){
    String attribut = (String) request.getAttribute("id");%>
    <input id="attribut" type="hidden" value="<%= attribut%>">
    <%}
    %>


    <h1 style="position: absolute;left: 40%;top:0;margin: 0">
        Asacat
        <i class="material-icons  md-60">pets</i>
    </h1>
    <% if (user !=null) {
        String user_id=user.getUserId();

        //Récupération Profil

        Profil monProfil = ObjectifyService.ofy().load().type(Profil.class).id(user_id).now();
        String user_role = monProfil.role;
        String user_prenom = monProfil.prenom;
        String user_nom = monProfil.nom;
        String user_telephone = monProfil.phone;
        String user_email = monProfil.email;

    %>
    <input type="hidden" id="user_id" value="<%= user_id%>"/>
    <ul id="slide-out" class="side-nav" style="color:grey;">
        <div style="float: right;">
            <i id="editprofil" class="material-icons md-36 md-dark md-inactive bleu pointer editlink">mode_edit</i>
            <i id="saveprofil" class="material-icons md-36 md-dark md-inactive pointer bleu" style="display: none;">save</i>
        </div>
        <li><i class="material-icons md-dark md-inactive md-60">account_circle</i>

        </li>
        <li><% if (user_role==null){%>
            <span id="datarole">Rôle</span>
            <%}else{%>
            <span id="datarole"><%= monProfil.role%></span>
            <%}%>
        </li>

        <li><%if (user_prenom==null){%>
            <span id="dataprenom">Prenom</span>
            <%}else{%>
            <span id="dataprenom" ><%= monProfil.prenom %></span>
            <%}%>
        </li>

        <li><%if (user_nom ==null){%>
            <span id="datanom" >Nom</span>
            <%}else{%>
            <span id="datanom"><%= monProfil.nom%></span>
            <%}%>
        </li>
        <li>
            <span id="datamail" ><%= user_email%></span>
        </li>

        <li><%if (user_telephone==null){%>
            <span id="dataphone">Telephone</span>
            <%}else{%>
            <span id="dataphone"><%= user_telephone%></span>
            <%}%>
        </li>
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header"><i class="tiny material-icons pointer">folder</i>Projets affectés</a>
                    <div class="collapsible-body">
                        <ul id="projet_list">
                            <% List<Projet> projets = ObjectifyService.ofy()
                                    .load()
                                    .type(Projet.class)
                                        /*.ancestor(monProfil)*/
                                    .filter("del",0)
                                    .filter("parentprofil",user_id)
                                    .order("nom")
                                    .list();
                                for(Projet projet:projets){%>
                            <li><div id="<%=projet.id%>">
                                <a id="projet_nom" href="/board.jsp?projet_nom=<%=projet.nom%>&projet_id=<%=projet.id%>">
                                    <%= projet.nom%>
                                </a>

                                <i id="delprojet" class="right delprojet tiny material-icons rouge pointer">clear</i>

                            </div>
                            </li>
                            <%}%>

                        </ul>
                        <i id="newprojet" class="material-icons md-dark md-inactive pointer">add_circle</i>
                        <i  id="addprojet" class="material-icons md-dark md-inactive pointer bleu md-24 pointer" style="display: none;">send</i>

                    </div>
                </li>
                <div id="resultat"></div>
            </ul>
        </li>
    </ul><%}%>

    <ul class="right hide-on-med-and-down">
        <li><a href="/trash.jsp" data-activates="dropdown1"><i class="medium material-icons">archive</i></a></li>
        <li><a href="/stats.jsp"><i class=" medium material-icons">insert_chart</i></a></li>
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
    <%}%>
</nav>

<script>
    $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 240
                edge: 'left', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
    );

</script>

<script src="../js/add.js"></script>
<script src="../js/edit.js"></script>
<script src="../js/del.js"></script>
