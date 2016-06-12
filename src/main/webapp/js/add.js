/**
 * Created by Jérémy on 09/05/2016.
 */

/**Ajouter un projet**/
/*ByProfile*/
$('#newprojet').click(function(){
    $('#projet_list').append($('<input id="addprojet_nom">'));
    $(this).css("display", "none");
    $('#addprojet').css("display","block");
})
/*Valider et Enregister un Projet*/
$('#addprojet').click(function(){
    event.preventDefault();
    $addprojet_nom=$('#addprojet_nom').val();
    $attribut = $('#attribut').val();
    $parent=$('#user_id').val();

    $.get({
        url:'AddServlet',
        datatype:'json',
        data:{addprojet_nom:$addprojet_nom,parent:$parent},

    })
    $('#addprojet_nom').css("display","none");
    alert($attribut);
    $('#projet_list').append($("<a id='projet_nom' href='/board.jsp?projet="+$addprojet_nom+"&projet_id="+$attribut+"'>"+$addprojet_nom+"</a><i id='delprojet' class='right delprojet tiny material-icons rouge pointer'>clear</i>")).fadeIn();


    $(this).css("display", "none");
    $('#newprojet').css("display","block");


    Materialize.toast($addprojet_nom+" crée !", 3000);

});

/** SPRINT **/
$('#newsprint').click(function(){
   var $addsprint_form='<li id="addsprint_form"><div class="collapsible-header">' +
        '<i class="material-icons">place</i> <h3>Sprint: <input id="addsprint_nom" style="width: 6em;" placeholder="Nom"><input id="addsprint_valeur" style="float: left;width: 45px;" placeholder="Valeur"><a id="delete"><i class=" tiny material-icons md-dark md-inactive right rouge" >clear</i></a>' +
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
        '</div>--></li>';
    $('#sprint_list').append($addsprint_form);
    $(this).css("display", "none");
    $('#addsprint').css("display","block");
})
/*Valider et Enregister un Sprint*/
$('#addsprint').click(function(){
    event.preventDefault();
    $addsprint_nom=$('#addsprint_nom').val()
    $addsprint_valeur=$('#addsprint_valeur').val()
    $parentprojet=$('#parentprojet').val();
    alert($addsprint_nom);

    $.get({
        url:'AddServlet',
        datatype:'json',
        data:{addsprint_nom:$addsprint_nom,addsprint_valeur:$addsprint_valeur,parentprojet:$parentprojet},

    })

    $('#addsprint_form').css("display","none");

    $('#sprint_list').append($("<li id='"+$addsprint_nom+"' class='item-S clear'>" +
        "<div class='collapsible-header'>"+
        "<i class='material-icons'>directions_run</i><h3>"+
        "<span class='left' id='sprint_valeur'>"+$addsprint_valeur+"</span>"+
        "Sprint: <span id='sprint_nom'>"+$addsprint_nom+"</span></h3>"+
        "</div>")).fadeIn();
    $(this).css("display", "none");
    $('#newsprint').css("display","block");
    Materialize.toast($addsprint_nom+" crée !", 3000);


});

/** USERSTORY**/

$('.newuserstory').click(function(){
    var $adduserstory_form='<li id="adduserstory_form"><div class="userstory collapsible-header clear" style="border: solid 1px darkgrey;" >'+
        '<h4>User Story :'+
        '<input id="adduserstory_nom" ><input id="adduserstory_valeur" style="float: left;width: 50px;" placeholder="Valeur"></h4>'+
        '</div></li>';

    $('.userstory_list').parent().append($adduserstory_form);
    $(this).css("display", "none");
    $('.adduserstory').css("display","block");
})

/*Valider et Enregister un US*/

$('.adduserstory').click(function(){
    event.preventDefault();
    $adduserstory_nom=$('#adduserstory_nom').val();
    $adduserstory_valeur=$('#adduserstory_valeur').val();
    $adduserstory_description=$('#adduserstory_description').val();
    $adduserstory_etat=$('#adduserstory_etat').val();
    $adduserstory_priorite=$('#adduserstory_priorite').val();

    $parentsprint=$('.item-S').attr('id');

    alert($adduserstory_nom);
    alert($adduserstory_valeur);
    $.get({
        url:'AddServlet',
        datatype:'json',
        data:{adduserstory_nom:$adduserstory_nom,adduserstory_valeur:$adduserstory_valeur,parentsprint:$parentsprint},

    })

    $('#adduserstory_form').css("display","none");

    $('#userstory_list').append($(
        "<li id='userStory.id' class='item-US' style='display: inline-block;'>"+
        "<div class='userstory ' style='display: inline-block;border: solid 1px darkgrey;' >"+
        "<h4><span class='left'>"+$adduserstory_valeur+"</span>"+
        " User Story:"+$adduserstory_nom+"<i  class='delsprint tiny material-icons md-dark md-inactive right rouge' >clear</i>"+
        "</h4></div></li>")).fadeIn();

    $('.adduserstory').css("display", "none");
    $('.newuserstory').css("display","block");
    Materialize.toast($adduserstory_nom+" crée !", 3000);
});

/**TACHE**/
$('.newtache').click(function(){
    var $addtache_form='<li id="addtache_form"><div class="task collapsible-header">'+
        '<h5 ><span  >Tâche:<input id="addtache_nom" ></span>'+
        '</h5></div></li>';

    $(this).closest('li').children().children().last().append($addtache_form);
    $(this).css("display", "none");
    $('.addtache').css("display","block");
});
/*Valider et Enregister un Sprint*/

$('.addtache').click(function(){
    event.preventDefault();
    $parentuserstory=$('.item-US').attr('id');

    $addtache_nom=$('#addtache_nom').val();
    alert($addtache_nom);
    alert($parentuserstory);
    $.get({
        url:'AddServlet',
        datatype:'json',
        data:{addtache_nom:$addtache_nom,parentuserstory:$parentuserstory},

    })
    //$('#addtache_form').after($("<span>"+$addtache_nom+"</span>")).css('display','none');
    $('#addtache_form').css("display","none");
    $(this).before($('<li><div class="task collapsible-header">'+
        '<h5 ><span  >Tâche:'+$addtache_nom+'</span>'+
        '</h5></div></li>')).fadeIn();
    $('.addtache').css("display", "none");
    $('.newtache').css("display","block");
    Materialize.toast($addtache_nom+" crée !", 3000);
});

/****/
