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
<%@ page import="com.googlecode.objectify.LoadResult" %><%--
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

    String projet_nom="projet_nom";
    String user_id=user.getUserId();


    //Récupération Profil
    Profil monProfil = ObjectifyService.ofy().load().type(Profil.class).id(user_id).now();
    String user_role=monProfil.role;
    String user_prenom=monProfil.prenom;
    String user_nom=monProfil.nom;
    String user_telephone=monProfil.phone;
    String user_email=monProfil.email;


    if (user != null) {

        user_email = user.getEmail();

    }
%>
<nav>
    <% if (user !=null){%>
        <input id="user_id" type="hidden" value="<%= user_id%>">
        <ul id="slide-out" class="side-nav" style="color:grey;">
            <div style="float: right;">
            <i id="editprojet" class="material-icons md-36 md-dark md-inactive bleu pointer editlink">mode_edit</i>
            <i id="saveprojet" class="material-icons md-36 md-dark md-inactive pointer bleu" style="display: none;">save</i>
            </div>
            <li><i class="material-icons md-dark md-inactive md-60">account_circle</i></a>
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
            <li><% if (user_role==null){%>
                <!--<div class="input-field col s12">
                <select id="datarole" > <!--onchange="window.location.href=this.value;"
                    <option  disabled selected>Rôle</option> value="pour lien"
                    <option >Product Owner</option>
                    <option >Scrum Master</option>
                    <option >Développeur</option>
                </select>
                </div>-->
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
                        <a class="collapsible-header">Projets affectés</a>
                        <div class="collapsible-body">
                            <ul id="projet_list">
                                <% List<Projet> projets = ObjectifyService.ofy()
                                        .load()
                                        .type(Projet.class)
                                        /*.ancestor(monProfil)*/
                                        .filter("del",0)
                                        .order("nom")
                                        .list();
                            for(Projet projet:projets){%>
                                <li><div id="<%=projet.id%>">
                                        <a id="projet_nom" href="/board.jsp?projet_nom=<%=projet.nom%>">
                                            <%= projet.nom%>
                                        </a>

                                        <i id="delprojet" class=" delprojet tiny material-icons rouge pointer">clear</i>

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
            <li><a href="/trash.jsp" data-activates="dropdown1"><i class="medium material-icons">delete</i></a></li>
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
    <%}%>
</nav>

<script>
    $('.button-collapse').sideNav({
                menuWidth: 300, // Default is 240
                edge: 'left', // Choose the horizontal origin
                closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
            }
    );






    /*Modifier le profil*/
    var newrole_val = "";

    $("#editprojet").on("click", function(e){
        e.preventDefault();
        var datarole = $(("#datarole"));
        var dataprenom = $(("#dataprenom"));
        var datanom = $(("#datanom"));
        var datamail = $(("#datamail"));
        var dataphone = $(("#dataphone"));

        var role_id   = datarole.attr("id");
        var newrole_id   = role_id+"-form";
        var prenom_id   = dataprenom.attr("id");
        var newprenom_id   = prenom_id+"-form";
        var nom_id   = datanom.attr("id");
        var newnom_id   = nom_id+"-form";
        var mail_id   = datamail.attr("id");
        var newmail_id   = mail_id+"-form";
        var phone_id   = dataphone.attr("id");
        var newphone_id   = phone_id+"-form";


        var role_val = datarole.text();
        var prenom_val = dataprenom.text();
        var nom_val = datanom.text();
        var mail_val = datamail.text();
        var phone_val = dataphone.text();

        datarole.empty();
        dataprenom.empty();
        datanom.empty();
        datamail.empty();
        dataphone.empty();


        $('select').material_select();
        $('<div class="input-field col s12"><select id="'+newrole_id+'" selected="role_val" >'+
                '<option  disabled selected>Rôle</option>'+
                '<option >Product Owner</option>'+
                '<option >Scrum Master</option>'+
                '<option >Développeur</option>'+
                '</select></div>').appendTo(datarole);
        $('<input type="text" name="'+newprenom_id+'" id="'+newprenom_id+'" value="'+prenom_val+'" class="hlite">').appendTo(dataprenom);
        $('<input type="text" name="'+newnom_id+'" id="'+newnom_id+'" value="'+nom_val+'" class="hlite">').appendTo(datanom);
        $('<input type="text" name="'+newmail_id+'" id="'+newmail_id+'" value="'+mail_val+'" class="hlite">').appendTo(datamail);
        $('<input type="text" name="'+newphone_id+'" id="'+newphone_id+'" value="'+phone_val+'" class="hlite">').appendTo(dataphone);
        $(this).css("display", "none");
        $('#saveprojet').css("display","block");
    });
    /*Valider & Sauvegarder*/
    $("#saveprojet").on("click", function(e){
        e.preventDefault();
        $("select").change(function () {

            $("select option:selected").each(function () {
                newrole_val += $(this).text();
                alert(newrole_val+"a");
            });

        })
        var user_id = $(("#user_id")).val();
        alert(user_id);

        var dataprenom = $(("#dataprenom"));
        var datarole = $(("#datarole"));
        var datanom = $(("#datanom"));
        var datamail = $(("#datamail"));
        var dataphone = $(("#dataphone"));


        var newprenom_id   = dataprenom.attr("id");
        var newrole_id   = datarole.attr("id");
        var newnom_id   = datanom.attr("id");
        var newmail_id   = datamail.attr("id");
        var newphone_id   = dataphone.attr("id");

        var role_input  = "#"+newrole_id+"-form";
        var prenom_input  = "#"+newprenom_id+"-form";
        var nom_input  = "#"+newnom_id+"-form";
        var mail_input  = "#"+newmail_id+"-form";
        var phone_input  = "#"+newphone_id+"-form";

        var newrole_input  = $(role_input);
        var newprenom_input  = $(prenom_input);
        var newnom_input  = $(nom_input);
        var newmail_input  = $(mail_input);
        var newphone_input  = $(phone_input);

        var newrole_val  = newrole_input.val();
        var newprenom_val  = newprenom_input.val();
        var newnom_val  = newnom_input.val();
        var newmail_val  = newmail_input.val();
        var newphone_val  = newphone_input.val();

        alert(newrole_val);
        alert(newnom_val);

        newrole_input.remove();
        newprenom_input.remove();
        newnom_input.remove();
        newmail_input.remove();
        newphone_input.remove();


        datarole.html(newrole_val);
        dataprenom.html(newprenom_val);
        datanom.html(newnom_val);
        datamail.html(newmail_val);
        dataphone.html(newphone_val);

        $(this).css("display", "none");
        $('#editprojet').css("display","block");

        /*Enregistrer le profil*/
        $.get({
            url:'ProfilServlet',
            datatype:'json',
            data:{user_id:user_id,profil_role:newrole_val,profil_prenom:newprenom_val,profil_nom:newnom_val,profil_email:newmail_val,profil_phone:newphone_val}, ///

        })

    });

    /*Créer un projet*/
    $('#newprojet').click(function(){
        $('#projet_list').append($('<input id="addprojet_nom">'));
        $(this).css("display", "none");
        $('#addprojet').css("display","block");
    })
    /*Valider et Enregister un Projet*/
    /*Valider  input to span*/
    /*Enregistrer BDD via Servlet*/
    $('#addprojet').click(function(){


        event.preventDefault();
        $addprojet_nom=$('#addprojet_nom').val()

        alert($addprojet_nom);
        $.get({
            url:'AddServlet',
            datatype:'json',
            data:{addprojet_nom:$addprojet_nom,},

        })

        $(this).css("display", "none");
        $('#newprojet').css("display","block");
        Materialize.toast($addprojet_nom+" crée !", 3000);

    });

    /*Supprimer un projet OK */
        $('.delprojet').click(function(event){
            console.log("del");
            event.preventDefault();
            $projet_id=$(this).parent('div').attr('id');
            $projet_nom=$(this).prev('a').text();
            alert($projet_id);
            alert($projet_nom);

            $.get({
                url:'DelServlet',
                datatype:'json',
                data:{projet_id:$projet_id,projet_nom:$projet_nom},

            })

            $('#'+$projet_id).fadeToggle();
            Materialize.toast($projet_nom+" supprimé !", 3000);

        })

</script>


