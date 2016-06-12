/**
 * Created by Jérémy on 09/05/2016.
 */

/*Supprimer un projet  */
$('.delprojet').click(function(event){
    event.preventDefault();
    $projet_id=$(this).parent('div').attr('id');
    $projet_nom=$(this).prev('a').text();
    alert($projet_nom);

    $.get({
        url:'DelServlet',
        datatype:'json',
        data:{projet_id:$projet_id,projet_nom:$projet_nom},

    })

    $('#'+$projet_id).fadeToggle();
    Materialize.toast($projet_nom+" supprimé !", 3000);

})





/*Supprimer un sprint */
$(".delsprint").click(function(event){

    event.preventDefault();
    $sprint_id = $(this).closest('li').attr('id');
    $sprint_nom = $(this).closest('#sprint_nom').text();

    alert($sprint_id);
    alert($sprint_nom);

    $.get({
        url: 'DelServlet',
        datatype: 'json',
        data: {sprint_id: $sprint_id, sprint_nom: $sprint_nom},

    })

    $(this).closest('li').fadeToggle();
    Materialize.toast($sprint_nom + " supprimé !", 3000);
})

/*Supprimer une tache */
$(".deluserstory").click(function(event){

    event.preventDefault();
    $userstory_id = $(this).closest('li').attr('id');
    $userstory_nom = $(this).closest('#userstory_nom').text();
    alert($userstory_id);
    alert($userstory_nom);
    $.get({
        url: 'DelServlet',
        datatype: 'json',
        data: {userstory_id: $userstory_id, userstory_nom: $userstory_nom},

    })

    $(this).closest('li').fadeToggle();
    Materialize.toast($userstory_nom + " supprimé !", 3000);
})


/*Supprimer une tache */
$(".deltache").click(function(event){

    event.preventDefault();
    $tache_id = $(this).closest('li').attr('id');
    $tache_nom = $(this).closest('#tache_nom').text();

    $.get({
        url: 'DelServlet',
        datatype: 'json',
        data: {tache_id: $tache_id, sprint_nom: $tache_nom},

    })

    $(this).closest('li').fadeToggle();
    Materialize.toast($tache_nom + " supprimé !", 3000);
})

