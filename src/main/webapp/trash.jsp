<%--
  Created by IntelliJ IDEA.
  User: Jérémy
  Date: 30/04/2016
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trash</title>

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css">
    <link rel="stylesheet" href="../css/icons.css">

    <script src="../js/jquery-2.2.2.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/profile.js"></script>

</head>
<body>

<%@include file="nav.jsp" %>

<center>
    <h1>Projets Supprimés</h1>
    <ul>
        <%
            List<Projet> projets = ObjectifyService.ofy()
                    .load()
                    .type(Projet.class)
                    .filter("del",1)
                    .order("nom")
                    .list();
            for(Projet projet :projets){
        %>
                <li><h3><%=projet.nom%><i class=" material-icons md-48 md-dark md-inactive right jaune" >restore_page</i></h3></li>
        <%}%>
    </ul>
</center>

</body>
</html>
